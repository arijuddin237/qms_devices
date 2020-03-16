/*class OrderMod {
  int ordersId;
  String tenantId;
  String sourceId;
  String sourceTrackingId;
  String sourceBatch;
  String pluId;
  String pluText;
  int qty;
  String status;
  String uuid;
  int version;
  String orderType;
  String parentUuid;
  List<TagsMod> tags;
  List<SubmodulesMod> submodules;
  String tagsString;
  String submString;
  String timeStamp;

  OrderMod({
    this.ordersId,
    this.tenantId,
    this.sourceId,
    this.sourceTrackingId,
    this.sourceBatch,
    this.pluId,
    this.pluText,
    this.qty,
    this.status,
    this.uuid,
    this.version,
    this.orderType,
    this.parentUuid,
    this.tags,
    this.submodules,
    this.tagsString,
    this.submString,
    this.timeStamp
  });

  OrderMod.fromJson(Map<String, dynamic> json){
    ordersId = json['ordersId'];
    tenantId = json['tenantId'];
    sourceId = json['sourceId'];
    sourceTrackingId = json['sourceTrackingId'];
    sourceBatch = json['sourceBatch'];
    pluId = json['pluId'];
    pluText = json['pluText'];
    qty = json['qty'];
    status = json['status'];
    uuid = json['uuid'];
    version = json['version'];
    orderType = json['orderType'];
    parentUuid = json['parentUuid'];
    tagsString = json['tagsString'];
    submString = json['submString'];
    timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ordersId'] = this.ordersId;
    data['tenantId'] = this.tenantId;
    data['sourceId'] = this.sourceId;
    data['sourceTrackingId'] = this.sourceTrackingId;
    data['sourceBatch'] = this.sourceBatch;
    data['pluId'] = this.pluId;
    data['pluText'] = this.pluText;
    data['qty'] = this.qty;
    data['status'] = this.status;
    data['uuid'] = this.uuid;
    data['version'] = this.version;
    data['orderType'] = this.orderType;
    data['parentUuid'] = this.parentUuid;
    data['tagsString'] = this.tagsString;
    data['submString'] = this.submString;
    data['timeStamp'] = this.timeStamp;
    return data;
  }
}

//-Create Moduel Tags--------------------------------------------------------------------
class TagsMod {
  TagMod tag;

  TagsMod({this.tag});

  TagsMod.fromJson(Map<String, dynamic> json){
    tag = json['tag'] != null
      ? TagMod.fromJosn(json['tag'])
      : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['tag'] = this.tag;
    return data;
  }
}

class TagMod {
  String name;
  String value;
  int version;
  String uuid;

  TagMod({this.name, this.value, this.version, this.uuid});

  TagMod.fromJosn(Map<String, dynamic> json){
    name = json['name'];
    value = json['value'];
    version = json['version'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['version'] = this.version;
    data['uuid'] = this.uuid;
    return data;
  }
}


//-Create Model Submodules---------------------------------------------------------------
class SubmodulesMod {
  SubmoduleMod submodule;

  SubmodulesMod({this.submodule});

  SubmodulesMod.fromJson(Map<String, dynamic> json){
    submodule = json['submodule'] != null
      ? SubmoduleMod.fromJson(json['submodule'])
      : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['submodule'] = this.submodule;
    return data;
  }
}

class SubmoduleMod{
  String modulename;
  String status;
  int version;
  String uuid;

  SubmoduleMod({this.modulename, this.status, this.version, this.uuid});

  SubmoduleMod.fromJson(Map<String, dynamic> json){
    modulename = json['modulename'];
    status = json['status'];
    version = json['version'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['modulename'] = this.modulename;
    data['status'] = this.status;
    data['version'] = this.version;
    data['uuid'] = this.uuid;
    return data;
  }
}*/