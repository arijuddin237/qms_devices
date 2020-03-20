import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocOrder.dart';
import 'package:qms_device/bloc/blocSetting.dart';
import 'package:qms_device/data/databaseHelper.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/model/setting.dart';
import 'package:qms_device/model/sourceBatch.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/service/orderService.dart';

class HeaderCallingOrder extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Order>>(
      stream: blocOrders.headerCalling.stream,
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Container();
        }
        return Container(
          height: SizeConfig.safeBlockVertical * 34,
          color: Colors.orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: SizeConfig.safeBlockVertical * 30,
                width: SizeConfig.safeBlockHorizontal * 35,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 8.0
                        ),
                        child: Icon(Icons.assessment, size: 50),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            (snapshot.data.length > 0) 
                            ? snapshot.data[0].sourceBatch 
                            : '--',
                            style: TextStyle(
                              fontSize: 90,
                              fontWeight: FontWeight.bold
                            )
                          ),
                          Text(
                            (snapshot.data.length > 0) 
                            ? snapshot.data[0].tenantId 
                            : '--',
                            style: TextStyle(
                              fontSize: 40
                            )
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding:  const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0
                    ),
                    child: StreamBuilder<Setting>(
                      stream: blocSetting.subject.stream,
                      builder: (context, snapshotSetting) {
                        if(!snapshot.hasData){
                          return Container();
                        } else {
                          blocSetting.getSourceBatch(
                            snapshotSetting.data.tenantId
                          );
                          return StreamBuilder<SourceBatch>(
                          stream: blocSetting.sourceBatch.stream,
                          builder: (context, snapSource) {
                            return RaisedButton(
                              color: Colors.white,
                              elevation: 0.0,
                              onPressed: (){
                                OrderService().createUuid(
                                  sourceId: 'POS01'
                                ).then((data){
                                  OrderService().createOrder(
                                    tenantId: snapshotSetting.data.tenantId,
                                    sourceId: 'POS01',
                                    uuId: data.uuid,
                                    sourceBatch: (!snapSource.hasData) 
                                      ? '1'
                                      : '${snapSource.data.sourceBatch+1}'
                                  );
                                }).then((data){
                                  if(!snapSource.hasData){
                                    blocSetting.addSourceBatch(
                                      sourceBatch: SourceBatch(
                                        sourceBatch: 1,
                                        tenantId: snapshotSetting.data.tenantId
                                      ),
                                      exist: false
                                    );
                                  } else {
                                    blocSetting.addSourceBatch(
                                      sourceBatch: SourceBatch(
                                        sourceBatch: snapSource.data.sourceBatch+1,
                                        tenantId: snapshotSetting.data.tenantId
                                      ),
                                      exist: true
                                    );
                                  }
                                });
                              },
                              child: Container(
                                height: SizeConfig.safeBlockVertical * 30,
                                width: SizeConfig.safeBlockHorizontal * 15,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.add, size: 100),
                                    Text('New', style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold
                                    ))
                                  ],
                                ),
                              ),
                            );
                          }
                        );
                        }
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0
                    ),
                    child: RaisedButton(
                      color: (snapshot.data.length > 0) ? Colors.white : Colors.grey,
                      elevation: 0.0,
                      onPressed: (){
                        if(snapshot.data.length > 0){
                          for (var order in snapshot.data) {
                            OrderService().updateOrderStatus(
                              uuid: order.uuid, 
                              status: 'void'
                            );
                          }
                        }
                        //(ordersCalling.length > 0) ? OrderService()
                        //-TODO: Function Recall--------------------------------------------
                      },
                      child: Container(
                        height: SizeConfig.safeBlockVertical * 30,
                        width: SizeConfig.safeBlockHorizontal * 15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.cancel, size: 100),
                            Text('Void', style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 16.0,
                    ),
                    child: RaisedButton(
                      color: Colors.white,
                      elevation: 0.0,
                      onPressed: (){
                        if(snapshot.data.length > 0){
                          for (var order in snapshot.data) {
                            OrderService().updateOrderStatus(
                              uuid: order.uuid, 
                              status: 'completed'
                            );
                          }
                        }
                        //-TODO: Function Complete-------------------------------------------
                      },
                      child: Container(
                        height: SizeConfig.safeBlockVertical * 30,
                        width: SizeConfig.safeBlockHorizontal * 25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.check, size: 100),
                            Text('Complete', style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold
                            ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }
}