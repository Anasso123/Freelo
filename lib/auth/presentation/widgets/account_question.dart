import 'package:flutter/material.dart';

class AccountQuestion extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const AccountQuestion({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.001,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Metropolis',
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_right_alt, color: Color(0xFFDB3022)),
          ),
        ],
      ),
    );
  }
}
