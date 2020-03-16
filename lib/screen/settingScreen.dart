import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:qms_device/bloc/blocSetting.dart';
import 'package:qms_device/data/databaseHelper.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/model/setting.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/model/skinPack.dart';


class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  DatabaseHelper _db = DatabaseHelper();
  io.File _skinPackFile;
  io.File _skinPackSingleTenant;
  TextEditingController _cntrlZipFile = TextEditingController();
  TextEditingController _cntrlSkinpackSingleTenant = TextEditingController();
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
    blocSetting.changeSetting(
      Setting(
        qmsType: _dropdownValue
      )
    );
    await _db.updateSetting(
      Setting(
        id: 1,
        qmsType: _dropdownValue
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
          height: SizeConfig.safeBlockVertical * 5,
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
          height: SizeConfig.safeBlockVertical * 5,
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
          height: SizeConfig.safeBlockVertical * 5,
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

  @override
  void initState() {
    _db.getSetting().then((data){
      if(data != null){
        setState(() {
          _dropdownValue = data.qmsType;
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
          //_saveImage();
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
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}