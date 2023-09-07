import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const DefaultFormField({
    Key? key,
    required this.title,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: width * 0.04,
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        cursorColor: const Color(0xFF9B9B9B),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: title,
          labelStyle: const TextStyle(
            fontFamily: 'Metropolis',
            color: Color(0xFF9B9B9B),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
