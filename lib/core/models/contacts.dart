class Contacts {
  String? name;
  String? link;

  Contacts({this.name, this.link});

  Contacts.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    link = json['Link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Link'] = this.link;
    return data;
  }
}
