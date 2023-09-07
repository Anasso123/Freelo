import 'package:flutter/material.dart';

class UserParams {
  final String uid;
  final String email;
  final String name;
  final String phone;
  final String imageUrl;
  final String auth_method;
  final String? password;

  UserParams({
    required this.uid,
    required this.email,
    required this.name,
    required this.phone,
    required this.imageUrl,
    required this.auth_method,
    this.password,
  });
}
