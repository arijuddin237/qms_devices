///
//  Generated code. Do not modify.
//  source: orders.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'orders.pb.dart' as $0;
export 'orders.pb.dart';

class OrdersClient extends $grpc.Client {
  static final _$createUuid =
      $grpc.ClientMethod<$0.CreateUuidRequest, $0.CreateUuidResponse>(
          '/orders.Orders/createUuid',
          ($0.CreateUuidRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateUuidResponse.fromBuffer(value));
  static final _$createOrder =
      $grpc.ClientMethod<$0.Order, $0.CreateOrderResponse>(
          '/orders.Orders/createOrder',
          ($0.Order value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateOrderResponse.fromBuffer(value));
  static final _$createTag =
      $grpc.ClientMethod<$0.CreateTagRequest, $0.CreateTagResponse>(
          '/orders.Orders/createTag',
          ($0.CreateTagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateTagResponse.fromBuffer(value));
  static final _$createSubmodule =
      $grpc.ClientMethod<$0.CreateSubmoduleRequest, $0.CreateSubmoduleResponse>(
          '/orders.Orders/createSubmodule',
          ($0.CreateSubmoduleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateSubmoduleResponse.fromBuffer(value));
  static final _$getOrder = $grpc.ClientMethod<$0.GetOrderRequest, $0.Order>(
      '/orders.Orders/getOrder',
      ($0.GetOrderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Order.fromBuffer(value));
  static final _$getTag =
      $grpc.ClientMethod<$0.GetTagRequest, $0.GetTagResponse>(
          '/orders.Orders/getTag',
          ($0.GetTagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.GetTagResponse.fromBuffer(value));
  static final _$getSubmodule =
      $grpc.ClientMethod<$0.GetSubmoduleRequest, $0.GetSubmoduleResponse>(
          '/orders.Orders/getSubmodule',
          ($0.GetSubmoduleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetSubmoduleResponse.fromBuffer(value));
  static final _$getOrderWith =
      $grpc.ClientMethod<$0.GetOrderWithRequest, $0.Order>(
          '/orders.Orders/getOrderWith',
          ($0.GetOrderWithRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Order.fromBuffer(value));
  static final _$getOrderHistory =
      $grpc.ClientMethod<$0.GetOrderRequest, $0.OrderHistory>(
          '/orders.Orders/getOrderHistory',
          ($0.GetOrderRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.OrderHistory.fromBuffer(value));
  static final _$updateOrderStatus = $grpc.ClientMethod<
          $0.UpdateOrderStatusRequest, $0.UpdateOrderStatusResponse>(
      '/orders.Orders/updateOrderStatus',
      ($0.UpdateOrderStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdateOrderStatusResponse.fromBuffer(value));
  static final _$updateTag =
      $grpc.ClientMethod<$0.UpdateTagRequest, $0.UpdateTagResponse>(
          '/orders.Orders/updateTag',
          ($0.UpdateTagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateTagResponse.fromBuffer(value));
  static final _$updateSubmodule =
      $grpc.ClientMethod<$0.UpdateSubmoduleRequest, $0.UpdateSubmoduleResponse>(
          '/orders.Orders/updateSubmodule',
          ($0.UpdateSubmoduleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateSubmoduleResponse.fromBuffer(value));
  static final _$streamOrders =
      $grpc.ClientMethod<$0.StreamOrdersRequest, $0.StreamOrdersResponse>(
          '/orders.Orders/streamOrders',
          ($0.StreamOrdersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.StreamOrdersResponse.fromBuffer(value));

  OrdersClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.CreateUuidResponse> createUuid(
      $0.CreateUuidRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createUuid, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.CreateOrderResponse> createOrder($0.Order request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createOrder, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.CreateTagResponse> createTag(
      $0.CreateTagRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$createTag, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.CreateSubmoduleResponse> createSubmodule(
      $0.CreateSubmoduleRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createSubmodule, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.Order> getOrder($0.GetOrderRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getOrder, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.GetTagResponse> getTag($0.GetTagRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getTag, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GetSubmoduleResponse> getSubmodule(
      $0.GetSubmoduleRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getSubmodule, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.Order> getOrderWith($0.GetOrderWithRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getOrderWith, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseStream<$0.OrderHistory> getOrderHistory(
      $0.GetOrderRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getOrderHistory, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.UpdateOrderStatusResponse> updateOrderStatus(
      $0.UpdateOrderStatusRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateOrderStatus, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateTagResponse> updateTag(
      $0.UpdateTagRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$updateTag, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.UpdateSubmoduleResponse> updateSubmodule(
      $0.UpdateSubmoduleRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateSubmodule, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.StreamOrdersResponse> streamOrders(
      $0.StreamOrdersRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$streamOrders, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class OrdersServiceBase extends $grpc.Service {
  $core.String get $name => 'orders.Orders';

  OrdersServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateUuidRequest, $0.CreateUuidResponse>(
        'createUuid',
        createUuid_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateUuidRequest.fromBuffer(value),
        ($0.CreateUuidResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Order, $0.CreateOrderResponse>(
        'createOrder',
        createOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Order.fromBuffer(value),
        ($0.CreateOrderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateTagRequest, $0.CreateTagResponse>(
        'createTag',
        createTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateTagRequest.fromBuffer(value),
        ($0.CreateTagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateSubmoduleRequest,
            $0.CreateSubmoduleResponse>(
        'createSubmodule',
        createSubmodule_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateSubmoduleRequest.fromBuffer(value),
        ($0.CreateSubmoduleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetOrderRequest, $0.Order>(
        'getOrder',
        getOrder_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetOrderRequest.fromBuffer(value),
        ($0.Order value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTagRequest, $0.GetTagResponse>(
        'getTag',
        getTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTagRequest.fromBuffer(value),
        ($0.GetTagResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetSubmoduleRequest, $0.GetSubmoduleResponse>(
            'getSubmodule',
            getSubmodule_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetSubmoduleRequest.fromBuffer(value),
            ($0.GetSubmoduleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetOrderWithRequest, $0.Order>(
        'getOrderWith',
        getOrderWith_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.GetOrderWithRequest.fromBuffer(value),
        ($0.Order value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetOrderRequest, $0.OrderHistory>(
        'getOrderHistory',
        getOrderHistory_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetOrderRequest.fromBuffer(value),
        ($0.OrderHistory value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateOrderStatusRequest,
            $0.UpdateOrderStatusResponse>(
        'updateOrderStatus',
        updateOrderStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateOrderStatusRequest.fromBuffer(value),
        ($0.UpdateOrderStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateTagRequest, $0.UpdateTagResponse>(
        'updateTag',
        updateTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateTagRequest.fromBuffer(value),
        ($0.UpdateTagResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateSubmoduleRequest,
            $0.UpdateSubmoduleResponse>(
        'updateSubmodule',
        updateSubmodule_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateSubmoduleRequest.fromBuffer(value),
        ($0.UpdateSubmoduleResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.StreamOrdersRequest, $0.StreamOrdersResponse>(
            'streamOrders',
            streamOrders_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.StreamOrdersRequest.fromBuffer(value),
            ($0.StreamOrdersResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateUuidResponse> createUuid_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateUuidRequest> request) async {
    return createUuid(call, await request);
  }

  $async.Future<$0.CreateOrderResponse> createOrder_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Order> request) async {
    return createOrder(call, await request);
  }

  $async.Future<$0.CreateTagResponse> createTag_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateTagRequest> request) async {
    return createTag(call, await request);
  }

  $async.Future<$0.CreateSubmoduleResponse> createSubmodule_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateSubmoduleRequest> request) async {
    return createSubmodule(call, await request);
  }

  $async.Stream<$0.Order> getOrder_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetOrderRequest> request) async* {
    yield* getOrder(call, await request);
  }

  $async.Future<$0.GetTagResponse> getTag_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetTagRequest> request) async {
    return getTag(call, await request);
  }

  $async.Future<$0.GetSubmoduleResponse> getSubmodule_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetSubmoduleRequest> request) async {
    return getSubmodule(call, await request);
  }

  $async.Stream<$0.Order> getOrderWith_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetOrderWithRequest> request) async* {
    yield* getOrderWith(call, await request);
  }

  $async.Stream<$0.OrderHistory> getOrderHistory_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetOrderRequest> request) async* {
    yield* getOrderHistory(call, await request);
  }

  $async.Future<$0.UpdateOrderStatusResponse> updateOrderStatus_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateOrderStatusRequest> request) async {
    return updateOrderStatus(call, await request);
  }

  $async.Future<$0.UpdateTagResponse> updateTag_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateTagRequest> request) async {
    return updateTag(call, await request);
  }

  $async.Future<$0.UpdateSubmoduleResponse> updateSubmodule_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateSubmoduleRequest> request) async {
    return updateSubmodule(call, await request);
  }

  $async.Stream<$0.StreamOrdersResponse> streamOrders_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.StreamOrdersRequest> request) async* {
    yield* streamOrders(call, await request);
  }

  $async.Future<$0.CreateUuidResponse> createUuid(
      $grpc.ServiceCall call, $0.CreateUuidRequest request);
  $async.Future<$0.CreateOrderResponse> createOrder(
      $grpc.ServiceCall call, $0.Order request);
  $async.Future<$0.CreateTagResponse> createTag(
      $grpc.ServiceCall call, $0.CreateTagRequest request);
  $async.Future<$0.CreateSubmoduleResponse> createSubmodule(
      $grpc.ServiceCall call, $0.CreateSubmoduleRequest request);
  $async.Stream<$0.Order> getOrder(
      $grpc.ServiceCall call, $0.GetOrderRequest request);
  $async.Future<$0.GetTagResponse> getTag(
      $grpc.ServiceCall call, $0.GetTagRequest request);
  $async.Future<$0.GetSubmoduleResponse> getSubmodule(
      $grpc.ServiceCall call, $0.GetSubmoduleRequest request);
  $async.Stream<$0.Order> getOrderWith(
      $grpc.ServiceCall call, $0.GetOrderWithRequest request);
  $async.Stream<$0.OrderHistory> getOrderHistory(
      $grpc.ServiceCall call, $0.GetOrderRequest request);
  $async.Future<$0.UpdateOrderStatusResponse> updateOrderStatus(
      $grpc.ServiceCall call, $0.UpdateOrderStatusRequest request);
  $async.Future<$0.UpdateTagResponse> updateTag(
      $grpc.ServiceCall call, $0.UpdateTagRequest request);
  $async.Future<$0.UpdateSubmoduleResponse> updateSubmodule(
      $grpc.ServiceCall call, $0.UpdateSubmoduleRequest request);
  $async.Stream<$0.StreamOrdersResponse> streamOrders(
      $grpc.ServiceCall call, $0.StreamOrdersRequest request);
}
