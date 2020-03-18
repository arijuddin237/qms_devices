import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocSetting.dart';
import 'package:qms_device/data/databaseHelper.dart';
import 'package:qms_device/model/setting.dart';
import 'package:qms_device/screen/qmsTest3.dart';
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
  String qmsType;
  final String _password = 'testPassword';

  void _showDialogPassword(){
    _cnrtlPassword.text = "";
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Input Password'),
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
              child: Text('Process'),
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

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    final double appBarHeight = kToolbarHeight;
    final double paddingTop = mediaQueryData.padding.top;
    final double paddingBottom = mediaQueryData.padding.bottom;
    final double heightScreen = mediaQueryData.size.height - paddingBottom - paddingTop - appBarHeight;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Dashboard'),
      ),
      body: StreamBuilder<Setting>(
        stream: blocSetting.subject.stream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            qmsType = snapshot.data.qmsType;
          }
          return SafeArea(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              children: <Widget>[
                InkWell(
                  child: Container(
                    color: Colors.yellowAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        //mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.assignment, size: 120,),
                          Text('QMS', style: TextStyle(
                            fontSize: 100
                          ))
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    if(qmsType == 'Multi Tenant'){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => QmsTest3()
                      ));
                    } else {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SingleTenant()
                      ));
                    }
                  },
                ),
                InkWell(
                  child: Container(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        //mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.list, size: 120,),
                          Text('Calling Order', style: TextStyle(
                            fontSize: 100
                          ))
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CallingOrder()
                    ));
                  },
                ),
                InkWell(
                  child: Container(
                    color: Colors.brown,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        //mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.settings, size: 120,),
                          Text('Settings', style: TextStyle(
                            fontSize: 100
                          ))
                        ],
                      ),
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