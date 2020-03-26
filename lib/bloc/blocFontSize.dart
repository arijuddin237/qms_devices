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
        fontSize1: ResponsiveWidget.screenLessThan300(context)
          ? 50 : ResponsiveWidget.screenMoreThan300(context)
          ? 60 : ResponsiveWidget.screenMoreThan500(context)
          ? 50 : ResponsiveWidget.screenMoreThan700(context)
          ? 50 : ResponsiveWidget.screenMoreThan900(context)
          ? 85 : ResponsiveWidget.screenMoreThan1100(context)
          ? 90 : ResponsiveWidget.screenMoreThan1300(context)
          ? 95 : 100,
        fontSize2: ResponsiveWidget.screenLessThan300(context)
          ? 45 : ResponsiveWidget.screenMoreThan300(context)
          ? 55 : ResponsiveWidget.screenMoreThan500(context)
          ? 55 : ResponsiveWidget.screenMoreThan700(context)
          ? 75 : ResponsiveWidget.screenMoreThan900(context)
          ? 80 : ResponsiveWidget.screenMoreThan1100(context)
          ? 85 : ResponsiveWidget.screenMoreThan1300(context)
          ? 90 : 95,
        fontSize3: ResponsiveWidget.screenLessThan300(context)
          ? 40 : ResponsiveWidget.screenMoreThan300(context)
          ? 50 : ResponsiveWidget.screenMoreThan500(context)
          ? 55 : ResponsiveWidget.screenMoreThan700(context)
          ? 70 : ResponsiveWidget.screenMoreThan900(context)
          ? 75 : ResponsiveWidget.screenMoreThan1100(context)
          ? 80 : ResponsiveWidget.screenMoreThan1300(context)
          ? 85 : 90,
        fontSize4: ResponsiveWidget.screenLessThan300(context)
          ? 35 : ResponsiveWidget.screenMoreThan300(context)
          ? 45 : ResponsiveWidget.screenMoreThan500(context)
          ? 55 : ResponsiveWidget.screenMoreThan700(context)
          ? 65 : ResponsiveWidget.screenMoreThan900(context)
          ? 70 : ResponsiveWidget.screenMoreThan1100(context)
          ? 75 : ResponsiveWidget.screenMoreThan1300(context)
          ? 80 : 85,
        fontSize5: ResponsiveWidget.screenLessThan300(context)
          ? 30 : ResponsiveWidget.screenMoreThan300(context)
          ? 40 : ResponsiveWidget.screenMoreThan500(context)
          ? 50 : ResponsiveWidget.screenMoreThan700(context)
          ? 60 : ResponsiveWidget.screenMoreThan900(context)
          ? 65 : ResponsiveWidget.screenMoreThan1100(context)
          ? 70 : ResponsiveWidget.screenMoreThan1300(context)
          ? 75 : 80,
        fontSize6: ResponsiveWidget.screenLessThan300(context)
          ? 25 : ResponsiveWidget.screenMoreThan300(context)
          ? 35 : ResponsiveWidget.screenMoreThan500(context)
          ? 45 : ResponsiveWidget.screenMoreThan700(context)
          ? 55 : ResponsiveWidget.screenMoreThan900(context)
          ? 60 : ResponsiveWidget.screenMoreThan1100(context)
          ? 65 : ResponsiveWidget.screenMoreThan1300(context)
          ? 70 : 75,
        fontSize7: ResponsiveWidget.screenLessThan300(context)
          ? 20 : ResponsiveWidget.screenMoreThan300(context)
          ? 30 : ResponsiveWidget.screenMoreThan500(context)
          ? 40 : ResponsiveWidget.screenMoreThan700(context)
          ? 50 : ResponsiveWidget.screenMoreThan900(context)
          ? 55 : ResponsiveWidget.screenMoreThan1100(context)
          ? 60 : ResponsiveWidget.screenMoreThan1300(context)
          ? 65 : 70,
        fontSize8: ResponsiveWidget.screenLessThan300(context)
          ? 15 : ResponsiveWidget.screenMoreThan300(context)
          ? 20 : ResponsiveWidget.screenMoreThan500(context)
          ? 25 : ResponsiveWidget.screenMoreThan700(context)
          ? 35 : ResponsiveWidget.screenMoreThan900(context)
          ? 45 : ResponsiveWidget.screenMoreThan1100(context)
          ? 50 : ResponsiveWidget.screenMoreThan1300(context)
          ? 55 : 60,
        fontSize9: ResponsiveWidget.screenLessThan300(context)
          ? 15 : ResponsiveWidget.screenMoreThan300(context)
          ? 18 : ResponsiveWidget.screenMoreThan500(context)
          ? 20 : ResponsiveWidget.screenMoreThan700(context)
          ? 25 : ResponsiveWidget.screenMoreThan900(context)
          ? 35 : ResponsiveWidget.screenMoreThan1100(context)
          ? 40 : ResponsiveWidget.screenMoreThan1300(context)
          ? 45 : 50,
        fontSize10: ResponsiveWidget.screenLessThan300(context)
          ? 13 : ResponsiveWidget.screenMoreThan300(context)
          ? 15 : ResponsiveWidget.screenMoreThan500(context)
          ? 15 : ResponsiveWidget.screenMoreThan700(context)
          ? 18 : ResponsiveWidget.screenMoreThan900(context)
          ? 25 : ResponsiveWidget.screenMoreThan1100(context)
          ? 30 : ResponsiveWidget.screenMoreThan1300(context)
          ? 35 : 40,
      )
      /*FontSize(
        fontSize1: ResponsiveWidget.isSmallScreen(context)
          ? 70 : ResponsiveWidget.isMediumScreen(context)
          ? 90 : 110,
        fontSize2: ResponsiveWidget.isSmallScreen(context)
          ? 65 : ResponsiveWidget.isMediumScreen(context)
          ? 85 : 105,
        fontSize3: ResponsiveWidget.isSmallScreen(context)
          ? 60 : ResponsiveWidget.isMediumScreen(context)
          ? 80 : 100,
        fontSize4: ResponsiveWidget.isSmallScreen(context)
          ? 55 : ResponsiveWidget.isMediumScreen(context)
          ? 75 : 95,
        fontSize5: ResponsiveWidget.isSmallScreen(context)
          ? 55 : ResponsiveWidget.isMediumScreen(context)
          ? 75 : 90,
        fontSize6: ResponsiveWidget.isSmallScreen(context)
          ? 50 : ResponsiveWidget.isMediumScreen(context)
          ? 70 : 85,
        fontSize7: ResponsiveWidget.isSmallScreen(context)
          ? 45 : ResponsiveWidget.isMediumScreen(context)
          ? 65 : 80,
        fontSize8: ResponsiveWidget.isSmallScreen(context)
          ? 40 : ResponsiveWidget.isMediumScreen(context)
          ? 60 : 75,
        fontSize9: ResponsiveWidget.isSmallScreen(context)
          ? 35 : ResponsiveWidget.isMediumScreen(context)
          ? 55 : 70,
        fontSize10: ResponsiveWidget.isSmallScreen(context)
          ? 30 : ResponsiveWidget.isMediumScreen(context)
          ? 50 : 65
      )*/
    );
  }

  void dispose(){
    _fontSize.close();
  }
}
final blocFontSize = BlocFontSize();