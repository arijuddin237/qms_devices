import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocFontSize.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/model/fontSize.dart';
import 'package:qms_device/utils.dart';

class NowServingContainer extends StatelessWidget {
  final String sourceBatch;
  final String tenantId;

  const NowServingContainer({Key key, this.sourceBatch, this.tenantId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FontSize>(
      stream: blocFontSize.getFontSize.stream,
      builder: (context, snapshotFont) {
        if(!snapshotFont.hasData){
          return Container();
        }
        return Container(
          height: SizeConfig.safeBlockVertical * 46.5,
          width: SizeConfig.safeBlockHorizontal * 45,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FutureBuilder(
                  future: TextureImage.textureText(
                    path: '$path/skinpack/readyContainerColorFront.png',
                    textStyle: TextStyle(
                      fontSize: snapshotFont.data.fontSize9
                    )
                  ),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return Text('Now Serving', style: snapshot.data);
                    } else {
                      return Text('Now Serving', style: TextStyle(
                        fontSize: snapshotFont.data.fontSize9
                      ));
                    }
                  },
                ),
                FutureBuilder(
                  future: TextureImage.textureContainer(
                    path: '$path/skinpack/readyContainerColorFront.png',
                    defaultImageAsset: 'assets/defaultFontColor.png',
                    outputRect: Rect.fromLTWH(
                      0.0, 0.0, 
                      SizeConfig.safeBlockHorizontal * 44, SizeConfig.safeBlockVertical
                    ),
                    imageFit: BoxFit.cover,
                    child: Container(
                      height: SizeConfig.safeBlockVertical,
                    )
                  ),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return snapshot.data;
                    } else {
                      return Container();
                    }
                  },
                ),
                FutureBuilder(
                  future: TextureImage.textureText(
                    path: '$path/skinpack/readyContainerColorFront.png',
                    textStyle: TextStyle(
                      fontSize: snapshotFont.data.fontSize1
                    )
                  ),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return Text((sourceBatch != null) ? sourceBatch : '- -',
                        style: snapshot.data
                      );
                    } else {
                      return Text((sourceBatch != null) ? sourceBatch : '- -',
                        style: TextStyle(
                          fontSize: snapshotFont.data.fontSize1
                        )
                      );
                    }
                  },
                ),
                Container(
                  color: Colors.white,
                  width: SizeConfig.safeBlockHorizontal * 45,
                  height: SizeConfig.safeBlockVertical * 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FutureBuilder(
                        future: TextureImage.checkFile(
                          pathImage: '$path/skinpack/$tenantId-Logo.png',
                          widget: Container(
                            width: SizeConfig.safeBlockHorizontal * 30,
                            height: SizeConfig.safeBlockVertical * 15,
                          ),
                          exceptionWidget: Text((tenantId != null) ? tenantId : '- -', style: TextStyle(
                            fontSize: snapshotFont.data.fontSize8
                          )),
                          outputRect: Rect.fromLTWH(
                            SizeConfig.safeBlockHorizontal * 2, 0.0, 
                            SizeConfig.safeBlockHorizontal * 25, 
                            SizeConfig.safeBlockVertical * 15
                          ),
                          boxFit: BoxFit.cover
                        ),
                        builder: (context, snapshot){
                          if(snapshot.hasData){
                            return snapshot.data;
                          } else {
                            return Text((tenantId != null) ? tenantId : '- -', style: TextStyle(
                              fontSize: snapshotFont.data.fontSize8
                            ));
                          }
                        },
                      ),
                    ],
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