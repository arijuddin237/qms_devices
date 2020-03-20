import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:qms_device/model/fontSize.dart';
import 'package:qms_device/utils.dart';

class BlocFontSize {
  BehaviorSubject<FontSize> _fontSize = BehaviorSubject<FontSize>();

  BehaviorSubject<FontSize> get getFontSize => _fontSize;

  void changeFontSize(BuildContext context) async {
    _fontSize.sink.add(
      FontSize(
        fontSize1: ResponsiveWidget.isSmallScreen(context)
          ? 70 : ResponsiveWidget.isMediumScreen(context)
          ? 90 : 110,
        fontSize2: ResponsiveWidget.isSmallScreen(context)
          ? 50 : ResponsiveWidget.isMediumScreen(context)
          ? 70 : 90,
        fontSize3: ResponsiveWidget.isSmallScreen(context)
          ? 30 : ResponsiveWidget.isMediumScreen(context)
          ? 50 : 70,
        fontSize4: ResponsiveWidget.isSmallScreen(context)
          ? 20 : ResponsiveWidget.isMediumScreen(context)
          ? 30 : 50,
        fontSize5: ResponsiveWidget.isSmallScreen(context)
          ? 10 : ResponsiveWidget.isMediumScreen(context)
          ? 20 : 30
      )
    );
  }

  void dispose(){
    _fontSize.close();
  }
}
final blocFontSize = BlocFontSize();