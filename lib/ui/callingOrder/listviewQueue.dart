import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocFontSize.dart';
import 'package:qms_device/bloc/blocOrder.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/model/fontSize.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/service/orderService.dart';
import 'package:qms_device/utils.dart';

class ListViewQueue extends StatelessWidget {
  final List<List<Order>> orders;
  final bool calledQueue;

  const ListViewQueue({
    Key key, 
    this.orders, 
    this.calledQueue: false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FontSize>(
      stream: blocFontSize.getFontSize.stream,
      builder: (context, snapshotFont) {
        if(!snapshotFont.hasData){
          return Container();
        }
        return ListView.separated(
          separatorBuilder: (context, index){
            return Divider(
              color: Colors.black,
            );
          },
          shrinkWrap: true,
          itemCount: orders.length,
          itemBuilder: (context, index){
            var _mapSourceBatch = groupBy(orders[index], (obj) => obj.sourceBatch);
            var _sourceBatch = _mapSourceBatch.values.toList();
            return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _sourceBatch.length,
              separatorBuilder: (context, ind){
                return Divider(
                  color: Colors.black,
                );
              },
              itemBuilder: (context, index2){
                return InkWell(
                  onTap: (){
                    if(calledQueue){
                      blocOrders.addHeaderCalling(_sourceBatch[index2]);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.assessment, 
                              size: snapshotFont.data.fontSize9
                            ),
                          ),
                          Container(
                            width: ResponsiveWidget.isSmallScreen(context)
                              ? SizeConfig.safeBlockHorizontal * 9
                              : ResponsiveWidget.isMediumScreen(context)
                              ? SizeConfig.safeBlockHorizontal * 7
                              : SizeConfig.safeBlockHorizontal * 5,
                            child: Text(_sourceBatch[index2][0].sourceBatch,
                              style: TextStyle(
                                fontSize: snapshotFont.data.fontSize10,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ),
                          Container(
                            width: ResponsiveWidget.isSmallScreen(context)
                              ? SizeConfig.safeBlockHorizontal * 15
                              : ResponsiveWidget.isMediumScreen(context)
                              ? SizeConfig.safeBlockHorizontal * 19
                              : SizeConfig.safeBlockHorizontal * 18,
                            child: Text(_sourceBatch[index2][0].tenantId,
                              style: TextStyle(
                                fontSize: snapshotFont.data.fontSize10
                              )
                            ),
                          )
                        ],
                      ),
                      calledQueue
                      ? Container()
                      : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          elevation: 0.0,
                          color: Colors.orange,
                          child: Container(
                            width: ResponsiveWidget.isSmallScreen(context)
                              ? SizeConfig.safeBlockHorizontal * 8
                              : ResponsiveWidget.isMediumScreen(context)
                              ? SizeConfig.safeBlockHorizontal * 9
                              : SizeConfig.safeBlockHorizontal * 7,
                            height: SizeConfig.safeBlockVertical * 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon((calledQueue) ? Icons.cancel : Icons.notifications, 
                                  size: snapshotFont.data.fontSize10,),
                                Text((calledQueue) ? 'void' : 'Call', style: TextStyle(
                                  fontSize: snapshotFont.data.fontSize10
                                ))
                              ],
                            ),
                          ),
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  content: Text('Call Order ${_sourceBatch[index2][0].sourceBatch} ?',
                                    style: TextStyle(
                                      fontSize: snapshotFont.data.fontSize9
                                    )
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Cancel', style: TextStyle(
                                        fontSize: snapshotFont.data.fontSize10,
                                        color: Colors.black
                                      )),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                    ),
                                    FlatButton(
                                      child: Text('Ok', style: TextStyle(
                                        fontSize: snapshotFont.data.fontSize10
                                      )),
                                      onPressed: (){
                                        for (var orders in _sourceBatch[index2]) {
                                          OrderService().updateOrderStatus(
                                            uuid: orders.uuid, 
                                            status: 'calling'
                                          );
                                        }
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              }
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        );
      }
    );
  }
}