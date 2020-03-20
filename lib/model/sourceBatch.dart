class SourceBatch{
  int sourceBatch;
  String tenantId;

  SourceBatch({this.sourceBatch, this.tenantId});

  SourceBatch.fromJson(Map<String, dynamic> json){
    sourceBatch = json['sourcebatch'];
    tenantId = json['tenantId'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sourceBatch'] = this.sourceBatch;
    data['tenantId'] = this.tenantId;
    return data;
  }

}