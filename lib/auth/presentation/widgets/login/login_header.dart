import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.055,
        right: width * 0.055,
        top: height * 0.02,
        bottom: height * 0.06,
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
