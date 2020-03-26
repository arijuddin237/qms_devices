import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocFontSize.dart';
import 'package:qms_device/bloc/blocOrder.dart';
import 'package:qms_device/bloc/blocSetting.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/model/fontSize.dart';
import 'package:qms_device/model/setting.dart';
import 'package:qms_device/service/orderService.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/ui/callingOrder/headerCallingOrder.dart';
import 'package:qms_device/ui/callingOrder/listviewQueue.dart';
import 'package:qms_device/utils.dart';

class CallingOrder extends StatefulWidget {
  @override
  _CallingOrderState createState() => _CallingOrderState();
}

class _CallingOrderState extends State<CallingOrder> {
  OrderService _service = OrderService();

  @override
  void initState() {
    blocOrders.clearBloc();
    super.initState();
  }

  Widget _mainBody(){
    return SafeArea(
      child: StreamBuilder(
        stream: _service.streamGetOrder(),
        builder: (context, snapshot){
          return StreamBuilder<FontSize>(
            stream: blocFontSize.getFontSize.stream,
            builder: (context, snapshotFont) {
              if(!snapshotFont.hasData){
                return Container();
              }
              return Column(
                children: <Widget>[
                  StreamBuilder<Setting>(
                    stream: blocSetting.subject.stream,
                    builder: (context, snapshotSetting) {
                      return Container(
                        child: StreamBuilder<List<List<Order>>>(
                          stream: blocOrders.ordersCalling.stream,
                          builder: (context, snapshot){
                            if(snapshot.hasData && snapshot.data.length > 0){
                              List<List<Order>> calledList = List<List<Order>>();
                              if(snapshotSetting.hasData){
                                for (var groupTenant in snapshot.data) {
                                  List<Order> orders = List<Order>();
                                  for (var order in groupTenant) {
                                    if(order.tenantId == snapshotSetting.data.tenantId){
                                      orders.add(order);
                                    }
                                  }
                                  if(orders.length > 0){
                                    calledList.add(orders);
                                  }
                                }
                              }
                              if(calledList.length > 0){
                                blocOrders.addHeaderCalling(
                                  GroupBy.groupBySourceBatch(calledList[0]).first
                                );
                              }
                              if(calledList.length == 0){
                                blocOrders.addHeaderCalling(List<Order>());
                              }
                              return HeaderCallingOrder(
                              );
                            } else {
                              return HeaderCallingOrder();
                            }
                          },
                        ),
                      );
                    }
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Queueing', style: TextStyle(
                              fontSize: snapshotFont.data.fontSize8,
                          )),
                          StreamBuilder<Setting>(
                            stream: blocSetting.subject.stream,
                            builder: (context, snapshotSetting) {
                              return Container(
                                width: SizeConfig.safeBlockHorizontal * 48.5,
                                height: ResponsiveWidget.isSmallScreen(context)
                                  ? SizeConfig.safeBlockVertical * 40
                                  : ResponsiveWidget.isMediumScreen(context)
                                  ? SizeConfig.safeBlockVertical * 40
                                  : SizeConfig.safeBlockVertical * 50,
                                child: StreamBuilder<List<List<Order>>>(
                                  stream: blocOrders.ordersQueue.stream,
                                  builder: (context, snapshot){
                                    if(snapshot.hasData && snapshot.data.length > 0){
                                      List<List<Order>> queueList = List<List<Order>>();
                                      if(snapshotSetting.hasData){
                                        for (var groupTenant in snapshot.data) {
                                          List<Order> orders = List<Order>();
                                          for (var order in groupTenant) {
                                            if(order.tenantId == snapshotSetting.data.tenantId){
                                              orders.add(order);
                                            }
                                          }
                                          if(orders.length > 0){
                                            queueList.add(orders);
                                          }
                                        }
                                      }
                                      return ListViewQueue(
                                        orders: (queueList == null) ? snapshot.data : queueList
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.black,
                      ),
                      Column(
                        children: <Widget>[
                          Text('Called Queue', style: TextStyle(
                            fontSize: snapshotFont.data.fontSize8
                          )),
                          StreamBuilder<Setting>(
                            stream: blocSetting.subject.stream,
                            builder: (context, snapshotSetting) {
                              return Container(
                                width: SizeConfig.safeBlockHorizontal * 48.5,
                                height: ResponsiveWidget.isSmallScreen(context)
                                  ? SizeConfig.safeBlockVertical * 40
                                  : ResponsiveWidget.isMediumScreen(context)
                                  ? SizeConfig.safeBlockVertical * 40
                                  : SizeConfig.safeBlockVertical * 50,
                                child: 
                                  StreamBuilder<List<List<Order>>>(
                                  stream: blocOrders.ordersCalling.stream,
                                  builder: (context, snapshot){
                                    if(snapshot.hasData && snapshot.data.length > 0){
                                      List<List<Order>> calledList = List<List<Order>>();
                                      if(snapshotSetting.hasData){
                                        for (var groupTenant in snapshot.data) {
                                          List<Order> orders = List<Order>();
                                          for (var order in groupTenant) {
                                            if(order.tenantId == snapshotSetting.data.tenantId){
                                              orders.add(order);
                                            }
                                          }
                                          if(orders.length > 0){
                                            calledList.add(orders);
                                          }
                                        }
                                      }
                                      return ListViewQueue(
                                        orders: (calledList == null) ? snapshot.data : calledList,
                                        calledQueue: true,
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                )
                              );
                            }
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              );
            }
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calling Order'),
        elevation: 0.0,
      ),
      body: _mainBody()
      //backgroundColor: Colors.white,
    );
  }
}