import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocDropDownSetting.dart';
import 'package:qms_device/bloc/blocOrder.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/service/orderService.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/ui/callingOrder/headerCallingOrder.dart';
import 'package:qms_device/ui/callingOrder/listviewQueue.dart';
import 'package:uts_sidemenu/uts_sidemenu.dart';


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
          return Column(
            children: <Widget>[
              StreamBuilder<Object>(
                stream: blocDropdownSetting.subject.stream,
                builder: (context, snapshotDrop) {
                  return Container(
                    child: StreamBuilder<List<List<Order>>>(
                      stream: blocOrders.ordersCalling.stream,
                      builder: (context, snapshot){
                        if(snapshot.hasData && snapshot.data.length > 0){
                          List<List<Order>> calledList = List<List<Order>>();
                          if(snapshotDrop.hasData){
                            for (var groupTenant in snapshot.data) {
                              List<Order> orders = List<Order>();
                              for (var order in groupTenant) {
                                if(order.tenantId == snapshotDrop.data){
                                  orders.add(order);
                                }
                              }
                              if(orders.length > 0){
                                calledList.add(orders);
                              }
                            }
                          }
                          return HeaderCallingOrder(
                            ordersCalling: (calledList.length > 0) ? calledList.first : null,
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
                          fontSize: 50,
                      )),
                      StreamBuilder<Object>(
                        stream: blocDropdownSetting.subject.stream,
                        builder: (context, snapshotDrop) {
                          return Container(
                            width: SizeConfig.safeBlockHorizontal * 49,
                            height: SizeConfig.safeBlockVertical * 52,
                            child: StreamBuilder<List<List<Order>>>(
                              stream: blocOrders.ordersQueue.stream,
                              builder: (context, snapshot){
                                if(snapshot.hasData && snapshot.data.length > 0){
                                  List<List<Order>> queueList = List<List<Order>>();
                                  if(snapshotDrop.hasData){
                                    for (var groupTenant in snapshot.data) {
                                      List<Order> orders = List<Order>();
                                      for (var order in groupTenant) {
                                        if(order.tenantId == snapshotDrop.data){
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
                        fontSize: 50
                      )),
                      StreamBuilder<Object>(
                        stream: blocDropdownSetting.subject.stream,
                        builder: (context, snapshotDrop) {
                          return Container(
                            width: SizeConfig.safeBlockHorizontal * 49,
                            height: SizeConfig.safeBlockVertical * 52,
                            child: 
                              StreamBuilder<List<List<Order>>>(
                              stream: blocOrders.ordersCalling.stream,
                              builder: (context, snapshot){
                                if(snapshot.hasData && snapshot.data.length > 0){
                                  List<List<Order>> calledList = List<List<Order>>();
                                  if(snapshotDrop.hasData){
                                    for (var groupTenant in snapshot.data) {
                                      List<Order> orders = List<Order>();
                                      for (var order in groupTenant) {
                                        if(order.tenantId == snapshotDrop.data){
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
        },
      ),
    );
  }

  Widget _menuBody(){
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Settings', style: TextStyle(
            fontSize: 30
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Tenant ID : ', style: TextStyle(
                fontSize: 20
              )),
              StreamBuilder<String>(
                stream: blocDropdownSetting.subject.stream,
                builder: (context, snapshot) {
                  return DropdownButton<String>(
                    value: snapshot.data,
                    items: ['testMerchant123', 'testMerchant124', 'testMerchant125'].map((value){
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value, style: TextStyle(fontSize: 20))
                      );
                    }).toList(),
                    onChanged: (newValue){
                      blocDropdownSetting.changeValue(newValue);
                      filterTenant = newValue;
                      //print(newValue); //-TODO: change to bloc so another widget can listening to onChanged
                    },
                  );
                }
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                elevation: 0.0,
                child: Text('Save', style: TextStyle(
                  fontSize: 20
                )),
                onPressed: (){

                },
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calling Order'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              MenuNotifier.notify.toggle();
            },
          )
        ],
      ),
      body: UTSSideMenu(
        body: _mainBody(),
        menuBody: _menuBody(),
        duration: 100,
        menuSize: 0.3,
        isPanDisabled: false,
        isBackdropDisabled: false,
        shadow: BoxShadow(
          color: Colors.black45,
          offset: Offset(0.4, 0.0),
          spreadRadius: 1.0,
          blurRadius: 1.0
        ),
        menuFriction: 0.3,
        direction: UTSDirection.horizontal,
        mode: UTSMode.right,
        curve: Curves.easeInOut,
      ),
      //backgroundColor: Colors.white,
    );
  }
}