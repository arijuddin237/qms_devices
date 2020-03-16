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
              StreamBuilder<List<List<Order>>>(
                stream: blocOrders.ordersCalling.stream,
                builder: (context, snapshot){
                  if(snapshot.hasData && snapshot.data.length > 0){
                    if(filterTenant.length > 0){
                      snapshot.data.removeWhere((item) => item[0].tenantId != filterTenant);
                    }
                    return HeaderCallingOrder(
                      ordersCalling: snapshot.data.first,
                    );
                  } else {
                    return HeaderCallingOrder();
                  }
                },
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
                      Container(
                        width: SizeConfig.safeBlockHorizontal * 49,
                        height: SizeConfig.safeBlockVertical * 52,
                        child: StreamBuilder<List<List<Order>>>(
                          stream: blocOrders.ordersQueue.stream,
                          builder: (context, snapshot){
                            if(snapshot.hasData && snapshot.data.length > 0){
                              if(filterTenant.length > 0){
                                snapshot.data.removeWhere((item) => item[0].tenantId != filterTenant);
                              }
                              return ListViewQueue(
                                orders: snapshot.data,
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
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
                      Container(
                        width: SizeConfig.safeBlockHorizontal * 49,
                        height: SizeConfig.safeBlockVertical * 52,
                        child: 
                          StreamBuilder<List<List<Order>>>(
                          stream: blocOrders.ordersCalling.stream,
                          builder: (context, snapshot){
                            if(snapshot.hasData && snapshot.data.length > 0){
                              if(filterTenant.length > 0){
                                snapshot.data.removeWhere((item) => item[0].tenantId != filterTenant);
                              }
                              return ListViewQueue(
                                orders: snapshot.data,
                                calledQueue: true,
                              );
                            } else {
                              return Container();
                            }
                          },
                        )
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
                      print(newValue); //-TODO: change to bloc so another widget can listening to onChanged
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
        )
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