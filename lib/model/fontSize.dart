class FontSize{
  double fontSize1, fontSize2, fontSize3, fontSize4, fontSize5, fontSize6,
    fontSize7, fontSize8, fontSize9, fontSize10;

  FontSize({
    this.fontSize1, this.fontSize2, this.fontSize3, this.fontSize4,
    this.fontSize5, this.fontSize6, this.fontSize7, this.fontSize8,
    this.fontSize9, this.fontSize10
  });

  FontSize.fromJson(Map<String, dynamic> json){
    fontSize1 = json['fontSize1'];
    fontSize2 = json['fontSize2'];
    fontSize3 = json['fontSize3'];
    fontSize4 = json['fontSize4'];
    fontSize5 = json['fontSize5'];
    fontSize6 = json['fontSize6'];
    fontSize7 = json['fontSize7'];
    fontSize8 = json['fontSize8'];
    fontSize9 = json['fontSize9'];
    fontSize10 = json['fontSize10'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fontSize1'] = this.fontSize1;
    data['fontSize2'] = this.fontSize2;
    data['fontSize3'] = this.fontSize3;
    data['fontSize4'] = this.fontSize4;
    data['fontSize5'] = this.fontSize5;
    data['fontSize6'] = this.fontSize6;
    data['fontSize7'] = this.fontSize7;
    data['fontSize8'] = this.fontSize8;
    data['fontSize9'] = this.fontSize9;
    data['fontSize10'] = this.fontSize10;
    return data;
  }
}