
import 'package:freelo_ecommerce/core/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.uid,
    required super.email,
    required super.name,
    required super.phone,
    required super.imageUrl,
    required super.auth_method,
    super.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        email: json['email'],
        name: json['name'],
        phone: json['phone'],
        imageUrl: json['imageUrl'],
        auth_method: json['auth_method'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'name': name,
        'phone': phone,
        'imageUrl': imageUrl,
        'auth_method': auth_method,
        'password': password,
      };
}
