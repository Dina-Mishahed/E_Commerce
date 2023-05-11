import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/view model/auth_view_model.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthViewModel viewmodel = Get.put(AuthViewModel());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       // children: [
          //GetX<AuthViewModel>(
            //init: AuthViewModel(),
            //builder: (value) => Text("${value.counter}"),
          //),
         // Obx(
           //   () => Text("${viewmodel.counter}"),
          //),
          //ElevatedButton(
            //onPressed: () {
              //viewmodel.increament();
           // },
            //child: const Text("Increment"),
         // )
       // ],
      ),
    );
  }
}
