import 'package:rxdart/rxdart.dart';

class BlocDropDownSetting {
  String value;
  BehaviorSubject<String> _subject = BehaviorSubject<String>();

  BehaviorSubject<String> get subject => _subject;

  void changeValue(String newValue){
    value = newValue;
    _subject.sink.add(value);
  }

  void dispose(){
    _subject.close();
  }
}
final blocDropdownSetting = BlocDropDownSetting();