import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;
  final String name;
  final String phone;
  final String imageUrl;
  final String auth_method;
  final String? password;

  const User({
    required this.uid,
    required this.email,
    required this.name,
    required this.phone,
    required this.imageUrl,
    required this.auth_method,
    this.password,
  });

  @override
  List<Object?> get props =>
      [uid, email, name, phone, imageUrl, auth_method, password];
}
