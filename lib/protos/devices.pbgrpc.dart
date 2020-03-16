///
//  Generated code. Do not modify.
//  source: devices.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'devices.pb.dart' as $0;
export 'devices.pb.dart';

class DevicesClient extends $grpc.Client {
  static final _$createDeviceConfig =
      $grpc.ClientMethod<$0.CreateDeviceConfigRequest, $0.DeviceConfigResponse>(
          '/devices.Devices/createDeviceConfig',
          ($0.CreateDeviceConfigRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeviceConfigResponse.fromBuffer(value));
  static final _$getDeviceConfig =
      $grpc.ClientMethod<$0.GetDeviceConfigRequest, $0.DeviceConfigResponse>(
          '/devices.Devices/getDeviceConfig',
          ($0.GetDeviceConfigRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeviceConfigResponse.fromBuffer(value));
  static final _$streamDeviceConfig =
      $grpc.ClientMethod<$0.StreamDeviceConfigRequest, $0.DeviceConfigResponse>(
          '/devices.Devices/streamDeviceConfig',
          ($0.StreamDeviceConfigRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeviceConfigResponse.fromBuffer(value));

  DevicesClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.DeviceConfigResponse> createDeviceConfig(
      $0.CreateDeviceConfigRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createDeviceConfig, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.DeviceConfigResponse> getDeviceConfig(
      $0.GetDeviceConfigRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getDeviceConfig, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.DeviceConfigResponse> streamDeviceConfig(
      $0.StreamDeviceConfigRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$streamDeviceConfig, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class DevicesServiceBase extends $grpc.Service {
  $core.String get $name => 'devices.Devices';

  DevicesServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateDeviceConfigRequest,
            $0.DeviceConfigResponse>(
        'createDeviceConfig',
        createDeviceConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateDeviceConfigRequest.fromBuffer(value),
        ($0.DeviceConfigResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetDeviceConfigRequest, $0.DeviceConfigResponse>(
            'getDeviceConfig',
            getDeviceConfig_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetDeviceConfigRequest.fromBuffer(value),
            ($0.DeviceConfigResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StreamDeviceConfigRequest,
            $0.DeviceConfigResponse>(
        'streamDeviceConfig',
        streamDeviceConfig_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.StreamDeviceConfigRequest.fromBuffer(value),
        ($0.DeviceConfigResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.DeviceConfigResponse> createDeviceConfig_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateDeviceConfigRequest> request) async {
    return createDeviceConfig(call, await request);
  }

  $async.Future<$0.DeviceConfigResponse> getDeviceConfig_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetDeviceConfigRequest> request) async {
    return getDeviceConfig(call, await request);
  }

  $async.Stream<$0.DeviceConfigResponse> streamDeviceConfig_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.StreamDeviceConfigRequest> request) async* {
    yield* streamDeviceConfig(call, await request);
  }

  $async.Future<$0.DeviceConfigResponse> createDeviceConfig(
      $grpc.ServiceCall call, $0.CreateDeviceConfigRequest request);
  $async.Future<$0.DeviceConfigResponse> getDeviceConfig(
      $grpc.ServiceCall call, $0.GetDeviceConfigRequest request);
  $async.Stream<$0.DeviceConfigResponse> streamDeviceConfig(
      $grpc.ServiceCall call, $0.StreamDeviceConfigRequest request);
}
