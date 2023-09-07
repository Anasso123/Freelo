import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const DefaultButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              height: height * 0.06,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: const Color(0xFFDB3022),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFDB3022).withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: const Offset(
                        0, 2), // changes the position of the shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Metropolis',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
