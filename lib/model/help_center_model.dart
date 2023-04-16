import 'package:smit_project/gridWidget/help_center/help_center.dart';

class HelpCenterModel {
  static const tblHelpCenter = "HelpCenter_tb";
  static const colID = 'id';
  static const colName = 'name';
  static const colPhone = 'phone';
  static const colDesignation = 'designation';
  static const colCity = 'city';
  static const colZone = 'zone';

  int? id;
  String? name;
  String? phone;
  String? designation;
  String? city;
  String? zone;

  HelpCenterModel(
      {this.id,
        this.name,
        this.phone,
        this.designation,
        this.city,
        this.zone});

  HelpCenterModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    phone = map['phone'];
    designation = map['designation'];
    city = map['city'];
    zone = map['zone'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colName: name,
      colPhone: phone,
      colDesignation: designation,
      colCity: city,
      colZone: zone
    };
    if (id != null) {
      map[colID] = id;
    }
    return map;
  }
}
