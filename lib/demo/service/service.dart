import 'service_blood_test.dart';
import 'service_benefit.dart';

class Service {
  String icon;
  String image;
  String title;
  String description;
  String gender;
  String age;
  int price;
  List<ServiceBloodTest> bloodTest;
  List<ServiceBenefit> benefits;
  List<String> feature;
  List<String> notices;
  List<String> process;

  Service(
      {this.image,
        this.title,
        this.description,
        this.gender,
        this.age,
        this.price});

  Service.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    icon = json['icon'];
    title = json['title'];
    description = json['description'] ?? '';
    gender = json['gender'] ?? '';
    age = json['age'] ?? '';
    price = json['price'] ?? 0;


    if (json['process'] != null) {
      process = json['process'].cast<String>();
    } else {
      process = [];
    }
    if (json['notices'] != null) {
      notices = json['notices'].cast<String>();
    } else {
      notices = [];
    }
    if (json['feature'] != null) {
      feature = json['feature'].cast<String>();
    } else {
      feature = [];
    }
    if (json['bloodTest'] != null) {
      bloodTest = [];
      json['bloodTest'].forEach((v) {
        bloodTest.add(ServiceBloodTest.fromJson(v));
      });
    } else {
      bloodTest = [];
    }
    if (json['benefits'] != null) {
      benefits = [];
      json['benefits'].forEach((v) {
        benefits.add(ServiceBenefit.fromJson(v));
      });
    } else {
      benefits = [];
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = this.image;
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['description'] = this.description;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['price'] = this.price;

    data['process'] = this.process;
    data['notices'] = this.notices;
    data['feature'] = this.feature;
    if (this.bloodTest != null) {
      data['bloodTest'] =
          this.bloodTest.map((v) => v.toJson()).toList();
    }
    if (this.benefits != null) {
      data['benefits'] =
          this.benefits.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
