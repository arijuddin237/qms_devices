import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocOrder.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/service/orderService.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/ui/callingOrder/headerCallingOrder.dart';
import 'package:qms_device/ui/callingOrder/listviewQueue.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calling Order'),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: _service.streamOrder(),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Please Wait....'),
                    )
                  ],
                ),
              );
            } else {
              return Column(
                children: <Widget>[
                  StreamBuilder<List<List<Order>>>(
                    stream: blocOrders.ordersCalling.stream,
                    builder: (context, snapshot){
                      if(snapshot.hasData && snapshot.data.length > 0){
                        return HeaderCallingOrder(
                          ordersCalling: snapshot.data.last,
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
                                  return ListViewQueue(
                                    orders: snapshot.data,
                                    calledQueue: true,
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            )
                            /*ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, build){
                                return Divider(
                                  color: Colors.black,
                                );
                              },
                              //physics: ScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (context, index){
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.assessment,
                                            size: 40,
                                          ),
                                        ),
                                        Container(
                                          width: SizeConfig.safeBlockHorizontal * 5,
                                          child: Text('B0$index', style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold
                                          )),
                                        ),
                                        Container(
                                          width: SizeConfig.safeBlockHorizontal * 15,
                                          child: Text('TestMerchant123', style: TextStyle(
                                            fontSize: 20
                                          )),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        color: Colors.orange,
                                        elevation: 0.0,
                                        child: Container(
                                          width: SizeConfig.safeBlockHorizontal * 5,
                                          height: SizeConfig.safeBlockVertical * 5,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(Icons.notifications),
                                              Text('Recall', style: TextStyle(
                                                fontSize: 20
                                              ))
                                            ],
                                          ),
                                        ),
                                        onPressed: (){
                                          //-TODO:
                                          print('tesss');
                                        },
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),*/
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}