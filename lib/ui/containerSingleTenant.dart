import 'package:flutter/material.dart';
import 'package:qms_device/bloc/blocFontSize.dart';
import 'package:qms_device/library/libSizeConfig.dart';
import 'package:qms_device/model/fontSize.dart';
import 'package:qms_device/utils.dart';

class ContainerSingleTenant extends StatelessWidget {
  final Widget widgetStream;
  final String text;
  final String pathImageFront;

  const ContainerSingleTenant({
    Key key, this.widgetStream, this.text, this.pathImageFront
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FontSize>(
      stream: blocFontSize.getFontSize.stream,
      builder: (context, snapshotFont) {
        if(!snapshotFont.hasData){
          return Container();
        }
        return Container(
          height: ResponsiveWidget.isSmallScreen(context)
            ? SizeConfig.safeBlockVertical * 65
            : ResponsiveWidget.isMediumScreen(context)
            ? SizeConfig.safeBlockVertical * 75
            : SizeConfig.safeBlockVertical * 80,
          width: SizeConfig.safeBlockHorizontal * 48,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Card(
                child: Container(
                  width: SizeConfig.safeBlockHorizontal * 48,
                  height: SizeConfig.safeBlockVertical * 10,
                  child: Center(
                    child: FutureBuilder(
                      future: TextureImage.textureText(
                        path: pathImageFront,
                        textStyle: TextStyle(
                          fontSize: snapshotFont.data.fontSize9
                        )
                      ),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return Text(text, style: snapshot.data);
                        } else {
                          return Text(text, style: TextStyle(
                            fontSize: snapshotFont.data.fontSize9
                          ));
                        }
                      },
                    ),
                  ),
                ),
              ),
              widgetStream
            ],
          ),
        );
      }
    );
  }
}