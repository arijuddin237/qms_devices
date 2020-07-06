import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qms_device/bloc/blocFontSize.dart';
import 'package:qms_device/bloc/blocSetting.dart';
import 'package:qms_device/data/databaseHelper.dart';
import 'package:qms_device/model/setting.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/screen/homeScreen.dart';
import 'package:qms_device/screen/testScreen.dart';
import 'package:qms_device/service/orderService.dart';
import 'package:qms_device/service/orderService2.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void _handlerTapEvent() async {
    Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => TestScreen()));
  }

  void _getPath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    path = documentsDirectory.path;
  }

  void _setQmsType() async {
    DatabaseHelper().getSetting().then((data){
      orderProxyHost = data.host;
      orderProxyPort = data.ordersPort;
      blocSetting.changeSetting(
        Setting(
          qmsType: data.qmsType,
          host: data.host,
          ordersPort: data.ordersPort,
          devicesPort: data.devicesPort,
          tenantId: data.tenantId,
          runningText: data.runningText
        )
      );
      OrderService().initialize();
      OrderService2().initialize();
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    _getPath();
    _setQmsType();
  }
  @override
  Widget build(BuildContext context) {
    blocFontSize.changeFontSize(context);
    SizeConfig().init(context);
    Future.delayed(const Duration(seconds: 2), _handlerTapEvent);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(

          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .8
            ),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}