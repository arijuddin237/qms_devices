import 'package:qms_device/protos/orders.pb.dart';
import 'package:rxdart/rxdart.dart';

class BlocDropDownSetting {
  String value;
  BehaviorSubject<String> _subject = BehaviorSubject<String>();
  BehaviorSubject<List<Order>> _getTenants = BehaviorSubject<List<Order>>();

  BehaviorSubject<String> get subject => _subject;
  BehaviorSubject<List<Order>> get getTenants => _getTenants;

  void changeValue(String newValue){
    value = newValue;
    _subject.sink.add(value);
  }

  void changeValueDropdown(List<Order> tenant){
    _getTenants.sink.add(tenant);
  }

  void dispose(){
    _subject.close();
    _getTenants.close();
  }
}
final blocDropdownSetting = BlocDropDownSetting();