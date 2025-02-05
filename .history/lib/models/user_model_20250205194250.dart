import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? maidenName;
  final int? age;
  final String? gender;
  final String? email;
  final String? phone;
  final String? username;
  final String? birthDate;
  final String? image;
  final String? bloodGroup;
  final double? height;
  final double? weight;
  final String? eyeColor;
  final Hair? hair;
  final Address? address;
  final String? university;
  final Company? company;
  final String? role;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.address,
    this.university,
    this.company,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        maidenName: json["maidenName"],
        age: json["age"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        username: json["username"],
        birthDate: json["birthDate"],
        image: json["image"],
        bloodGroup: json["bloodGroup"],
        height: json["height"]?.toDouble(),
        weight: json["weight"]?.toDouble(),
        eyeColor: json["eyeColor"],
        hair: json["hair"] == null ? null : Hair.fromJson(json["hair"]),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        university: json["university"],
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
        role: json["role"],
      );
}

class Hair {
  final String? color;
  final String? type;

  Hair({
    this.color,
    this.type,
  });

  factory Hair.fromJson(Map<String, dynamic> json) => Hair(
        color: json["color"],
        type: json["type"],
      );
}

class Address {
  final String? address;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;

  Address({
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postalCode"],
        country: json["country"],
      );
}

class Company {
  final String? department;
  final String? name;
  final String? title;

  Company({
    this.department,
    this.name,
    this.title,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        department: json["department"],
        name: json["name"],
        title: json["title"],
      );
}
