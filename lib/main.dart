import 'package:e_commerce/view/auth/secound_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:get/get.dart';
void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

