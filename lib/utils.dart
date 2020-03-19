import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:async';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:qms_device/protos/orders.pb.dart';

class ImageLoader{

  static Future<ui.Image> loadImageFromPath({String path}) async {
    File imageFile = File(path);
    List<int> img = imageFile.readAsBytesSync();
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img){
      return completer.complete(img);
    });
    return completer.future;
  }

  static Future<ui.Image> loadImageFromAsset({String path}) async {
    final ByteData data = await rootBundle.load(path);
    List<int> img = Uint8List.view(data.buffer);
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img){
      return completer.complete(img);
    });
    return completer.future;
  }
}

class ImageEditor extends CustomPainter{
  ui.Image image;
  Rect outputRect;
  BoxFit imageFit;
  
  ImageEditor({this.image, this.outputRect, this.imageFit});

  @override
  void paint(ui.Canvas canvas, ui.Size size) async {
    //image = await ImageLoader.loadImage(path: path);
    //ByteData data = await image.toByteData();
    //canvas.drawImage(image, Offset.zero, Paint());
    final Size imageSize = Size(image.width.toDouble(), image.height.toDouble());
    //final Size outputSize = Size(SizeConfig.safeBlockHorizontal * 50, SizeConfig.safeBlockVertical * 50);
    final FittedSizes sizes = applyBoxFit(imageFit, imageSize, outputRect.size);
    //final FittedSizes sizes = applyBoxFit(BoxFit.cover, imageSize, outputRect.size);
    final Rect inputSubrect = Alignment.center.inscribe(sizes.source, Offset.zero & imageSize);
    final Rect outputSubrect = Alignment.center.inscribe(sizes.destination, outputRect);
    canvas.drawImageRect(image, inputSubrect, outputSubrect, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class TextureImage{
    //-Create texture for text from image--------------------------------------------------
  static Future<TextStyle> textureText({String path, TextStyle textStyle}) async {
    ui.Image image;
    try {
      image = await ImageLoader.loadImageFromPath(path: path);
    } catch (e) {
      image = await ImageLoader.loadImageFromAsset(
        path: 'assets/defaultFontColor.png'
      );
    }
    Float64List matrix4 = Matrix4.identity().storage;
    return textStyle.copyWith(
      foreground: Paint()
        ..shader = ImageShader(image, TileMode.mirror, TileMode.mirror, matrix4)
    );
  }

  //-Create texture for Container from image---------------------------------------------
  static Future<CustomPaint> textureContainer({
    String path,
    String defaultImageAsset,
    String defaultImagePath,
    Widget child,
    Rect outputRect,
    BoxFit imageFit
  }) async {
    ui.Image image;
    try {
      image = await ImageLoader.loadImageFromPath(path: path);
    } catch (e) {
      try {
        image = await ImageLoader.loadImageFromPath(
          path: defaultImagePath
        );
      } catch (e) {
        image = await ImageLoader.loadImageFromAsset(path: defaultImageAsset);
      }
    }
    /*if(defaultImageAsset.contains('.gif')){
      return CustomPaint(
        foregroundPainter: AnimatedPainter(image),
      );
    } else {
    }*/
    return CustomPaint(
      painter: ImageEditor(
        image: image,
        outputRect: outputRect,
        imageFit: imageFit
      ),
      child: child,
    );
  }

  static Future<Widget> checkFile(
    {String pathImage, Widget widget, Widget exceptionWidget, Rect outputRect, BoxFit boxFit}
  ) async {
    File checkFile = File(pathImage);
    bool fileExist = await checkFile.exists();
    if(fileExist){
      return TextureImage.textureContainer(
        path: pathImage,
        defaultImageAsset: 'assets/defaultContainerColor.png',
        outputRect: outputRect,
        child: widget,
        imageFit: boxFit
      );
    } else {
      return exceptionWidget;
    }
  }
}

class GroupBy{
  static List<List<Order>> groupByTenant(List<Order> listOrder){
    var _mapTenant = groupBy(listOrder, (obj) => obj.tenantId);
    var _tenants = _mapTenant.values.toList();
    return _tenants;
  }

  static List<List<Order>> groupBySourceBatch(List<Order> listOrder){
    var _mapSourceBatch = groupBy(listOrder, (obj) => obj.sourceBatch);
    var _orders = _mapSourceBatch.values.toList();
    return _orders;
  }
}