class User {
  static const tblUser = "User_tb";
  static const colID = 'id';
  static const colName = 'name';
  static const colPhone = 'phone';
  static const colEmail = 'email';
  static const colPassword = 'password';
  static const colAddress = 'address';
  static const colGender = 'gender';

  int? id;
  String? name;
  String? gender;
  String? phone;
  String? email;
  String? password;
  String? address;

  User(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.password,
      this.gender,
      this.address});

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    phone = map['phone'];
    email = map['email'];
    password = map['password'];
    gender = map['gender'];
    address = map['address'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colName: name,
      colPhone: phone,
      colEmail: email,
      colPassword: password,
      colGender: gender,
      colAddress: address
    };
    if (id != null) {
      map[colID] = id;
    }
    return map;
  }
}
