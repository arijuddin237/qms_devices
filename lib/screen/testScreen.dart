import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:qms_device/bloc/blocConnectivity.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/service/orderService.dart';
import 'package:qms_device/service/orderService2.dart';
import 'package:qms_device/ui/customDialog.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  TextEditingController _cntrlSourceId = TextEditingController();
  Connectivity _connectivity = Connectivity();
  ClientChannel _channel;
  bool _onReadCert = true;

  bool _onBadHandler(X509Certificate certificate, String host){
    return host == '$orderProxyHost:$orderProxyPort';
  }

  CallOptions _callOptions = CallOptions(
    metadata: {'authorization' : 'Bearer '+orderProxyToken}
  );
  
  initialize() async {
    try {
      ByteData data = await rootBundle.load('assets/testCert.crt');
      final _certAsList = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes
      ).map((uint8) => uint8.toInt()).toList();

      ChannelOptions _chaneelOptions = ChannelOptions(
        credentials: ChannelCredentials.secure(
          certificates: _certAsList,
          onBadCertificate: _onBadHandler
        ),
        idleTimeout: Duration(minutes: 1)
      );

      _channel = ClientChannel(
        orderProxyHost,
        port: orderProxyPort,
        options: _chaneelOptions
      );

      setState(() {
        _onReadCert = false;
      });

    } catch (e) {
      throw Exception(e);
    }
  }


  @override
  void initState() {
    initialize();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: (_onReadCert) ? Center(
        child: CircularProgressIndicator(),
      ) : Column(
        children: <Widget>[
          TextField(
            controller: _cntrlSourceId,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Source ID'
            ),
          ),
          RaisedButton(
            child: Text('Create UUID'),
            onPressed: (){
              OrderService2().createUuidTest(
                sourceId: _cntrlSourceId.text
              ).then((result){
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return CustomDialog(
                      title: 'Result',
                      content: result.uuid,
                    );
                  }
                );
              }).catchError((e){
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return CustomDialog(
                      title: 'Error',
                      content: e.toString(),
                    );
                  }
                );
              });
            },
          )
        ],
      )
      /*StreamBuilder<StreamOrdersResponse>(
        stream: ConnectiveClient(_connectivity, _channel, options: _callOptions)
          .streamOrders(
            StreamOrdersRequest()
              ..subscriber = ""
              ..lastindex = ""
          ).handleError((e){
            throw Exception(e);
          }),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListTile(
              title: Text(snapshot.data.order.sourceBatch),
              subtitle: Text(snapshot.data.order.pluText),
            );
          }
          return Container();
        },
      )*/
    );
  }
}