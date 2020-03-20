import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:qms_device/protos/orders.pb.dart';
import 'package:qms_device/repository/ordersRepository.dart';
import 'package:qms_device/utils.dart';

class BlocOrders {
  List<Order> _queues = [];
  List<Order> _readys = [];
  List<Order> _callings = [];
  final _ordersRepository = OrdersRepository();

  BlocOrders(){
    _ordersQueue = BehaviorSubject<List<List<Order>>>.seeded([]);
    _ordersReady = BehaviorSubject<List<List<Order>>>.seeded([]);
    _ordersCalling = BehaviorSubject<List<List<Order>>>.seeded([]);
    _headerCalling = BehaviorSubject<List<Order>>.seeded([]);
  }

  BehaviorSubject<List<List<Order>>> _ordersQueue = BehaviorSubject<List<List<Order>>>();
  BehaviorSubject<List<List<Order>>> _ordersReady = BehaviorSubject<List<List<Order>>>();
  BehaviorSubject<List<List<Order>>> _ordersCalling = BehaviorSubject<List<List<Order>>>();
  BehaviorSubject<List<Order>> _headerCalling = BehaviorSubject<List<Order>>();

  BehaviorSubject<List<List<Order>>> get ordersQueue => _ordersQueue;
  BehaviorSubject<List<List<Order>>> get ordersReady => _ordersReady;
  BehaviorSubject<List<List<Order>>> get ordersCalling => _ordersCalling;
  BehaviorSubject<List<Order>> get headerCalling => _headerCalling;

  void getOrders() async {
    //_subject.sink.add(await _ordersRepository.getOrders());
  }

  void addOrders(Order order) async {
    _queues.removeWhere((item){
      if(item.uuid == order.uuid){
        print('remove ${item.sourceBatch}, ${item.status}, ${item.uuid} == ${order.sourceBatch}, ${item.status}, ${order.uuid}');
      }
      return item.uuid == order.uuid;
    });
    _readys.removeWhere((item){
      if(item.uuid == order.uuid){
        print('remove ${item.sourceBatch}, ${item.status}, ${item.uuid} == ${order.sourceBatch}, ${item.status}, ${order.uuid}');
      }
      return item.uuid == order.uuid;
    });
    _callings.removeWhere((item){
      if(item.uuid == order.uuid){
        print('remove ${item.sourceBatch}, ${item.status}, ${item.uuid} == ${order.sourceBatch}, ${item.status}, ${order.uuid}');
      }
      return item.uuid == order.uuid;
    });
    _ordersQueue.sink.add(GroupBy.groupByTenant(_queues));
    _ordersReady.sink.add(GroupBy.groupByTenant(_readys));
    _ordersCalling.sink.add(GroupBy.groupByTenant(_callings));
    if(order.status != 'completed' && order.status != "calling" && order.status != 'complete'){
      _queues.add(order);
      _queues.sort((a, b){
        var aDate = a.timestamp;
        var bDate = b.timestamp;
        return aDate.compareTo(bDate);
      });
      _ordersQueue.sink.add(GroupBy.groupByTenant(_queues));
    } else if(order.status == 'ready'){
      _readys.add(order);
      _readys.sort((a, b){
        var aDate = a.timestamp;
        var bDate = b.timestamp;
        return aDate.compareTo(bDate);
      });
      _ordersReady.sink.add(GroupBy.groupByTenant(_readys));
    } else if(order.status == 'calling'){
      _callings.add(order);
      _callings.sort((a, b){
        var aDate = a.timestamp;
        var bDate = b.timestamp;
        return bDate.compareTo(aDate);
      });
      _ordersCalling.sink.add(GroupBy.groupByTenant(_callings));
    }
  }

  void addHeaderCalling(List<Order> orders) {
    _headerCalling.sink.add(orders);
  }

  void clearBloc() {
    _queues.clear();
    _readys.clear();
    _callings.clear();
    _ordersQueue.sink.add(null);
    _ordersCalling.sink.add(null);
    _headerCalling.sink.add([]);
  }

  void saveOrder({Order order}) async {
    await _ordersRepository.saveOrder(order);
    getOrders();
  }

  void saveOrderWithoutStream({Order order}) async {
    await _ordersRepository.saveOrder(order);
  }

  void dispose(){
    //_subject.close();
    _ordersQueue.close();
    _ordersReady.close();
    _ordersCalling.close();
    _headerCalling.close();
  }
}
final blocOrders = BlocOrders();