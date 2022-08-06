class Project {
  String? name;
  String? desc;
  String? link;
  String? iD;

  Project({this.name, this.desc, this.link, this.iD});

  Project.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    desc = json['Desc'];
    link = json['Link'];
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Desc'] = this.desc;
    data['Link'] = this.link;
    data['ID'] = this.iD;
    return data;
  }
}