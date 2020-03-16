class SkinPack {
  String imageName;

  SkinPack({
    this.imageName
  });

  SkinPack.fromJson(Map<String, dynamic> json){
    imageName = json['imageName'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['imagename'] = this.imageName;
    return data;
  }
}