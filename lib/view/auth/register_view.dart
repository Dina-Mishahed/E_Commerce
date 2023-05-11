import 'package:e_commerce/constance.dart';
import 'package:e_commerce/core/view%20model/auth_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_button_social.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_text_form_field.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))
        ),
        child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              right: 10,
              left: 10,
            ),
            child: Scaffold(
              appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  leading: GestureDetector(
                    onTap: () {
                      Get.off(()=>LoginScreen());
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 40,
                    ),
                  )),
              body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        right: 5,
                        left: 30,
                      ),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 60,
                              ),
                              const CustomText(
                                text: "Sign Up",
                                fontsize: 30,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextFormField(
                                text: "Name",
                                hint: "Enter Your Name",
                                onSave: (value) {
                                  controller.name = value.toString();
                                },
                                onValidator: (value) {
                                  return "";
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextFormField(
                                text: "Email",
                                hint: "iamdavid@gmail.com",
                                onSave: (value) {
                                  controller.email = value.toString();
                                },
                                onValidator: (value) {
                                  return "";
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextFormField(
                                text: "Password",
                                hint: "**********",
                                onSave: (value) {
                                  controller.password = value.toString();
                                },
                                onValidator: (value) {
                                  return "";
                                },
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              CustomButton(
                                text: "SIGN UP",
                                onPress: () {
                                  try {
                                    _formKey.currentState?.validate();
                                    _formKey.currentState?.save();
                                    controller.createAccountWithEmailAndPass();
                                  } catch (e) {
                                    print("Field cant be Empty " + e.toString());
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                            ],
                          )))),
            )));
  }
}
