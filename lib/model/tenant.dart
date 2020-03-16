class Tenant {
  String tenantId;
  String tenantCardColor;

  Tenant({
    this.tenantId,
    this.tenantCardColor
  });

  Tenant.fromJson(Map<String, dynamic> json){
    tenantId = json['tenantId'];
    tenantCardColor = json['tenantCardColor'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['tenantId'] = this.tenantId;
    data['tenantCardColor'] = this.tenantCardColor;
    return data;
  }
}