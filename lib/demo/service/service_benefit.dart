class ServiceBenefit {
  ServiceBenefit({this.icon, this.title, this.description});

  String icon;
  String title;
  String description;


  ServiceBenefit.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}