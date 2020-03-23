import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocFontSize.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/model/fontSize.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/utils.dart';

class WaitingQueueContainer extends StatelessWidget {
  final List<List<Order>> ordersQueue;

  const WaitingQueueContainer({Key key, this.ordersQueue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FontSize>(
      stream: blocFontSize.getFontSize.stream,
      builder: (context, snapshotFont) {
        if(!snapshotFont.hasData){
          return Container();
        }
        return Container(
          width: SizeConfig.safeBlockHorizontal * 45,
          height: SizeConfig.safeBlockVertical * 45,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                FutureBuilder(
                  future: TextureImage.textureText(
                    path: '$path/skinpack/queueContainerColorFront.png',
                    textStyle: TextStyle(
                      fontSize: snapshotFont.data.fontSize9
                    )
                  ),
                  builder: (context, snapshot){
                    if(snapshot.hasData) {
                      return Text('WAITING QUEUE', style: snapshot.data);
                    } else {
                      return Text('WAITING QUEUE', style: TextStyle(
                        fontSize: snapshotFont.data.fontSize9
                      ));
                    }
                  },
                ),
                FutureBuilder(
                  future: TextureImage.textureContainer(
                    path: '$path/skinpack/queueContainerColorFront.png',
                    defaultImageAsset: 'assets/defaultFontColor.png',
                    outputRect: Rect.fromLTWH(
                      0.0, 0.0, 
                      SizeConfig.safeBlockHorizontal * 44, 
                      SizeConfig.safeBlockVertical
                    ),
                    imageFit: BoxFit.cover,
                    child: Container(
                      height: SizeConfig.safeBlockVertical
                    )
                  ),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return snapshot.data;
                    } else {
                      return Container();
                    }
                  }
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: ordersQueue.length,
                    itemBuilder: (context, index){
                      var _mapSourceBatch = groupBy(ordersQueue[index], (obj) => obj.sourceBatch);
                      var _sourceBatch = _mapSourceBatch.values.toList();
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _sourceBatch.length,
                        itemBuilder: (context, index2){
                          return FutureBuilder(
                              future: TextureImage.textureText(
                                path: '$path/skinpack/queueContainerColorFront.png',
                                textStyle: TextStyle(
                                  fontSize: snapshotFont.data.fontSize10
                                )
                              ),
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return Text(_sourceBatch[index2][0].sourceBatch, style: snapshot.data);
                                } else {
                                  return Text(_sourceBatch[index2][0].sourceBatch, style: TextStyle(
                                    fontSize: snapshotFont.data.fontSize10
                                  ));
                                }
                              },
                            );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}