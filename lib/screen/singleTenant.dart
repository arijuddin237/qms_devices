import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocFontSize.dart';
import 'package:qms_device/bloc/blocOrder.dart';
import 'package:qms_device/bloc/blocSetting.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/model/fontSize.dart';
import 'package:qms_device/model/setting.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/service/orderService.dart';
import 'package:qms_device/ui/containerSingleTenant.dart';
import 'package:qms_device/utils.dart';

class SingleTenant extends StatefulWidget {
  @override
  _SingleTenantState createState() => _SingleTenantState();
}

class _SingleTenantState extends State<SingleTenant> {
  OrderService _service = OrderService();
  String _pathAssetDefaultBackgroundImage = 'assets/defaultBackgroundImage.png';
  String _pathReadyColorBack = '$path/skinpack/STqueueCalledColorBack.png';
  String _pathReadyColorFront = '$path/skinpack/STqueueCalledColorFront.png';
  String _pathQueueColorBack = '$path/skinpack/STwaitingQueueColorBack.png';
  String _pathQueueColorFront = '$path/skinpack/STwaitingQueueColorFront.png';
  String _pathBackground = '$path/skinpack/STbackground.jpg';

  Widget _streamBlocOrders({
    @required Stream<List<List<Order>>> streamOrders,
    String pathFont
  }){
    return StreamBuilder<Setting>(
      stream: blocSetting.subject.stream,
      builder: (context, snapshotSetting){
        return Container(
          child: StreamBuilder<List<List<Order>>>(
            stream: streamOrders,
            builder: (context, snapshot){
              if(snapshot.hasData && snapshot.data.length > 0){
                List<List<Order>> orderList = List<List<Order>>();
                if(snapshotSetting.hasData){
                  for (var groupTenant in snapshot.data) {
                    List<Order> orders = List<Order>();
                    for (var order in groupTenant) {
                      if(order.tenantId == snapshotSetting.data.tenantId){
                        orders.add(order);
                      }
                    }
                    if(orders.length > 0){
                      orderList.add(orders);
                    }
                  }
                }
                return _buildListView(
                  orders: orderList,
                  pathFont: pathFont
                );
              } else {
                return Container();
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildListView({List<List<Order>> orders, String pathFont}){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: orders.length,
      itemBuilder: (context, index){
        var _mapSourceBatch = groupBy(orders[index], (obj) => obj.sourceBatch);
        var _sourceBatch = _mapSourceBatch.values.toList();
        return StreamBuilder<FontSize>(
          stream: blocFontSize.getFontSize.stream,
          builder: (context, snapshotFont) {
            if(!snapshotFont.hasData){
              return Container();
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _sourceBatch.length,
              itemBuilder: (context, index2){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FutureBuilder(
                      future: TextureImage.textureText(
                        path: pathFont,
                        textStyle: TextStyle(
                          fontSize: snapshotFont.data.fontSize9
                        )
                      ),
                      builder: (context, snapshot){
                        return Text('- '+_sourceBatch[index2][0].sourceBatch,
                          style: (snapshot.hasData) ? snapshot.data : TextStyle(
                            fontSize: snapshotFont.data.fontSize9
                          ));
                      },
                    )
                  ],
                );
              },
            );
          }
        );
      },
    );
  }

  Widget _containerLogo(){
    return Container(
      width: SizeConfig.safeBlockHorizontal * 30,
      height: SizeConfig.safeBlockVertical * 15,
    );
  }

  Widget _containerBody(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StreamBuilder<FontSize>(
            stream: blocFontSize.getFontSize.stream,
            builder: (context, snapshotFont) {
              if(!snapshotFont.hasData){
                return Container();
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      //color: Colors.transparent,
                      width: SizeConfig.safeBlockHorizontal * 30,
                      height: SizeConfig.safeBlockVertical * 15,
                    ),
                    StreamBuilder<Setting>(
                      stream: blocSetting.subject.stream,
                      builder: (context, snapshotSetting) {
                        if(!snapshotSetting.hasData){
                          return Container();
                        }
                        return FutureBuilder(
                          future: TextureImage.checkFile(
                            pathImage: '$path/skinpack/${snapshotSetting.data.tenantId}-logo.png',
                            widget: _containerLogo(),
                            exceptionWidget: Text(snapshotSetting.data.tenantId, style: TextStyle(
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 20 : ResponsiveWidget.isMediumScreen(context)
                                ? 30 : 45
                            )),
                            outputRect: Rect.fromLTWH(
                              0.0, 0.0,
                              SizeConfig.safeBlockHorizontal *25,
                              SizeConfig.safeBlockVertical * 15  
                            ),
                            boxFit: BoxFit.cover
                          ),
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return snapshot.data;
                            } else {
                              return Text(snapshotSetting.data.tenantId, style: TextStyle(
                                fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 20 : ResponsiveWidget.isMediumScreen(context)
                                ? 30 : 45
                              ));
                            }
                          },
                        );
                      }
                    )
                  ],
                )
              );
            }
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FutureBuilder(
                future: TextureImage.textureContainer(
                  path: _pathQueueColorBack,
                  defaultImageAsset: 'assets/defaultContainerColor.png',
                  outputRect: Rect.fromLTWH(
                    0.0, 0.0, 
                    SizeConfig.safeBlockHorizontal * 48,
                    ResponsiveWidget.isSmallScreen(context)
                      ? SizeConfig.safeBlockVertical * 65
                      : ResponsiveWidget.isMediumScreen(context)
                      ? SizeConfig.safeBlockVertical * 75
                      : SizeConfig.safeBlockVertical * 80,
                  ),
                  imageFit: BoxFit.cover,
                  child: ContainerSingleTenant(
                    widgetStream: _streamBlocOrders(
                      streamOrders: blocOrders.ordersQueue.stream,
                      pathFont: _pathQueueColorFront
                    ),
                    text: 'WAITING QUEUE',
                    pathImageFront: _pathQueueColorFront,
                  )
                ),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return snapshot.data;
                  } else {
                    return ContainerSingleTenant(
                      widgetStream: _streamBlocOrders(
                        streamOrders: blocOrders.ordersQueue.stream,
                        pathFont: _pathQueueColorFront
                      ),
                      text: 'WAITING QUEUE',
                      pathImageFront: _pathQueueColorFront,
                    );
                  }
                },
              ),
              FutureBuilder(
                future: TextureImage.textureContainer(
                  path: _pathReadyColorBack,
                  defaultImageAsset: 'assets/defaultContainerColor.png',
                  outputRect: Rect.fromLTWH(
                    0.0, 0.0, 
                    SizeConfig.safeBlockHorizontal * 48, 
                    ResponsiveWidget.isSmallScreen(context)
                      ? SizeConfig.safeBlockVertical * 65
                      : ResponsiveWidget.isMediumScreen(context)
                      ? SizeConfig.safeBlockVertical * 75
                      : SizeConfig.safeBlockVertical * 80,
                  ),
                  imageFit: BoxFit.cover,
                  child: ContainerSingleTenant(
                    widgetStream: _streamBlocOrders(
                      streamOrders: blocOrders.ordersCalling.stream,
                      pathFont: _pathReadyColorFront
                    ),
                    text: 'CALLED QUEUE',
                    pathImageFront: _pathReadyColorFront,
                  )
                ),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return snapshot.data;
                  } else {
                    return ContainerSingleTenant(
                      widgetStream: _streamBlocOrders(
                        streamOrders: blocOrders.ordersCalling.stream,
                        pathFont: _pathReadyColorFront
                      ),
                      text: 'CALLED QUEUE',
                      pathImageFront: _pathReadyColorFront,
                    );
                  }
                },
              ),
            ],
          )
        ],
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: _service.streamOrder(),
          builder: (context, snapshot) {
            if(snapshot.connectionState != ConnectionState.done){
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Please Wait... '),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
            return FutureBuilder(
              future: TextureImage.textureContainer(
                path: _pathBackground,
                defaultImageAsset: _pathAssetDefaultBackgroundImage,
                outputRect: Rect.fromLTWH(
                  0.0, 0.0, 
                  SizeConfig.safeBlockHorizontal * 100, 
                  SizeConfig.safeBlockVertical * 100
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
        ),
      )
    );
  }
}