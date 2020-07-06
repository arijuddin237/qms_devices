import 'dart:io';

import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';
import 'package:grpc/grpc.dart';
import 'package:qms_device/library/libApps.dart';

class GrpcClients {
  //Connectivity connectivity;
  bool hasRecentlyFailed = true;

  ClientChannel client;

  //static final GrpcClients _grpcClients = GrpcClients._internal(_connectivity);

  //factory GrpcClients() => _grpcClients;

  bool _onBadHandler(X509Certificate certificate, String host){
    return host == '$orderProxyHost:$orderProxyPort';
  }

  CallOptions _callOptions = CallOptions(
    metadata: {'authorization' : 'Bearer '+orderProxyToken}
  );

  Future<List<int>> _readCert() async {
    ByteData data = await rootBundle.load('assets/testCert.crt');
    final _certAsList = data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes
    ).map((uint8) => uint8.toInt()).toList();
    return _certAsList;
  }

  _restoreChannel() {
    _readCert().then((data){
      client = ClientChannel(
        orderProxyHost,
        port: orderProxyPort,
        options: ChannelOptions(
          credentials: ChannelCredentials.secure(
            certificates: data,
            onBadCertificate: _onBadHandler
          ),
          idleTimeout: Duration(minutes: 1)
        )
      );
    });
  }

  GrpcClients() {
    Connectivity().onConnectivityChanged.listen((result){
      if(hasRecentlyFailed && result != ConnectivityResult.none){
        _restoreChannel();
      }
    });
    /*_readCert().then((data){
      client = ClientChannel(
        orderProxyHost,
        port: orderProxyPort,
        options: ChannelOptions(
          credentials: ChannelCredentials.secure(
            certificates: data,
            onBadCertificate: _onBadHandler
          ),
          idleTimeout: Duration(minutes: 1)
        )
      );
    });*/
  }
}