import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocFontSize.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/model/fontSize.dart';
import 'package:qms_device/utils.dart';

class TenantGridViewContainer extends StatelessWidget {
  final String sourceBatch;
  final String tenantId;

  const TenantGridViewContainer({Key key, this.sourceBatch, this.tenantId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.safeBlockVertical * 10
            ),
            child: Opacity(
              opacity: 0.4,
              child: Container(
                width: SizeConfig.safeBlockHorizontal * 5,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/serve2.png")
                  )
                ),
              ),
            ),
          ),
          (sourceBatch != null) ?
          StreamBuilder<FontSize>(
            stream: blocFontSize.getFontSize.stream,
            builder: (context, snapshotFont) {
              if(!snapshotFont.hasData){
                return Container();
              }
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      width: SizeConfig.safeBlockHorizontal * 25,
                      height: SizeConfig.safeBlockVertical * 13,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          FutureBuilder(
                            future: TextureImage.checkFile(
                              pathImage: '$path/skinpack/$tenantId-Logo.png',
                              widget: Container(
                                width: SizeConfig.safeBlockHorizontal * 20,
                                height: SizeConfig.safeBlockVertical * 10,
                              ),
                              exceptionWidget: FutureBuilder(
                                future: TextureImage.textureText(
                                  path: '$path/skinpack/tenantCardColorFront.png',
                                  textStyle: TextStyle(
                                    fontSize: snapshotFont.data.fontSize10
                                  ),
                                ),
                                builder: (context, snapshot){
                                  if(snapshot.hasData){
                                    return Text(tenantId, style: snapshot.data);
                                  } else {
                                    return Text(tenantId, style: TextStyle(
                                      fontSize: snapshotFont.data.fontSize10
                                    ));
                                  }
                                },
                              ),
                              outputRect: Rect.fromLTWH(
                                0.0, 0.0, 
                                SizeConfig.safeBlockHorizontal * 20,
                                SizeConfig.safeBlockVertical * 11
                              ),
                              boxFit: BoxFit.cover
                            ),
                            builder: (context, snapshot){
                              if(snapshot.hasData) {
                                return snapshot.data;
                              } else {
                                return Text(tenantId, style: TextStyle(
                                  fontSize: snapshotFont.data.fontSize10
                                ));
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    FutureBuilder(
                      future: TextureImage.textureText(
                        path: '$path/skinpack/tenantCardColorFront.png',
                        textStyle: TextStyle(
                          fontSize: snapshotFont.data.fontSize10
                        )
                      ),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return Text(sourceBatch, style: snapshot.data);
                        } else {
                          return Text(sourceBatch, style: TextStyle(
                            fontSize: snapshotFont.data.fontSize10
                          ));
                        }
                      },
                    )
                  ],
                ),
              );
            }
          ) : Container()
        ],
      ),
    );
  }
}