import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:flutter/services.dart';
import 'package:qms_device/bloc/blocOrder.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/protos/orders.pbgrpc.dart';
import 'package:qms_device/library/libApps.dart';

class OrderService {
  static OrdersClient _client;
  ClientChannel _channel;

  Order _orderValue = Order();
  Tags _tagsValue = Tags();
  Submodules _submValue = Submodules();

  bool _onBadHandler(X509Certificate certificate, String host){
    //return host == '${libGrpc.orderProxyHost}:${libGrpc.orderProxyPort}';
    return host == '$orderProxyHost:$orderProxyPort';
  }

  CallOptions _callOptions = CallOptions(
    metadata: {'authorization' : 'Bearer '+orderProxyToken}
  );

  void initialize() async {
    try {
      ByteData data = await rootBundle.load('assets/testCert.crt');
      final _certAsList = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes
      ).map((uint8) => uint8.toInt()).toList();

      ChannelOptions _channelOption = ChannelOptions(
        credentials: ChannelCredentials.secure(
          certificates: _certAsList,
          onBadCertificate: _onBadHandler
        ),
        idleTimeout: Duration(minutes: 1)
      );

      _channel = ClientChannel(
        orderProxyHost,
        port: orderProxyPort,
        options: _channelOption
      );
      
      _client = OrdersClient(
        _channel,
        options: _callOptions
      );

    } catch (e) {
      throw Exception('Error Initialize '+e.toString());
    }
  }

  OrderService(){
    initialize();
  }

  //======================================================================Create Function
  //-Create UUID-------------------------------------------------------------------------
  Future<CreateUuidResponse> createUuid({String sourceId}) async {
    try {
      final resCreateUuid = _client.createUuid(
        CreateUuidRequest()
          ..sourceId = sourceId
      );
      return resCreateUuid;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //-Create Order------------------------------------------------------------------------
  Future<CreateOrderResponse> createOrder({
    String tenantId, String sourceId, String sourceTrackingId, String sourceBatch,
    String pluId, String pluText, DecimalValue qty, String status, String orderType,
    String parentUuid, Tags tags, Submodules submodules
  }) async {
    try {
      final response = await createUuid(sourceId: sourceId).then((data){
        final resCreateOrder = _client.createOrder(
          Order()
            ..tenantId = tenantId
            ..sourceId = sourceId
            ..sourceTrackingId = sourceTrackingId
            ..sourceBatch = sourceBatch
            ..pluId = pluId
            ..pluText = pluText
            ..qty = qty
            ..status = status ?? ""
            ..uuid = data.uuid
            ..orderType = orderType ?? ""
            ..parentUuid = parentUuid ?? ""
            ..tags = tags
            ..submodules = submodules
        );
        return resCreateOrder;
      });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //-Create Tag--------------------------------------------------------------------------
  Future<CreateTagResponse> createTag({String uuId, Tag tag}) async {
    try {
      final resCreateTags = _client.createTag(
        CreateTagRequest()
          ..uuid = uuId ?? ""
          ..tag = tag
      );
      return resCreateTags;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //-Create Submodule--------------------------------------------------------------------
  Future<CreateSubmoduleResponse> createSubmodule({String uuId, Submodule submodule}) async {
    try {
      final resCreateSubm = _client.createSubmodule(
        CreateSubmoduleRequest()
          ..uuid = uuId ?? ""
          ..submodule = submodule
      );
      return resCreateSubm;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //=========================================================================Get Function
  //-Get Function------------------------------------------------------------------------
  Future<GetTagResponse> getTags({String uuId, String tagId}) async {
    try {
      final resGetTags = _client.getTag(
        GetTagRequest()
          ..uuid = uuId
          ..tagId = tagId ?? ""
      );
      return resGetTags;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //-Get Submodule-----------------------------------------------------------------------
  Future<GetSubmoduleResponse> getSubmodule({String uuId, String submodule}) async {
    try {
      final resGetSubm = _client.getSubmodule(
        GetSubmoduleRequest()
          ..uuid = uuId
          ..submodule = submodule ?? ""
      );
      return resGetSubm;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //======================================================================Update Function
  //-Update Order Status-----------------------------------------------------------------
  Future<UpdateOrderStatusResponse> updateOrderStatus({
    @required String uuid, 
    @required String status
  }) async {
    try {
      final resUpdateStatus = _client.updateOrderStatus(
        UpdateOrderStatusRequest()
          ..uuid = uuid
          ..status = status
      );
      return resUpdateStatus;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //-Update Order QTY-------------------------------------------------------------------
  Future<UpdateOrderQtyResponse> updateOrderQty({
    @required String uuid,
    @required DecimalValue qty
  }) async {
    try {
      final resUpdateOrderQty = _client.updateOrderQty(
        UpdateOrderQtyRequest()
          ..uuid = uuid
          ..qty = qty
      );
      return resUpdateOrderQty;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //-Update Tag--------------------------------------------------------------------------
  Future<UpdateTagResponse> updateTag({@required String uuid, @required Tag tag}) async {
    try {
      final resUpdateTag = _client.updateTag(
        UpdateTagRequest()
          ..uuid = uuid
          ..tag = tag
      );
      return resUpdateTag;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //-Update Submodule--------------------------------------------------------------------
  Future<UpdateSubmoduleResponse> updateSubmodule({
    @required String uuid,
    @required Submodule submodule
  }) async {
    try {
      final resUpdateSubmodule = _client.updateSubmodule(
        UpdateSubmoduleRequest()
          ..uuid = uuid
          ..submodule = submodule
      );
      return resUpdateSubmodule;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //======================================================================Delete Function
  //-Delete Tag--------------------------------------------------------------------------
  Future<DeleteTagResponse> deleteTag({@required String uuid, @required Tag tag}) async {
    try {
      final resDeleteTag = _client.deleteTag(
        DeleteTagRequest()
          ..uuid = uuid
          ..tag = tag
      );
      return resDeleteTag;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //-Delete Submodule--------------------------------------------------------------------
  Future<DeleteSubmoduleResponse> deleteSubmodule({
    @required String uuid,
    @required Submodule submodule
  }) async {
    try {
      final resDeleteSubmodule = _client.deleteSubmodule(
        DeleteSubmoduleRequest()
          ..uuid = uuid
          ..submodule = submodule
      );
      return resDeleteSubmodule;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //======================================================================Stream Function
  //-Stream Get Order--------------------------------------------------------------------
  Stream<Order> streamGetOrder({String uuId}) async* {
    GetOrderRequest _getOrderRequest = GetOrderRequest()
      ..uuid = uuId ?? "";
    
    try {
      await for (var streamGetOrder in _client.getOrder(_getOrderRequest)) {
        blocOrders.addOrders(streamGetOrder);
        yield streamGetOrder;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //-Stream Get Order With---------------------------------------------------------------
  Stream<Order> streamGetOrderWith({Order order, Tags tags, Submodules submodules}) async* {
    GetOrderWithRequest _getOrderRequest = GetOrderWithRequest()
      ..order = order ?? _orderValue
      ..tags = tags ?? _tagsValue
      ..submodules = submodules ?? _submValue;

    try {
      await for (var streamGetOrderWith in _client.getOrderWith(_getOrderRequest)) {
        blocOrders.addOrders(streamGetOrderWith);
        yield streamGetOrderWith;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //-Stream Get Order History------------------------------------------------------------
  Stream<OrderHistory> streamGetHistory({String uuId}) async* {
    GetOrderRequest _getOrderRequest = GetOrderRequest()
      ..uuid = uuId ?? "";

    try {
      await for (var streamGetHistory in _client.getOrderHistory(_getOrderRequest)) {
        yield streamGetHistory;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //-Stream order------------------------------------------------------------------------
  Stream<StreamOrdersResponse> streamOrder({String subscriber, String lastIndex}) async* {
    StreamOrdersRequest _streamOrderReq = StreamOrdersRequest()
      ..subscriber = subscriber ?? ""
      ..lastindex = lastIndex ?? "";
    
    try {
      await for (var streamOrder in _client.streamOrders(_streamOrderReq)) {
        print(streamOrder.order.uuid + " action : " +streamOrder.action);
        blocOrders.addOrders(streamOrder.order);
        yield streamOrder;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}