import 'package:flutter/material.dart';
import 'package:flutter_application/authenticate/login.dart';
import 'package:flutter_application/authenticate/register.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/util/ui_data.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.lightBlue),
      routes: {
        UIData.route_login: (BuildContext context) => const LoginScreen(),
        UIData.route_register: (BuildContext context) => const RegisterScreen()
      },
      home: const LoginScreen(),
    );
  }
}
