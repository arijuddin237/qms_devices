import 'package:rxdart/rxdart.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/repository/ordersRepository.dart';

class BlocOrderTenant {
  List<Order> _orders = [];
  BehaviorSubject<List<Order>> _subject = BehaviorSubject<List<Order>>();
}