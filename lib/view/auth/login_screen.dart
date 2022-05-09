import 'dart:io';
import 'dart:ui';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_button_social.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_text_form_field.dart';
import 'package:e_commerce/constance.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: "Welcome",
                      fontsize: 30,
                    ),
                    CustomText(
                      text: "Sign Up",
                      fontsize: 18,
                      color: primaryColor,
                    ),
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
                  onSave: (value) {},
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: "Password",
                  hint: "**********",
                  onSave: (value) {},
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
                  onPress: () {},
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
                  onPress: () {},
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
            )));
  }
}
