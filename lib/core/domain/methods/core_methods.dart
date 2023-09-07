import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class CoreMethods {
  static void navigateTo(context, pageToNavigate) {
    Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeft, child: pageToNavigate),
    );
  }

  static void navigateAndReplace(context, pageToNavigate) {
    Navigator.pushReplacement(
      context,
      PageTransition(
          type: PageTransitionType.leftToRight, child: pageToNavigate),
    );
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
