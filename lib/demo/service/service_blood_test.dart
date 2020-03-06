class ServiceBloodTest {

  ServiceBloodTest({this.title, this.description});

  ServiceBloodTest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  String title;
  String description;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
