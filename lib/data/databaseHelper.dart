import 'dart:io' as io;
import 'dart:async';

import 'package:path/path.dart';
import 'package:qms_device/library/libApps.dart';
import 'package:qms_device/model/sourceBatch.dart';
import 'package:sqflite/sqflite.dart';
import 'package:streamqflite/streamqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qms_device/model/skinPack.dart';
import 'package:qms_device/model/setting.dart';
import 'package:qms_device/protos/orders.pb.dart';

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

    await db.execute(
      "CREATE TABLE tableTags(name TEXT, value TEXT, version INTEGER, uuid TEXT)"
    );

    await db.execute(
      "CREATE TABLE tableSubmodule(moduleName TEXT, status TEXT, version INTEGER, uuid TEXT)"
    );

    await db.execute(
      "CREATE TABLE setting(id INTEGER, qmsType TEXT, host TEXT," 
      "ordersPort INTEGER, devicesPort INTEGER, tenantID TEXT)"
    );

    await db.execute(
      "CREATE TABLE skinPack(imageName TEXT)"
    );

    await db.execute(
      "CREATE TABLE skinPackSingleTenant(imageName TEXT)"
    );

    await db.execute(
      "CREATE TABLE sourceBatch(sourceBatch INTEGER, tenantId TEXT)"
    );

    await db.execute(
      "INSERT INTO setting VALUES('1','${qmsType[1]}','10.200.200.50','50051','50053','')"
    );
    
    print("Table Created");
  }

  //-Save order to database--------------------------------------------------------------
  Future<int> saveOrder(Order order) async {
    var dbClient = await db;
    for (var tags in order.tags.tag) {
      await dbClient.rawInsert(
        "INSERT INTO tableTags(name, value, version, uuid)"
        "VALUES ('${tags.name}', '${tags.value}', '${tags.version}', '${order.uuid}')"
      );
    }
    for (var submodule in order.submodules.submodule) {
      await dbClient.rawInsert(
        "INSERT INTO tableSubmodule(modulename, status, version, uuid)"
        "VALUES ('${submodule.modulename}', '${submodule.status}', '${submodule.version}',"
        "'${order.uuid}')"
      );
    }
    int res = await dbClient.rawInsert(
      "INSERT INTO tableOrder(ordersId,tenantId,sourceId,sourceTrackingId,sourceBatch,"
      "pluId,pluText,uuid,version,orderType,parentUuid,tagsString,submString,timeStamp)"
      "VALUES ('${order.ordersId}','${order.tenantId}','${order.sourceId}',"
      "'${order.sourceTrackingId}','${order.sourceBatch}','${order.pluId}','${order.pluText}',"
      "'${order.qty}','${order.status}','${order.uuid}','${order.version}','${order.orderType}',"
      "'${order.parentUuid}')"
    );
    return res;
  }

  Future<int> saveSkinPack(SkinPack skinPack) async {
    var dbClient = await db;
    int res = await dbClient.rawInsert(
      "INSERT INTO skinPack(imagename) VALUES ('${skinPack.imageName}')"
    );
    return res;
  }

  Future<int> saveSkinPakcSingleTenant(SkinPack skinpack) async {
    var dbClient = await db;
    int res = await dbClient.rawInsert(
      "INSERT INTO skinpackSingleTenant(imagename) VALUES ('${skinpack.imageName}')"
    );
    return res;
  }

  Future<int> saveSourceBatch(SourceBatch sourceBatch) async {
    var dbClient = await db;
    int res = await dbClient.rawInsert(
      "INSERT INTO sourceBatch VALUES ('${sourceBatch.sourceBatch}','${sourceBatch.tenantId}')"
    );
    return res;
  }

  Future<List<Tag>> getTags({Order orderUuid}) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
      "select * from tableTags where uuid = '${orderUuid.uuid}'"
    );
    List<Tag> tags = List();
    for (var tag in list) {
      tags.add(
        Tag()
          ..name = tag['name']
          ..value = tag['value']
          ..version = tag['version']
      );
    }
    return tags;
  }

  Future<List<Submodule>> getSubmodules({Order orderUuid}) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
      "select * from tableSubmodule where uuid = '${orderUuid.uuid}'"
    );
    List<Submodule> submodules = List();
    for (var submodule in list) {
      submodules.add(
        Submodule()
          ..modulename = submodule['moduleName']
          ..status = submodule['status']
          ..version = submodule['version']
      );
    }
    return submodules;
  }

  Future<List> _getOrderWith({Tag tag, Submodule submodule}) async {
    var dbClient = await db;
    List<Map> list;
    if(tag != null){
      list = await dbClient.rawQuery(
        "select * from tableOrder, tableTags"
        "where tableOrder.uuid = tableTags.uuid"
        "and tableTags.name = '${tag.name}', and tableTags.value = '${tag.value}'"
      );
    } else if(submodule != null){
      list = await dbClient.rawQuery(
        "select * from tableOrder, tableSubmodule"
        "where tableOrder.uuid = tableSubmodule.uuid"
        "and tableSubmodule.moduleName = '${submodule.modulename}'"
        "and tableSubmodule.status = '${submodule.status}'"
      );
    }
    return list;
  }

  //-Get Order from database-------------------------------------------------------------
  Future<List<Order>> getOrder(
    {Order order, Tag tag, Submodule submodule}) async {
    var dbClient = await db;
    List<Map> list;
    String _query;

    if(order != null){
      if(order.uuid != null && order.uuid != ""){
        list = await dbClient.rawQuery(
          "select * from tableOrder where uuid = '${order.uuid}'"
        );
      } else if(order.ordersId != null){
        list = await dbClient.rawQuery(
          "select * from tableOrder where ordersId = '${order.ordersId}'"
        );
      } else if(order.tenantId != null && order.tenantId != ""){
        list = await dbClient.rawQuery(
          "select * from tableOrder where tenantId = '${order.tenantId}'"
        );
      } else if(order.sourceId != null && order.sourceId != ""){
        list = await dbClient.rawQuery(
          "select * from tableOrder where sourceId = '${order.sourceId}'"
        );
      } else if(order.sourceTrackingId != null && order.sourceTrackingId != ""){
        list = await dbClient.rawQuery(
          "select * from tableOrder where sourceId = '${order.sourceId}'"
        );
      } else if(order.sourceBatch != null && order.sourceBatch != ""){
        list = await dbClient.rawQuery(
          "select * from tableOrder where sourceBatch = '${order.sourceBatch}'"
        );
      } else if(order.pluId != null && order.pluId != ""){
        list = await dbClient.rawQuery(
          "select * from tableOrder where pluId = '${order.pluId}"
        );
      } else if(order.pluText != null && order.pluText != ""){
        list = await dbClient.rawQuery(
          "select * from tableOrder where pluText = '${order.pluText}'"
        );
      } else if(order.qty != null){
        list = await dbClient.rawQuery(
          "select * from tableOrder where qty = '${order.qty}'"
        );
      } else if(order.status != null && order.status != ""){
        list = await dbClient.rawQuery(
          "select * from tableOrder where status = '${order.status}'"
        );
      } else if(order.version != null){
        list = await dbClient.rawQuery(
          "select * from tableOrder where version = '${order.version}'"
        );
      } else if(order.orderType != null && order.orderType != ""){
        list = await dbClient.rawQuery(
          "select * from tableOrder where orderType = '${order.orderType}'"
        );
      } else if(order.parentUuid != null && order.parentUuid != ""){
        list = await dbClient.rawQuery(
          "select * from tableOrder where parentUuid = '${order.parentUuid}'"
        );
      } else if(order.tags != null && order.tags.tag.length > 0){
        List<Map> tagsResult;
        for (var tag in order.tags.tag) {
          await _getOrderWith(
            tag: Tag()
              ..name = tag.name
              ..value = tag.value
          ).then((value){
            for (var tag in value) {
              tagsResult.removeWhere((item) => item['uuid'] == tag['uuid']);
              tagsResult.add(tag);
            }
          });
        }
        list = tagsResult;
      } else if(order.submodules != null && order.submodules.submodule.length > 0){
        List<Map> submResult;
        for (var submodule in order.submodules.submodule ){
          await _getOrderWith(
            submodule: Submodule()
              ..modulename = submodule.modulename
              ..status = submodule.status
          ).then((value){
            for (var submodule in value) {
              submResult.removeWhere((item) => item['uuid'] == submodule['uuid']);
              submResult.add(submodule);
            }
          });
        }
        list = submResult;
      }
    } else {
      _query = "select * from tableOrder";
    }

    list = await dbClient.rawQuery(_query);

    List<Order> orderList = List();
    for (var i = 0; i < list.length; i++) {
      List<Tag> tags = await getTags(
        orderUuid: list[i]['uuid']
      );
      
      Tags tagsValue = Tags()
        ..tag.addAll(tags);

      List<Submodule> submodules = await getSubmodules(
        orderUuid: list[i]['uuid']
      );

      Submodules submValue = Submodules()
        ..submodule.addAll(submodules);

      orderList.add(
        Order()
          //..ordersId = list[i]['ordersId']
          ..tenantId = list[i]['tenantId']
          ..sourceId = list[i]['sourceId']
          ..sourceTrackingId = list[i]['sourceTrackingId']
          ..sourceBatch = list[i]['sourceBatch']
          ..pluId = list[i]['pluId']
          ..pluText = list[i]['pluText']
          ..qty = list[i]['qty']
          ..status = list[i]['status']
          ..uuid = list[i]['uuid']
          ..version = list[i]['version']
          ..orderType = list[i]['orderType']
          ..parentUuid = list[i]['parentUuid']
          ..timestamp = list[i]['timeStamp']
          ..tags = tagsValue
          ..submodules = submValue
          ..timestamp = list[i]['timeStamp']
      );
    }
    return orderList;
  }

  Future<Setting> getSetting() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('select * from setting');
    List<Setting> settings = List();
    for (var setting in list) {
      settings.add(
        Setting(
          qmsType: setting['qmsType'],
          host: setting['host'],
          ordersPort: setting['ordersPort'],
          devicesPort: setting['devicesPort'],
          tenantId: setting['tenantID']
        )
      );
    }
    return settings[0];
  }

  Future<List<SkinPack>> getSkinPack() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery("select * from skinpack");
    List<SkinPack> skinPacks = List();
    for (var skinPack in list) {
      skinPacks.add(
        SkinPack(
          imageName: skinPack['imageName']
        )
      );
    }
    return skinPacks;
  }

  Future<List<SkinPack>> getSkinPackSingleTenant() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery("select * from skinpacksingletenant");
    List<SkinPack> skinpacks = List();
    for (var skinpack in list) {
      skinpacks.add(
        SkinPack(
          imageName: skinpack['imageName']
        )
      );
    }
    return skinpacks;
  }

  Future<SourceBatch> getSourceBatch(String tenantId) async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
      "select * from sourceBatch where tenantId = '$tenantId'"
    );
    List<SourceBatch> sourceBatch = List();
    for (var res in list) {
      sourceBatch.add(
        SourceBatch(
          sourceBatch: res['sourceBatch'],
          tenantId: res['tenantId']
        )
      );
    }
    if(sourceBatch.length > 0){
      return sourceBatch.first;
    } else {
      return null;
    }
  }

  //-Update Setting----------------------------------------------------------------------
  Future<int> updateSetting(Setting setting) async {
    var dbClient = await db;
    int res = await dbClient.rawUpdate(
      "UPDATE setting SET qmsType = '${setting.qmsType}',"
      "host = '${setting.host}', ordersPort = '${setting.ordersPort}',"
      "devicesPort = '${setting.devicesPort}', tenantID = '${setting.tenantId}'"
      "WHERE id = ${setting.id}"
    );
    return res;
  }

  Future<int> updateSourceBatch(SourceBatch sourceBatch) async {
    var dbClient = await db;
    int res = await dbClient.rawUpdate(
      "UPDATE sourceBatch SET sourceBatch = '${sourceBatch.sourceBatch}'"
      "WHERE tenantId = '${sourceBatch.tenantId}'"
    );
    return res;
  }

  //-Clear data from database------------------------------------------------------------
  Future<int> clearData() async {
    var dbClient = await db;
    int res = await dbClient.rawDelete('delete from tableOrder');
    return res;
  }

  Future<int> clearSkinPack() async {
    var dbClient = await db;
    int res = await dbClient.rawDelete('delete from skinpack');
    return res;
  }

  Future<int> clearSkinPackSingleTenant() async {
    var dbClient = await db;
    int res = await dbClient.rawDelete('delete from skinpacksingletenant');
    return res;
  }
}