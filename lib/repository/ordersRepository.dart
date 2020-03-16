import 'package:qms_device/data/databaseHelper.dart';
import 'package:qms_device/protos/orders.pb.dart';

class OrdersRepository{
  final _db = DatabaseHelper();

  Future saveOrder(Order order){
    return _db.saveOrder(order);
  }

  Future getOrders(){
    return _db.getOrder();
  }

}