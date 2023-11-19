class ListModel {
  String? title;
  String? subtitle;
  bool? status;

  ListModel({this.title, this.subtitle, this.status});

  factory ListModel.fromJson(Map json) {
    return ListModel(title: json['title'],
     subtitle: json['subtitle'],
     status : json['status']
     );
  }
}
