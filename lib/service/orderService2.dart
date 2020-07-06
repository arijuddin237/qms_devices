import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'package:qms_device/bloc/blocConnectivity.dart';
import 'package:qms_device/bloc/blocOrder.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/service/grpcCommons.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/protos/orders.pbgrpc.dart';

class OrderService2 {
  static ClientChannel _channel;
  Connectivity _connectivity = Connectivity();

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

    } catch (e) {
      throw Exception(e);
    }
  }

  //-Create UUID-------------------------------------------------------------------------
  Future<CreateUuidResponse> createUuid({String sourceId}) async {
    try {
      final result = ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .createUuid(
          CreateUuidRequest()
            ..sourceId = sourceId
        );
      return result;
    } catch (e) {
      throw Exception(e);
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
        final resCreateOrder = ConnectiveClient(_connectivity, _channel, options: _callOptions)
          .createOrder(
            Order()
              ..tenantId = tenantId
              ..sourceId = sourceId
              ..sourceTrackingId = sourceTrackingId
              ..sourceBatch = sourceBatch
              ..pluId = pluId
              ..pluText = pluText
              ..qty = qty
              ..status = status
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
  Future<CreateTagResponse> createTag({String uuid, Tag tag}) async {
    try {
      final response = await ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .createTag(
          CreateTagRequest()
            ..uuid = uuid
            ..tag = tag
        );
        return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //-Create Submodule--------------------------------------------------------------------
  Future<CreateSubmoduleResponse> createSubmodule({String uuid, Submodule submodule}) async {
    try {
      final response = await ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .createSubmodule(
          CreateSubmoduleRequest()
            ..uuid = uuid
            ..submodule = submodule
        );
        return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //=========================================================================Get Function
  //-Get Tags----------------------------------------------------------------------------
  Future<GetTagResponse> getTgas({String uuid, String tagId}) async {
    try {
      final response = await ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .getTag(
          GetTagRequest()
            ..uuid = uuid
            ..tagId = tagId ?? ""
        );
        return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //-Get Submodule-----------------------------------------------------------------------
  Future<GetSubmoduleResponse> getSubmodule({String uuid, String submodule}) async {
    try {
      final response = await ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .getSubmodule(
          GetSubmoduleRequest()
            ..uuid = uuid
            ..submodule = submodule ?? ""
        );
        return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //======================================================================Update Function
  //-Update Order Status-----------------------------------------------------------------
  Future<UpdateOrderStatusResponse> updateOrderStatus({String uuid, String status}) async {
    try {
      final response = await ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .updateOrderStatus(
          UpdateOrderStatusRequest()
            ..uuid = uuid
            ..status = status
        );
        return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //-Update Order QTY--------------------------------------------------------------------
  Future<UpdateOrderQtyResponse> updateOrderQty({String uuid, DecimalValue qty}) async {
    try {
      final response = await ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .updateOrderQty(
          UpdateOrderQtyRequest()
            ..uuid = uuid
            ..qty = qty
        );
        return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //-Update Tag--------------------------------------------------------------------------
  Future<UpdateTagResponse> updateTag({String uuid, Tag tag}) async {
    try {
      final response = await ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .updateTag(
          UpdateTagRequest()
            ..uuid = uuid
            ..tag = tag
        );
        return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //-Update Submodule--------------------------------------------------------------------
  Future<UpdateSubmoduleResponse> updateSubmodule({String uuid, Submodule submodule}) async {
    try {
      final response = await ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .updateSubmodule(
          UpdateSubmoduleRequest()
            ..uuid = uuid
            ..submodule = submodule
        );
        return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //======================================================================Delete Dunction
  //-Delete Tag--------------------------------------------------------------------------
  Future<DeleteTagResponse> deleteTag({String uuid, Tag tag}) async {
    try {
      final response = await ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .deleteTag(
          DeleteTagRequest()
            ..uuid = uuid
            ..tag = tag
        );
        return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //-Delete Submodule--------------------------------------------------------------------
  Future<DeleteSubmoduleResponse> deleteSubmodule({String uuid, Submodule submodule}) async {
    try {
      final response = await ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .deleteSubmodule(
          DeleteSubmoduleRequest()
            ..uuid = uuid
            ..submodule = submodule
        );
        return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //======================================================================Stream Function
  //-Stream Get Order--------------------------------------------------------------------
  Stream<Order> streamGetOrder({String uuid}) async* {
    GetOrderRequest _getOrderReq = GetOrderRequest()
      ..uuid = uuid ?? "";

    try {
      await for (var streamGetOrder in ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .getOrder(_getOrderReq)
      ) {
        blocOrders.addOrders(streamGetOrder);
        yield streamGetOrder;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //-Stream Get Order With---------------------------------------------------------------
  Stream<Order> streamGetOrderWith({Order order, Tags tags, Submodules submodules}) async* {
    GetOrderWithRequest _getOrderWithRequest = GetOrderWithRequest()
      ..order = order ?? Order()
      ..tags = tags ?? Tags()
      ..submodules = submodules ?? Submodules();
    
    try {
      await for (var streamGetOrder in ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .getOrderWith(_getOrderWithRequest)
      ) {
        blocOrders.addOrders(streamGetOrder);
        yield streamGetOrder;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //-Stream Get Order History------------------------------------------------------------
  Stream<OrderHistory> streamGetHistory({String uuid}) async* {
    GetOrderRequest _getOrderRequest = GetOrderRequest()
      ..uuid = uuid ?? "";

    try {
      await for (var streamOrderHistory in ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .getOrderHistory(_getOrderRequest)
      ) {
        yield streamOrderHistory;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //-Stream Order------------------------------------------------------------------------
  Stream<StreamOrdersResponse> streamOrder({String subscriber, String lastIndex}) async* {
    StreamOrdersRequest _streamOrderReq = StreamOrdersRequest()
      ..subscriber = subscriber ?? ""
      ..lastindex = lastIndex ?? "";

    try {
      await for (var streamOrder in ConnectiveClient(_connectivity, _channel, options: _callOptions)
        .streamOrders(_streamOrderReq)
      ) {
        blocOrders.addOrders(streamOrder.order);
        yield streamOrder;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}