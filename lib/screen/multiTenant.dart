import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocOrder.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/service/orderService.dart';
import 'package:qms_device/ui/nowServingContainer.dart';
import 'package:qms_device/ui/scrollingText.dart';
import 'package:qms_device/ui/tenantGridViewContainer.dart';
import 'package:qms_device/ui/waitingQueueContainer.dart';
import 'package:qms_device/utils.dart';

class MultiTenant extends StatefulWidget {
  @override
  _MultiTenantState createState() => _MultiTenantState();
}

class _MultiTenantState extends State<MultiTenant> {
  OrderService _service = OrderService();

  //-Stream Orders from BLoC and filter by tenantId, status = ready----------------------
  Widget _streamOrdersGridViewTenant(){
    final double itemHeight = SizeConfig.safeBlockVertical * 98 /4;
    final double itemWidth = SizeConfig.safeBlockHorizontal * 50 / 2;

    return StreamBuilder<List<List<Order>>>(
      stream: blocOrders.ordersCalling.stream,
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Container();
        }
        print('read from bloc : '+snapshot.data.length.toString());
          return GridView.count(
            physics: NeverScrollableScrollPhysics(),
            primary: false,
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
            children: List.generate(8, (index){
              String _sourceBatch(){
                if(index < snapshot.data.length){
                  return snapshot.data[index].first.sourceBatch;
                } else {
                  return null;
                }
              }

              String _tenantId(){
                if(index < snapshot.data.length){
                  return snapshot.data[index].first.tenantId;
                } else {
                  return null;
                }
              }
              return _buildCardTenant(_sourceBatch(), _tenantId());
            })
          );
      },
    );
  }

  //-Stream Orders from BLoC and filter by order status = ready--------------------------
  Widget _streamOrdersNowServing(){
    return StreamBuilder<List<List<Order>>>(
      stream: blocOrders.ordersCalling.stream,
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Container();
        } else {
          String _sourceBatch(){
            if(snapshot.data.length > 0){
              return snapshot.data[0].first.sourceBatch;
            } else {
              return null;
            }
          }

          String _tenantId(){
            if(snapshot.data.length > 0){
              return snapshot.data[0].first.tenantId;
            } else {
              return null;
            }
          }
          return _buildCardOrdersReady(_sourceBatch(), _tenantId());
        }
      },
    );
  }

  //-Stream Orders from BLoC and filter by order status = new / pending / processing-----
  Widget _streamOrdersWaitingQueue(){
    return StreamBuilder<List<List<Order>>>(
      stream: blocOrders.ordersQueue.stream,
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Container();
        } else {
          return _buildCardOrdersQueue(snapshot.data);
        }
      },
    );
  }

  //-Build card tenant-------------------------------------------------------------------
  Widget _buildCardTenant(String sourceBatch, String tenantId){
    final double itemHeight = ((SizeConfig.safeBlockVertical * 95) - 45) /4;
    final double itemWidth = SizeConfig.safeBlockHorizontal * 47 / 2;

    return Card(
      elevation: 0,
      child: FutureBuilder(
        future: TextureImage.textureContainer(
          path: (sourceBatch != null) ? 
            '$path/skinpack/$tenantId.png' : 
            '$path/skinpack/tenantCardColorBack.png',
          defaultImageAsset: 'assets/defaultContainerColor.png',
          defaultImagePath: '$path/skinpack/tenantCardColorBack.png',
          outputRect: Rect.fromLTWH(
            0.0, 0.0, 
            itemWidth, itemHeight
          ),
          imageFit: BoxFit.cover,
          child: TenantGridViewContainer(
            sourceBatch: sourceBatch,
            tenantId: tenantId,
          )
        ),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Container(
              child: snapshot.data,
            );
          } else {
            return Container(
              child: TenantGridViewContainer(
                sourceBatch: sourceBatch,
                tenantId: tenantId,
              )
            );
          }
        },
      )
    );
  }

  //-Build card order ready--------------------------------------------------------------
  Widget _buildCardOrdersReady(String sourceBatch, String tenantId){
    return Card(
      elevation: 0.0,
      child: FutureBuilder(
        future: TextureImage.textureContainer(
          path: '$path/skinpack/readyContainerColorBack.png',
          defaultImageAsset: 'assets/defaultContainerColor.png',
          //path: "$path/skinpack/gifAnimation.gif",
          //defaultImageAsset: '$path/skinpack/gifAnimation.gif',
          outputRect: Rect.fromLTWH(
            0.0, 0.0, 
            SizeConfig.safeBlockHorizontal * 45, SizeConfig.safeBlockVertical * 47.5
          ),
          imageFit: BoxFit.cover,
          child: NowServingContainer(
            sourceBatch: sourceBatch,
            tenantId: tenantId,
          )
        ),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return snapshot.data;
          } else {
            return NowServingContainer(
              sourceBatch: sourceBatch,
              tenantId: tenantId,
            );
          }
        },
      ),
    );
  }

  //-Build card order queue--------------------------------------------------------------
  Widget _buildCardOrdersQueue(List<List<Order>> _ordersQueue){
    return Card(
      elevation: 0,
      child: FutureBuilder(
        future: TextureImage.textureContainer(
          path: '$path/skinpack/queueContainerColorBack.png',
          defaultImageAsset: 'assets/defaultContainerColor.png',
          outputRect: Rect.fromLTWH(
            0.0, 0.0, 
            SizeConfig.safeBlockHorizontal * 45, SizeConfig.safeBlockVertical * 45
          ),
          imageFit: BoxFit.cover,
          child: WaitingQueueContainer(ordersQueue: _ordersQueue)
        ),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return snapshot.data;
          } else {
            return WaitingQueueContainer(ordersQueue: _ordersQueue);
          }
        },
      )
    );
  }

  Widget _runningText(){
    return FutureBuilder(
      future: TextureImage.textureText(
        path: '$path/skinpack/readyContainerColorFront.png',
        textStyle: TextStyle(
          fontSize: 20
        )
      ),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return ScrollingText(
            text: 'this is scrolling text...',
            textStyle: snapshot.data,
          );
        } else {
          return ScrollingText(
            text: 'this is scrolling text...',
            textStyle: TextStyle(
              fontSize: 20
            ),
          );
        }
      },
    );
  }

  Widget _containerBody(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: SizeConfig.safeBlockHorizontal * 48,
                height: SizeConfig.safeBlockVertical * 95,
                child: _streamOrdersGridViewTenant()
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _streamOrdersNowServing(),
                  _streamOrdersWaitingQueue()
                ],
              )
            ],
          ),
          FutureBuilder(
            future: TextureImage.textureContainer(
              path: '$path/skinpack/readyContainerColorBack.png',
              defaultImageAsset: 'assets/defaultContainerColor.png',
              outputRect: Rect.fromLTWH(
                0, 0, 
                SizeConfig.safeBlockHorizontal * 99, 
                SizeConfig.safeBlockVertical * 3
              ),
              imageFit: BoxFit.cover,
              child: Container(
                height: SizeConfig.safeBlockVertical * 3,
                width: SizeConfig.safeBlockHorizontal * 100,
                child: _runningText()
              )
            ),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return snapshot.data;
              } else {
                return Container(
                  height: SizeConfig.safeBlockVertical * 3,
                  width: SizeConfig.safeBlockHorizontal * 100,
                  child: _runningText()
                );
              }
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    blocOrders.clearBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: _service.streamOrder(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Please Wait... '),
                    CircularProgressIndicator()
                  ],
                ),
              );
            }
            return FutureBuilder(
              future: TextureImage.textureContainer(
                path: '$path/skinpack/background.jpg',
                defaultImageAsset: 'assets/defaultBackgroundImage.png',
                outputRect: Rect.fromLTRB(
                  0.0, 0.0, 
                  SizeConfig.safeBlockHorizontal * 100, SizeConfig.safeBlockVertical * 100
                ),
                imageFit: BoxFit.cover,
                child: _containerBody()
              ),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return Container(
                    child: snapshot.data,
                  );
                } else {
                  return Container(
                    child: _containerBody(),
                  );
                }
              },
            );
          }
        )
      ),
    );
  }
}