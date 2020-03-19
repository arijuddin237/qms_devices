import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:qms_device/bloc/blocOrder.dart';
import 'package:qms_device/bloc/blocSetting.dart';
import 'package:qms_device/data/databaseHelper.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/model/setting.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/model/skinPack.dart';
import 'package:qms_device/service/orderService.dart';


class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _formKeyProxyHost = GlobalKey<FormState>();
  final _formKeyOrdersProxyPort = GlobalKey<FormState>();
  final _formKeyDevicesProxyPort = GlobalKey<FormState>();
  final _formKeyInputTenantId = GlobalKey<FormState>();

  DatabaseHelper _db = DatabaseHelper();
  io.File _skinPackFile;
  io.File _skinPackSingleTenant;
  TextEditingController _cntrlZipFile = TextEditingController();
  TextEditingController _cntrlSkinpackSingleTenant = TextEditingController();
  TextEditingController _cntrlProxyHost = TextEditingController();
  TextEditingController _cntrlOrderProxyPort = TextEditingController();
  TextEditingController _cntrlDeviceProxyPort = TextEditingController();
  TextEditingController _cntrlTenantId = TextEditingController();
  String _dropdownValue;

  Future _openFileExplorer() async {
    try {
      var file = await FilePicker.getFile(
        fileExtension: '.zip'
      );
      return file;
    } catch (e) {
      print(e.toString());
    }
  }

  Future _checkFile(String folderPath) async {
    io.Directory checkDirectory = io.Directory('$path/$folderPath');
    return checkDirectory.exists();
  }

  Future _deleteImage() async{ //-TODO: jumat : Kembali lagi ke cara ini
    orderProxyHost = _cntrlProxyHost.text;
    orderProxyPort = int.parse(_cntrlOrderProxyPort.text);
    blocSetting.changeSetting(
      Setting(
        qmsType: _dropdownValue,
        host: _cntrlProxyHost.text,
        ordersPort: int.parse(_cntrlOrderProxyPort.text),
        tenantId: _cntrlTenantId.text
      )
    );
    await _db.updateSetting(
      Setting(
        id: 1,
        qmsType: _dropdownValue,
        host: _cntrlProxyHost.text,
        ordersPort: int.parse(_cntrlOrderProxyPort.text),
        devicesPort: 0,
        tenantId: _cntrlTenantId.text
      )
    );
    if(_skinPackFile != null){
      _checkFile('skinpack').then((data){
        if(data){
          final dir = io.Directory('$path/skinpack');
          dir.deleteSync(recursive: true);
        }
        _saveImage();
      });
    }

    if(_skinPackSingleTenant != null){
      _checkFile('skinpackSingleTenant').then((data){
        if(data){
          final dir = io.Directory('$path/skinpackSingleTenant');
          dir.deleteSync(recursive: true);
        }
        _saveImage();
      });
    }
  }

  Future _saveImage() async {
    if(_skinPackFile != null){
      final bytes = _skinPackFile.readAsBytesSync();
      final archive = ZipDecoder().decodeBytes(bytes);
      for (var file in archive) {
        final fileName = file.name;
        final skinPackImage = await file.content as List<int>;
        io.File('$path/skinpack/$fileName')
          ..createSync(recursive: true)
          ..writeAsBytesSync(skinPackImage);
        await _db.clearSkinPack();
        await _db.saveSkinPack(
          SkinPack(
            imageName: fileName
          )
        );
        print(fileName);
      }
    }

    if(_skinPackSingleTenant != null){
      final bytes = _skinPackSingleTenant.readAsBytesSync();
      final archive = ZipDecoder().decodeBytes(bytes);
      for (var file in archive) {
        final fileName = file.name;
        final skinPackImage = await file.content as List<int>;
        io.File('$path/skinpackSingleTenant/$fileName')
          ..createSync(recursive: true)
          ..writeAsBytesSync(skinPackImage);
        await _db.clearSkinPackSingleTenant();
        await _db.saveSkinPakcSingleTenant(
          SkinPack(
            imageName: fileName
          )
        );
      }
    }
  }

  Widget rowInputZipFile(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Choose Skinpack Multi Tenant Zip', style: TextStyle(
          fontSize: 20
        )),
        Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          height: SizeConfig.safeBlockVertical * 8,
          child: TextField(
            readOnly: true,
            controller: _cntrlZipFile,
            decoration: InputDecoration(
              labelText: 'Skinpack File',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(Icons.add_box),
                onPressed: (){
                  _openFileExplorer().then((data){
                    _cntrlZipFile.text = data == null ? '' : basename(data.path);
                    setState(() {
                      _skinPackFile = data;
                    });
                  });
                },
              )
            ),
          ),
        ),
      ],
    );
  }

  Widget rowInputSkinpackSingletenant(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Choose Skinpack Single Tenant Zip', style: TextStyle(
          fontSize: 20
        )),
        Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          height: SizeConfig.safeBlockVertical * 8,
          child: InkWell(
            child: TextField(
              readOnly: true,
              controller: _cntrlSkinpackSingleTenant,
              decoration: InputDecoration(
                labelText: 'Skinpack File',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add_box),
                  onPressed: (){
                    _openFileExplorer().then((data){
                      _cntrlSkinpackSingleTenant.text = data == null ? '' : basename(data.path);
                      setState(() {
                        _skinPackSingleTenant = data;
                      });
                    });
                  },
                )
              ),
            ),
            onTap: (){
              _openFileExplorer().then((data){
                _cntrlSkinpackSingleTenant.text = data == null ? '' : basename(data.path);
                setState(() {
                  _skinPackSingleTenant = data;
                });
              });
            },
          ),
        )
      ],
    );
  }

  Widget rowDropDownQmsType(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Select QMS Type', style: TextStyle(
          fontSize: 20
        )),
        Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          height: SizeConfig.safeBlockVertical * 8,
          child: DropdownButton<String>(
            value: _dropdownValue,
            onChanged: (String newValue){
              setState(() {
                _dropdownValue = newValue;
              });
            },
            items: qmsType
              .map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  width: SizeConfig.safeBlockHorizontal * 33,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(value, style: TextStyle(
                      fontSize: 16
                    )),
                  ),
                ),
              );
            }).toList()
          ),
        )
      ],
    );
  }

  /*Widget rowDropdownSelectTenant(){
        return Container(
          child: StreamBuilder<List<List<Order>>>(
            stream: blocOrders.ordersQueue.stream,
            builder: (context, snapshotOrder){
              if(!snapshotOrder.hasData){
                return Container();
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Select Tenant ID', style: TextStyle(
                    fontSize: 20
                  )),
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 35,
                    height: SizeConfig.safeBlockVertical * 5,
                    child: StreamBuilder<List<Order>>(
                      stream: blocDropdownSetting.getTenants.stream,
                      builder: (context, snapshotDrop){
                        return DropdownButton<List<Order>>(
                          value: snapshotDrop.data,
                          items: snapshotOrder.data.map((value){
                            return DropdownMenuItem(
                              value: value,
                              child: Container(
                                width: SizeConfig.safeBlockHorizontal * 33,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(value[0].tenantId, style:TextStyle(
                                    fontSize: 16
                                  )),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue){
                            blocDropdownSetting.changeValueDropdown(newValue);
                          },
                        );
                      },
                    ),
                  )
                ],
              );
            },
          ),
        );
  }*/

  Widget rowInputTenantId(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Tenant ID', style: TextStyle(
          fontSize: 20
        )),
        Form(
          key: _formKeyInputTenantId,
          child: Container(
            width: SizeConfig.safeBlockHorizontal * 35,
            height: SizeConfig.safeBlockVertical * 8,
            child: TextFormField(
              controller: _cntrlTenantId,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tenant ID'
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget rowInputProxyHost(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Proxy Host', style: TextStyle(
          fontSize: 20
        )),
        Form(
          key: _formKeyProxyHost,
          child: Container(
            width: SizeConfig.safeBlockHorizontal * 35,
            height: SizeConfig.safeBlockVertical * 8,
            child: TextFormField(
              controller: _cntrlProxyHost,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Proxy Host'
              ),
              validator: (value){
                if(value.length == 0){
                  return 'Empty Proxy Host';
                }
                return null;
              },
            ),
          ),
        )
      ],
    );
  }

  Widget rowInputOrderProxyPort(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Orders Proxy Port', style: TextStyle(
          fontSize: 20
        )),
        Container(
          width: SizeConfig.safeBlockHorizontal * 35,
          height: SizeConfig.safeBlockVertical * 8,
          child: Form(
            key: _formKeyOrdersProxyPort,
            child: TextFormField(
              controller: _cntrlOrderProxyPort,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Orders Proxy Port'
              ),
              validator: (value){
                if(value.length == 0){
                  return 'Empty Orders Proxy Port';
                }
                return null;
              },
            ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    _db.getSetting().then((data){
      if(data != null){
        setState(() {
          _dropdownValue = data.qmsType;
          _cntrlProxyHost.text = data.host;
          _cntrlOrderProxyPort.text = data.ordersPort.toString();
          _cntrlDeviceProxyPort.text = data.devicesPort.toString();
          _cntrlTenantId.text = data.tenantId;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Setting'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: rowInputTenantId(),
          ),
          Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: rowDropDownQmsType(),
          ),
          Divider(
            color: Colors.black
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: rowInputZipFile(),
          ),
          Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: rowInputSkinpackSingletenant(),
          ),
          Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: rowInputProxyHost(),
          ),
          Divider(
            color: Colors.black
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: rowInputOrderProxyPort(),
          )
        ],
      ),
      floatingActionButton: RaisedButton(
        color: Colors.orange,
        child: Container(
          width: SizeConfig.safeBlockHorizontal * 30,
          height: SizeConfig.safeBlockVertical * 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Save Setting', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )),
            ],
          ),
        ),
        onPressed: (){
          if(_formKeyProxyHost.currentState.validate() && _formKeyOrdersProxyPort.currentState.validate()){
            OrderService().initialize();
            blocOrders.clearBloc();
            _deleteImage().then((data){
              showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    content: Row(
                      children: <Widget>[
                        Text('Success change settings', style: TextStyle(
                          fontSize: 25
                        )),
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Close'),
                        onPressed: (){
                        Navigator.pop(context);
                        },
                      )
                    ],
                  );
                }
              );
            });
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}