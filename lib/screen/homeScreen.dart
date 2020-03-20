import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocSetting.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/model/setting.dart';
import 'package:qms_device/screen/multiTenant.dart';
import 'package:qms_device/screen/settingScreen.dart';
import 'package:qms_device/screen/singleTenant.dart';
import 'package:qms_device/screen/callingOrder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _cnrtlPassword = TextEditingController();
  //String qmsType;
  final String _password = 'testPassword';

  void _showDialogPassword(){
    _cnrtlPassword.text = "";
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Input Password', style: TextStyle(
            fontSize: 30
          )),
          content: Container(
            child: Form(
              key: _formKey,
              child: TextFormField(
                obscureText: true,
                controller: _cnrtlPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                validator: (value){
                  if(value != _password && value.length > 0){
                    _cnrtlPassword.text = '';
                    return 'Wrong Password';
                  } else if(value.length == 0){
                    return 'Empty Password';
                  }
                  return null;
                },
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Process', style: TextStyle(
                fontSize: 20
              )),
              onPressed: (){
                if(_formKey.currentState.validate()){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SettingScreen()
                  ));
                }
              },
            )
          ],
        );
      }
    );
  }

  void _showDialogAlert(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          content: Text('Please Insert Tenant ID at Menu Settings',style: TextStyle(
            fontSize: 30
          )),
          actions: <Widget>[
            FlatButton(
              child: Text('Close', style: TextStyle(
                fontSize: 20
              )),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Dashboard'),
      ),
      body: StreamBuilder<Setting>(
        stream: blocSetting.subject.stream,
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Container();            
          }
          return SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal * (100/3),
                    height: SizeConfig.safeBlockVertical * 100,
                    color: (snapshot.data.qmsType == qmsType[1])
                      ? Colors.yellowAccent
                      : (snapshot.data.tenantId != null && snapshot.data.tenantId.length > 0)
                      ? Colors.yellowAccent : Colors.grey,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.assessment, size: 120),
                        Text('QMS', style: TextStyle(
                          fontSize: 100
                        ))
                      ],
                    ),
                  ),
                  onTap: (){
                    (snapshot.data.qmsType == qmsType[1]) 
                      ? Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MultiTenant()
                      ))
                      : (snapshot.data.tenantId != null && snapshot.data.tenantId.length > 0)
                      ? Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SingleTenant()
                      ))
                      : _showDialogAlert();
                  },
                ),
                InkWell(
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal * (100/3),
                    height: SizeConfig.safeBlockVertical * 100,
                    color: (snapshot.data.tenantId != null && snapshot.data.tenantId.length > 0)
                      ? Colors.greenAccent
                      : Colors.grey,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.list, size: 120),
                        Text('Calling Order', style: TextStyle(
                          fontSize: 80
                        ))
                      ],
                    ),
                  ),
                  onTap: (){
                    (snapshot.data.tenantId != null && snapshot.data.tenantId.length > 0)
                      ? Navigator.push(context, MaterialPageRoute(
                          builder: (context) => CallingOrder()
                        ))
                      : _showDialogAlert();
                  },
                ),
                InkWell(
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal * (100/3),
                    height: SizeConfig.safeBlockVertical * 100,
                    color: Colors.amber,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.settings, size: 120),
                        Text('Setting', style: TextStyle(
                          fontSize: 100
                        ))
                      ],
                    ),
                  ),
                  onTap: (){
                    _showDialogPassword();
                  },
                )
              ],
            ),
          );
        }
      )
    );
  }
}