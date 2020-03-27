class Setting{
  int id, ordersPort, devicesPort;
  String qmsType, host, tenantId, runningText;

  Setting({
    this.id, 
    this.qmsType, 
    this.host, 
    this.ordersPort, 
    this.devicesPort,
    this.tenantId,
    this.runningText
  });

  Setting.fromJson(Map<String, dynamic> json){
    id = json['id'];
    qmsType = json['qmsType'];
    host = json['host'];
    ordersPort = json['ordersPort'];
    devicesPort = json['devicesPort'];
    tenantId = json['tenantId'];
    runningText = json['runningText'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['qmsType'] = this.qmsType;
    data['host'] = this.host;
    data['ordersPort'] = this.ordersPort;
    data['devicesPort'] = this.devicesPort;
    data['tenantId'] = this.tenantId;
    data['runningText'] = this.runningText;
    return data;
  }
}