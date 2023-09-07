import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:freelo_ecommerce/auth/presentation/pages/register_page.dart';
import 'package:freelo_ecommerce/core/domain/constants/icon_url.dart';
import 'package:freelo_ecommerce/home/presentation/pages/home_page.dart';
import 'package:hive/hive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String sharedUid = '';

  @override
  void initState() {
    sharedUid = Hive.box('user').get('user') ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        IconUrl.splashIcon,
      ),
      animationDuration: const Duration(milliseconds: 500),
      nextScreen: sharedUid == '' ? RegisterPage() : const HomePage(),
      duration: 3000,
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
