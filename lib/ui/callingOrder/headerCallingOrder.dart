import 'package:flutter/material.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/service/orderService.dart';

class HeaderCallingOrder extends StatelessWidget {
  final List<Order> ordersCalling;

  const HeaderCallingOrder({Key key, this.ordersCalling}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
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
                        (ordersCalling != null) ? ordersCalling[0].sourceBatch : '--',
                        style: TextStyle(
                          fontSize: 90,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        (ordersCalling != null) ? ordersCalling[0].tenantId : '--',
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
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 0.0,
                  onPressed: (){
                    OrderService().createUuid(
                      sourceId: 'POS01'
                    ).then((data){
                      OrderService().createOrder(
                        tenantId: 'testMerchant123',
                        sourceId: 'POS01',
                        uuId: data.uuid,
                        sourceBatch: 'A05'
                      );
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0
                ),
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 0.0,
                  onPressed: (){
                    if(ordersCalling != null){
                      for (var order in ordersCalling) {
                        OrderService().updateOrderStatus(
                          uuid: order.uuid, 
                          status: 'calling'
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
                        Icon(Icons.notifications, size: 100),
                        Text('Recall', style: TextStyle(
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
                    if(ordersCalling != null){
                      for (var order in ordersCalling) {
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
}