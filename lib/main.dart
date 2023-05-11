import 'package:e_commerce/view/auth/secound_screen.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:get/get.dart';
import 'package:e_commerce/helper/binding.dart' as bin;
import 'helper/binding.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: bin.Binding(),
      home: Scaffold(
        body: ControlView(),
      ),
    );
  }
}
