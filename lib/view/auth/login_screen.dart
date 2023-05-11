import 'dart:ffi';
import 'dart:io';
import 'dart:ui';
import 'package:e_commerce/view/auth/register_view.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_button_social.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../core/view model/auth_view_model.dart';
import '../widgets/custom_text_form_field.dart';
import 'package:e_commerce/constance.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
                padding: EdgeInsets.all(
                  30,
                ),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              text: "Welcome",
                              fontsize: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => RegisterScreen());
                              },
                              child: CustomText(
                                text: "Sign Up",
                                fontsize: 18,
                                color: primaryColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomText(
                          text: "Sign in to Continue",
                          fontsize: 14,
                          color: Colors.grey,
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
                            if (value == null) {
                              print("ERORR");
                            }
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
                            if (value == null) {
                              print("ERROR");
                            }
                            return "";
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomText(
                          text: "Forget Password?",
                          fontsize: 14,
                          color: Colors.black54,
                          alignment: Alignment.topRight,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          text: "SIGN IN",
                          onPress: () {
                            try {
                              _formKey.currentState?.validate();
                              _formKey.currentState?.save();
                              controller.signInWithEmailAndPassword();
                            } catch (e) {
                              print("Field cant be Empty " + e.toString());
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomText(
                          text: "-OR-",
                          alignment: Alignment.center,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButtonSocial(
                          text: "Sign In with Google",
                          imageName: 'assets/images/GoogleIcon.png',
                          onPress: () {
                            controller.googleSignInMethod();
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButtonSocial(
                          text: "Sign In with Facebook",
                          imageName: 'assets/images/FacebookIcon.png',
                          onPress: () {},
                        )
                      ],
                    ))),
          ),
        ));
  }
}
