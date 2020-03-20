class FontSize{
  double fontSize1, fontSize2, fontSize3, fontSize4, fontSize5;

  FontSize({
    this.fontSize1, this.fontSize2, this.fontSize3, this.fontSize4,
    this.fontSize5
  });

  FontSize.fromJson(Map<String, dynamic> json){
    fontSize1 = json['fontSize1'];
    fontSize2 = json['fontSize2'];
    fontSize3 = json['fontSize3'];
    fontSize4 = json['fontSize4'];
    fontSize5 = json['fontSize5'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fontSize1'] = this.fontSize1;
    data['fontSize2'] = this.fontSize2;
    data['fontSize3'] = this.fontSize3;
    data['fontSize4'] = this.fontSize4;
    data['fontSize5'] = this.fontSize5;
    return data;
  }
}