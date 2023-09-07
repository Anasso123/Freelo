

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelo_ecommerce/core/domain/dependency_injection/dependency_injection.dart';
import 'package:freelo_ecommerce/core/presentation/theme/themes.dart';
import 'package:hive_flutter/adapters.dart';
import 'splash/presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox('user');
  HttpOverrides.global = MyHttpOverrides();
  DependencyInjection().init();
  await Firebase.initializeApp();
  runApp(const Freelo());
}

class Freelo extends StatelessWidget {
  const Freelo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Freelo ecommerce',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const SplashScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
