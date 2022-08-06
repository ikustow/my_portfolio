
class Experience {
  String? position;
  String? company;
  String? start;
  String? end;
  String? location;
  int? id;

  Experience(
      {this.position,
        this.company,
        this.start,
        this.end,
        this.location,
        this.id});

  Experience.fromJson(Map<String, dynamic> json) {
    position = json['Position'];
    company = json['Company'];
    start = json['start'];
    end = json['End'];
    location = json['Location'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Position'] = this.position;
    data['Company'] = this.company;
    data['start'] = this.start;
    data['End'] = this.end;
    data['Location'] = this.location;
    data['id'] = this.id;
    return data;
  }
}