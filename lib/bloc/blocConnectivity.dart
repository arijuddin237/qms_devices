import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/protos/orders.pbgrpc.dart';
import 'package:rxdart/rxdart.dart';

class ConnectiveClient extends OrdersClient{

  final CallOptions _options;
  final Connectivity _connectivity;
  ClientChannel _channel;
  bool hasRecentlyFiailed = false;

  ConnectiveClient(this._connectivity, this._channel, {CallOptions options})
    : _options = options ?? CallOptions(),
      super(_channel){
        _connectivity.onConnectivityChanged.listen((result){
          if(hasRecentlyFiailed && result != ConnectivityResult.none){
            _restoreChannel();
          }
        });
      }
  
  _restoreChannel(){
    _channel = ClientChannel(_channel.host,
      port: _channel.port, options: _channel.options
    );
    hasRecentlyFiailed = false;
  }

  @override
  ClientCall<Q, R> $createCall<Q,R>(
    ClientMethod<Q, R> method, Stream<Q> request,
    {CallOptions options}) {
      BroadcastCall<Q, R> call = createChannelCall(
        method,
        request,
        _options.mergedWith(options),
      );
      call.response.listen((_) {}, onError: (Object error) async {
        //print(StatusCode.unavailable.toString());
        if(error is GrpcError){
          print(error.code.toString());
        }
        if(
            error is GrpcError && error.code == StatusCode.unavailable ||
            error is GrpcError && error.code == 2
          ){
          _connectivity.checkConnectivity().then((result){
            if(result != ConnectivityResult.none){
              _restoreChannel();
            }
          });
          hasRecentlyFiailed = true;
        }
      });
      return call;
    }

  ClientCall<Q, R> createChannelCall<Q, R>(
    ClientMethod<Q, R> method, Stream<Q> request, CallOptions options
  ) {
    final call = BroadcastCall(method, request, options);
    _channel.getConnection().then((connextion){
      if(call.isCancelled) return;
      connextion.dispatchCall(call);
    }, onError: call.onConnectionError);
    return call;
  }
  
}

class BroadcastCall<Q, R> extends ClientCall<Q, R> {

  BehaviorSubject<R> subject = BehaviorSubject<R>();

  BroadcastCall(
    ClientMethod<Q, R> method, Stream<Q> request, CallOptions options
  ) : super(method, request, options){
    super.response.listen(
      (data) => subject.add(data),
      onError: (error) => subject.addError(error),
      onDone: () => subject.close()
    );
  }

  @override
  Stream<R> get response => subject.stream;
}
