import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMedias extends StatelessWidget {
  final void Function()? googleOnTap;
  final void Function()? facebookOnTap;
  final String title;

  const SocialMedias(
      {Key? key,
      required this.facebookOnTap,
      required this.googleOnTap,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: height * 0.2),
          child: SizedBox(
            height: height * 0.15,
            width: width * 0.6,
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Metropolis',
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: googleOnTap,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        height: height * 0.06,
                        width: height * 0.1,
                        child: const Icon(FontAwesomeIcons.google),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    InkWell(
                      onTap: facebookOnTap,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        height: height * 0.06,
                        width: height * 0.1,
                        child: const Icon(FontAwesomeIcons.facebookF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
