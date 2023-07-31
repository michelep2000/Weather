import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  String name;
  String birthday;
  String phone;
  String city;
  String email;

  Profile({
    required this.name,
    required this.birthday,
    required this.phone,
    required this.city,
    required this.email,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json["name"],
        birthday: json["birthday"],
        phone: json["phone"],
        city: json["city"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "birthday": birthday,
        "phone": phone,
        "city": city,
        "email": email,
      };
  
  @override
  String toString() {
    return '$name|$email|$phone|$city|$birthday';
  }

}
