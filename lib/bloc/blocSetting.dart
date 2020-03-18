import 'package:qms_device/data/databaseHelper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:qms_device/model/setting.dart';

class BlocSetting {
  final DatabaseHelper _db = DatabaseHelper();
  BehaviorSubject<Setting> _subject = BehaviorSubject<Setting>();
  ValueStream get getSettings => _subject.stream;

  BehaviorSubject<Setting> get subject => _subject;

  void getSetting() async {
    _subject.sink.add(await _db.getSetting());
  }

  void changeSetting(Setting setting){
    _subject.sink.add(setting);
  }

  void dispose(){
    _subject.close();
  }
}
final blocSetting = BlocSetting();