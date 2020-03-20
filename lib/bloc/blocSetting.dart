import 'package:flutter/material.dart';
import 'package:qms_device/data/databaseHelper.dart';
import 'package:qms_device/model/sourceBatch.dart';
import 'package:rxdart/rxdart.dart';
import 'package:qms_device/model/setting.dart';

class BlocSetting {
  final DatabaseHelper _db = DatabaseHelper();
  BehaviorSubject<Setting> _subject = BehaviorSubject<Setting>();
  BehaviorSubject<SourceBatch> _sourceBatch = BehaviorSubject<SourceBatch>();
  ValueStream get getSettings => _subject.stream;

  BehaviorSubject<Setting> get subject => _subject;
  BehaviorSubject<SourceBatch> get sourceBatch => _sourceBatch;

  void getSetting() async {
    _subject.sink.add(await _db.getSetting());
  }

  void changeSetting(Setting setting){
    _subject.sink.add(setting);
  }

  void getSourceBatch(String tenantId) async {
    _sourceBatch.sink.add(
      await DatabaseHelper().getSourceBatch(tenantId)
    );
  }

  void addSourceBatch({
    @required SourceBatch sourceBatch, 
    @required bool exist})
  {
    _sourceBatch.sink.add(sourceBatch);
    if(exist){
      DatabaseHelper().updateSourceBatch(sourceBatch);
    } else {
      DatabaseHelper().saveSourceBatch(sourceBatch);
    }
  }

  void dispose(){
    _subject.close();
    _sourceBatch.close();
  }
}
final blocSetting = BlocSetting();