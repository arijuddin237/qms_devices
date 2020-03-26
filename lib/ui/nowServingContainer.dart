import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocFontSize.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/model/fontSize.dart';
import 'package:qms_device/utils.dart';

class NowServingContainer extends StatelessWidget {
  final String sourceBatch;
  final String tenantId;
  final String readyContainerColorFront;
  final String defaultFontColor;

  const NowServingContainer({Key key, this.sourceBatch, this.tenantId, this.readyContainerColorFront, this.defaultFontColor}) : super(key: key);

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
                    path: readyContainerColorFront,
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
                    path: readyContainerColorFront,
                    defaultImageAsset: defaultFontColor,
                    outputRect: Rect.fromLTWH(
                      0.0, 0.0, 
                      ResponsiveWidget.isSmallScreen(context)
                        ? SizeConfig.safeBlockHorizontal * 40
                        : ResponsiveWidget.isMediumScreen(context)
                        ? SizeConfig.safeBlockHorizontal * 42
                        : SizeConfig.safeBlockHorizontal * 44, 
                      SizeConfig.safeBlockVertical
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
                    path: readyContainerColorFront,
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
                  height: ResponsiveWidget.isSmallScreen(context)
                    ? SizeConfig.safeBlockVertical * 13
                    : ResponsiveWidget.isMediumScreen(context)
                    ? SizeConfig.safeBlockVertical * 13
                    : SizeConfig.safeBlockVertical * 15,
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