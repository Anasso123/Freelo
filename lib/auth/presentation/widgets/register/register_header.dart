import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.07),
      child: const Text(
        'Sign Up',
        style: TextStyle(
            fontSize: 30,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
