import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocFontSize.dart';
import 'package:qms_device/bloc/blocOrder.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/model/fontSize.dart';
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
  String _pathAssetDefaultContainerColor = 'assets/defaultContainerColor.png';
  String _pathAssetDefaultBackgroundImage = 'assets/defaultBackgroundImage.png';
  String _pathAssetDefaultFontColor = 'assets/defaultFontColor.png';
  String _pathTenantColorBack = '$path/skinpack/MTtenantCardColorBack.png';
  String _pathTenantColorFront = '$path/skinpack/MTtenantCardColorFront.png';
  String _pathReadyContainerColorBack = '$path/skinpack/MTreadyContainerColorBack.png';
  String _pathReadyContainerColorFront = '$path/skinpack/MTreadyContainerColorFront.png';
  String _pathQueueContainerColorBack = '$path/skinpack/MTqueueContainerColorBack.png';
  String _pathQueueContainerColorFront = '$path/skinpack/MTqueueContainerColorFront.png';
  String _pathRuningTextBack = '$path/skinpack/MTruningTextBack';
  String _pathRuningTextFront = '$path/skinpack/MTruningTextFront';
  String _pathBackground = '$path/skinpack/MTbackground.jpg';

  //-Stream Orders from BLoC and filter by tenantId, status = ready----------------------
  Widget _streamOrdersGridViewTenant(){
    final double itemHeight = ResponsiveWidget.isSmallScreen(context)
      ? SizeConfig.safeBlockVertical * 90 /4 
      : ResponsiveWidget.isMediumScreen(context)
      ? SizeConfig.safeBlockVertical * 93 /4
      : SizeConfig.safeBlockVertical * 98 /4;
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
    final double itemHeight = ResponsiveWidget.screenMoreThan1500(context)
      ? ((SizeConfig.safeBlockVertical * 95) - 45) /4
      : ((SizeConfig.safeBlockVertical * 95) - 40) /4;
    final double itemWidth = SizeConfig.safeBlockHorizontal * 47 / 2;

    return Card(
      elevation: 0,
      child: FutureBuilder(
        future: TextureImage.textureContainer(
          path: (sourceBatch != null) ? 
            '$path/skinpack/$tenantId.png' : 
            _pathTenantColorBack,
          defaultImageAsset: _pathAssetDefaultContainerColor,
          defaultImagePath: _pathTenantColorBack,
          outputRect: Rect.fromLTWH(
            0.0, 0.0, 
            itemWidth, itemHeight
          ),
          imageFit: BoxFit.cover,
          child: TenantGridViewContainer(
            sourceBatch: sourceBatch,
            tenantId: tenantId,
            tenantCardColorFront: _pathTenantColorFront,
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
                tenantCardColorFront: _pathTenantColorFront,
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
          path: _pathReadyContainerColorBack,
          defaultImageAsset: _pathAssetDefaultContainerColor,
          //path: "$path/skinpack/gifAnimation.gif",
          //defaultImageAsset: '$path/skinpack/gifAnimation.gif',
          outputRect: Rect.fromLTWH(
            0.0, 0.0, 
            SizeConfig.safeBlockHorizontal * 45, 
            SizeConfig.safeBlockVertical * 46.5
          ),
          imageFit: BoxFit.cover,
          child: NowServingContainer(
            sourceBatch: sourceBatch,
            tenantId: tenantId,
            readyContainerColorFront: _pathReadyContainerColorFront,
            defaultFontColor: _pathAssetDefaultFontColor,
          )
        ),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return snapshot.data;
          } else {
            return NowServingContainer(
              sourceBatch: sourceBatch,
              tenantId: tenantId,
              readyContainerColorFront: _pathReadyContainerColorFront,
              defaultFontColor: _pathAssetDefaultFontColor,
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
          path: _pathQueueContainerColorBack,
          defaultImageAsset: _pathAssetDefaultContainerColor,
          outputRect: Rect.fromLTWH(
            0.0, 0.0, 
            SizeConfig.safeBlockHorizontal * 45, 
            ResponsiveWidget.isSmallScreen(context)
              ? SizeConfig.safeBlockVertical * 36
              : ResponsiveWidget.isMediumScreen(context)
              ? SizeConfig.safeBlockVertical * 39.5
              : SizeConfig.safeBlockVertical * 45
          ),
          imageFit: BoxFit.cover,
          child: WaitingQueueContainer(
            ordersQueue: _ordersQueue,
            queueContainerColorFront: _pathQueueContainerColorFront,
          )
        ),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return snapshot.data;
          } else {
            return WaitingQueueContainer(
              ordersQueue: _ordersQueue,
              queueContainerColorFront: _pathQueueContainerColorFront,
            );
          }
        },
      )
    );
  }

  Widget _runningText(){
    return StreamBuilder<FontSize>(
      stream: blocFontSize.getFontSize.stream,
      builder: (context, snapshotFont) {
        if(!snapshotFont.hasData){
          return Container();
        }
        return FutureBuilder(
          future: TextureImage.textureText(
            path: _pathRuningTextFront,
            textStyle: TextStyle(
              fontSize: snapshotFont.data.fontSize10
            )
          ),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ScrollingText(
                text: 'some sample text',
                textStyle: snapshot.data,
              );
            } else {
              return ScrollingText(
                text: 'some sample text',
                textStyle: TextStyle(
                  fontSize: snapshotFont.data.fontSize10
                ),
              );
            }
          },
        );
      }
    );
  }

  Widget _containerBody(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                //color: Colors.blue,
                width: SizeConfig.safeBlockHorizontal * 48,
                height: ResponsiveWidget.isSmallScreen(context)
                  ? SizeConfig.safeBlockVertical * 90
                  : ResponsiveWidget.isMediumScreen(context)
                  ? SizeConfig.safeBlockVertical * 90
                  : SizeConfig.safeBlockVertical * 93,
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
              path: _pathRuningTextBack,
              defaultImageAsset: _pathAssetDefaultContainerColor,
              outputRect: Rect.fromLTWH(
                0, 0, 
                SizeConfig.safeBlockHorizontal * 99, 
                SizeConfig.safeBlockVertical * 5
              ),
              imageFit: BoxFit.cover,
              child: Container(
                height: SizeConfig.safeBlockVertical * 4,
                width: SizeConfig.safeBlockHorizontal * 100,
                child: _runningText()
              )
            ),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return snapshot.data;
              } else {
                return Container(
                  height: SizeConfig.safeBlockVertical * 4,
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
          stream: _service.streamGetOrder(),
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
                path: _pathBackground,
                defaultImageAsset: _pathAssetDefaultBackgroundImage,
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