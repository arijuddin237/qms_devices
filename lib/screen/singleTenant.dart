import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocOrder.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/library/libSizeConfig.dart';
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
  Padding _paddignWidget({Widget child}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }

  Widget _streamBlocQueue(){
    List _ordersQueue = [];
    return StreamBuilder<List<Order>>(
      //stream: blocOrders.subject.stream,
      builder: (context, snapshot){
        if(snapshot.hasData){
          _ordersQueue.clear();
          for (var i = 0; i < snapshot.data.length; i++) {
            if(
              snapshot.data[i].status != "ready" && 
              snapshot.data[i].status != "completed" &&
              snapshot.data[i].status != "void"
            ){
              _ordersQueue.add(snapshot.data[i]);
            }
          }

          var _mapQueue = groupBy(_ordersQueue, (obj) => obj.sourceBatch);
          var _queue = _mapQueue.values.toList();

          return _buildListViewQueue(_queue);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _streamBlocReady(){
    List _ordersReady = [];
    return StreamBuilder<List<Order>>(
      //stream: blocOrders.subject.stream,
      builder: (context, snapshot){
        if(snapshot.hasData){
          _ordersReady.clear();
          for (var i = 0; i < snapshot.data.length; i++) {
            if(snapshot.data[i].status == "ready"){
              _ordersReady.add(snapshot.data[i]);
            }
          }
          var _mapReady = groupBy(_ordersReady, (obj) => obj.sourceBatch);
          var _ready = _mapReady.values.toList();

          return _buildListViewReady(_ready);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildListViewQueue(List<List> _ordersQueue){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _ordersQueue.length,
      itemBuilder: (context, index){
        return _paddignWidget(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FutureBuilder(
                future: TextureImage.textureText(
                  path: '$path/skinpackSingleTenant/queueContainerColorFront.png',
                  textStyle: TextStyle(
                    fontSize: 50
                  )
                ),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return Text('- '+_ordersQueue[index][0].sourceBatch, style: snapshot.data);
                  } else {
                    return Text('- '+_ordersQueue[index][0].sourceBatch, style: TextStyle(
                      fontSize: 50
                    ));
                  }
                },
              )
            ],
          )
        );
      },
    );
  }

  Widget _buildListViewReady(List<List> _ordersReady){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _ordersReady.length,
      itemBuilder: (context, index){
        return _paddignWidget(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FutureBuilder(
                future: TextureImage.textureText(
                  path: '$path/skinpackSingleTenant/readyContainerColorFront.png',
                  textStyle: TextStyle(
                    fontSize: 50
                  )
                ),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return Text('- '+_ordersReady[index][0].sourceBatch, style: snapshot.data);
                  } else {
                    return Text('- '+_ordersReady[index][0].sourceBatch, style: TextStyle(
                      fontSize: 50
                    ));
                  }
                },
              )
            ],
          )
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Container(
                  //color: Colors.transparent,
                  width: SizeConfig.safeBlockHorizontal * 30,
                  height: SizeConfig.safeBlockVertical * 15,
                ),
                FutureBuilder(
                  future: TextureImage.checkFile(
                    pathImage: '$path/skinpackSingleTenant/Tenant_Test1-Logo.png',
                    widget: _containerLogo(),
                    exceptionWidget: Text('testMerchant124', style: TextStyle(
                      fontSize: 45
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
                      return Text('testMerchant124', style: TextStyle(
                        fontSize: 45
                      ));
                    }
                  },
                )
              ],
            )
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FutureBuilder(
                future: TextureImage.textureContainer(
                  path: '$path/skinpackSingleTenant/readyContainerColorBack.png',
                  defaultImageAsset: 'assets/defaultContainerColor.png',
                  outputRect: Rect.fromLTWH(
                    0.0, 0.0, 
                    SizeConfig.safeBlockHorizontal * 48, 
                    SizeConfig.safeBlockVertical * 80
                  ),
                  imageFit: BoxFit.cover,
                  child: ContainerSingleTenant(
                    widgetStream: _streamBlocReady(),
                    text: 'READY',
                    pathImageFront: '$path/skinpackSingleTenant/readyContainerColorFront.png',
                  )
                ),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return snapshot.data;
                  } else {
                    return ContainerSingleTenant(
                      widgetStream: _streamBlocReady(),
                      text: 'READY',
                      pathImageFront: '$path/skinpackSingleTenant/readyContainerColorFront.png',
                    );
                  }
                },
              ),
              FutureBuilder(
                future: TextureImage.textureContainer(
                  path: '$path/skinpackSingleTenant/queueContainerColorBack.png',
                  defaultImageAsset: 'assets/defaultContainerColor.png',
                  outputRect: Rect.fromLTWH(
                    0.0, 0.0, 
                    SizeConfig.safeBlockHorizontal * 48,
                    SizeConfig.safeBlockVertical * 80
                  ),
                  imageFit: BoxFit.cover,
                  child: ContainerSingleTenant(
                    widgetStream: _streamBlocQueue(),
                    text: 'WAITING QUEUE',
                    pathImageFront: '$path/skinpackSingleTenant/queueContainerColorFront.png',
                  )
                ),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return snapshot.data;
                  } else {
                    return ContainerSingleTenant(
                      widgetStream: _streamBlocQueue(),
                      text: 'WAITING QUEUE',
                      pathImageFront: '$path/skinpackSingleTenant/queueContainerColorFront.png',
                    );
                  }
                },
              )
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
          stream: _service.streamGetOrderWith(
            order: Order()
              ..tenantId = 'testMerchant124'
          ),
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
                path: '$path/skinpackSingleTenant/background.jpg',
                defaultImageAsset: 'assets/defaultBackgroundImage.png',
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