import 'package:flutter/material.dart';

class ListTileMenu extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final Color arrowIconColor;
  final Color indicatorColor;
  final void Function()? onTap;

  const ListTileMenu({
    super.key,
    required this.width,
    required this.height,
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.textColor,
    required this.onTap,
    required this.arrowIconColor,
    required this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: height * 0.06,
                width: width * 0.01,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Icon(
                icon,
                color: iconColor,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: arrowIconColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
