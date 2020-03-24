import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocFontSize.dart';
import 'package:qms_device/bloc/blocOrder.dart';
import 'package:qms_device/bloc/blocSetting.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/model/fontSize.dart';
import 'package:qms_device/model/setting.dart';
import 'package:qms_device/model/sourceBatch.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/service/orderService.dart';
import 'package:qms_device/utils.dart';

class HeaderCallingOrder extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Order>>(
      stream: blocOrders.headerCalling.stream,
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Container();
        }
        return StreamBuilder<FontSize>(
          stream: blocFontSize.getFontSize.stream,
          builder: (context, snapshotFont) {
            if(!snapshotFont.hasData){
              return Container();
            }
            return Container(
              height: SizeConfig.safeBlockVertical * 34,
              color: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 28,
                    width: SizeConfig.safeBlockHorizontal * 35,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              //top: 15,
                              left: 8.0
                            ),
                            child: Icon(Icons.assessment, 
                              size: snapshotFont.data.fontSize7
                            ),
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
                                  fontSize: snapshotFont.data.fontSize8,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              Text(
                                (snapshot.data.length > 0) 
                                ? snapshot.data[0].tenantId 
                                : '--',
                                style: TextStyle(
                                  fontSize: snapshotFont.data.fontSize9
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
                            if(!snapshotSetting.hasData){
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
                                    height: SizeConfig.safeBlockVertical * 28,
                                    width: SizeConfig.safeBlockHorizontal * 12,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.add, size: snapshotFont.data.fontSize6),
                                        Text('New', style: TextStyle(
                                          fontSize: snapshotFont.data.fontSize8,
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
                            height: SizeConfig.safeBlockVertical * 28,
                            width: SizeConfig.safeBlockHorizontal * 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.cancel, size: snapshotFont.data.fontSize6),
                                Text('Void', style: TextStyle(
                                  fontSize: snapshotFont.data.fontSize8,
                                  fontWeight: FontWeight.bold
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
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
                            height: SizeConfig.safeBlockVertical * 28,
                            width: ResponsiveWidget.isSmallScreen(context)
                              ? SizeConfig.safeBlockHorizontal * 18
                              : ResponsiveWidget.isMediumScreen(context)
                              ? SizeConfig.safeBlockHorizontal * 19
                              : SizeConfig.safeBlockHorizontal * 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.check, size: snapshotFont.data.fontSize6),
                                Text('Complete', style: TextStyle(
                                  fontSize: snapshotFont.data.fontSize8,
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
    );
  }
}