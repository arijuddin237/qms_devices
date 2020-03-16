class Setting{
  int id;
  String qmsType;

  Setting({this.id, this.qmsType});

  Setting.fromJson(Map<String, dynamic> json){
    id = json['id'];
    qmsType = json['qmsType'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['qmsType'] = this.qmsType;
    return data;
  }
}