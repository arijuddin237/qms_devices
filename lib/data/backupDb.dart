/*import 'dart:io' as io;
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:streamqflite/streamqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qms_device/protos/orders.pb.dart';
//import 'package:qms_device/model/order.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if(_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  var streamDb = StreamDatabase(_db);

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "qmsDb.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE tableOrder(ordersId INTEGER, tenantId TEXT, sourceId TEXT, sourceTrackingId TEXT,"
      "sourceBatch TEXT, pluId TEXT, pluText TEXT, qty INTEGER, status TEXT, uuid TEXT, version INTEGER,"
      "orderType TEXT, parentUuid TEXT, tagsString TEXT, submString TEXT, timeStamp TEXT)"
    );
    print("Table Created");
  }

  //-Save order to database--------------------------------------------------------------
  Future<int> saveOrder(Order order) async {
    var dbClient = await db;
    int res = await dbClient.rawInsert(
      "INSERT INTO tableOrder(ordersId,tenantId,sourceId,sourceTrackingId,sourceBatch,"
      "pluId,pluText,uuid,version,orderType,parentUuid,tagsString,submString,timeStamp)"
      "VALUES ('${order.ordersId}','${order.tenantId}','${order.sourceId}',"
      "'${order.sourceTrackingId}','${order.sourceBatch}','${order.pluId}','${order.pluText}',"
      "'${order.qty}','${order.status}','${order.uuid}','${order.version}','${order.orderType}',"
      "'${order.parentUuid}','${order.tagsString}','${order.submString}','${order.timeStamp}')"
    );
    return res;
  }

  //-Get Order from database-------------------------------------------------------------
  Future<List<OrderMod>> getOrder(
    {OrderMod order, TagMod tag, SubmoduleMod submodule}) async {
    var dbClient = await db;
    List<Map> list;
    if(order != null){
      if(order.uuid != null && order.uuid != ""){
        list = await dbClient.rawQuery("select * from tableOrder where uuid = '${order.uuid}'");
      } else if(order.sourceId != null){
        list = await dbClient.rawQuery("select * from tableOrder where sourceId = '${order.sourceId}'");
      } else if(order.tenantId != null){
        list = await dbClient.rawQuery("select * from tableOrder where tenantId = '${order.tenantId}'");
      } else if(order.sourceTrackingId != null){
        list = await dbClient.rawQuery("select * from tableOrder where sourceTrackingId = '${order.sourceTrackingId}'");
      } else if(order.sourceBatch != null){
        list = await dbClient.rawQuery("select * from tableOrder where sourceBatch = '${order.sourceBatch}'");
      } else if(order.pluId != null){
        list = await dbClient.rawQuery("select * from tableOrder where pluId = '${order.pluId}'");
      } else if(order.pluText != null){
        list = await dbClient.rawQuery("select * form tableOrder where pluText = '${order.pluText}'");
      }
    } else if(submodule != null && (submodule.modulename != "" || submodule.status != "")){
      if((submodule.modulename != null && submodule.modulename != "") &&
        (submodule.status == null || submodule.status == "")){
          list = await dbClient.rawQuery("select * from tableOrder where submString like '%moduleName: ${submodule.modulename}%'");
      } else if((submodule.status != null && submodule.status != "") && 
        (submodule.modulename == null || submodule.modulename == "")){
          list = await dbClient.rawQuery("select * form tableOrder where submString like '%status: ${submodule.status}%'");
      } else {
        list = await dbClient.rawQuery(
          "select * from tableOrder where submString like '%moduleName: ${submodule.modulename}, status: ${submodule.status}%'"
        );
      }
    } else if(tag != null && (tag.name != "" || tag.value != "")){
      if((tag.name != null || tag.name != "") && (tag.value == null || tag.value =="")){
        list = await dbClient.rawQuery("select * from tableOrder where tagsString like '%name: ${tag.name}%'");
      } else if((tag.value != null || tag.value != "") && (tag.name == null || tag.name == "")){
        list = await dbClient.rawQuery("select * from tableOrder where tagsString like '%value: ${tag.value}%'");
      } else {
        list = await dbClient.rawQuery(
          "select * from tableOrder where tagsString like '%name: ${tag.name}, value: ${tag.value}%'"
        );
      }
    } else {
      list = await dbClient.rawQuery("select * from tableOrder");
    }

    List<OrderMod> orderList = List();
    for (var i = 0; i < list.length; i++) {
      orderList.add(OrderMod(
        ordersId: list[i]['ordersId'],
        tenantId: list[i]['tenantId'],
        sourceId: list[i]['sourceId'],
        sourceTrackingId: list[i]['sourceTrackingId'],
        sourceBatch: list[i]['sourceBatch'],
        pluId: list[i]['pluId'],
        pluText: list[i]['pluText'],
        qty: list[i]['qty'],
        status: list[i]['status'],
        uuid: list[i]['uuid'],
        version: list[i]['version'],
        orderType: list[i]['orderType'],
        parentUuid: list[i]['parentUuid'],
        tagsString: list[i]['tagsString'],
        submString: list[i]['submString'],
        timeStamp: list[i]['timeStamp']
      ));
    }
    return orderList;
  }

  //-Clear data from database------------------------------------------------------------
  Future<int> clearData() async {
    var dbClient = await db;
    int res = await dbClient.rawDelete('delete from tableOrder');
    return res;
  }
}*/