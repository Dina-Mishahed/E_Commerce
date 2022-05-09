import 'package:flutter/material.dart';
import 'package:e_commerce/constance.dart';
import 'custom_text.dart';
class CustomButton extends StatelessWidget{
  final String text;
  final void Function() onPress;

  const CustomButton({this.text = "", required this.onPress});

  @override
  Widget build(BuildContext context) {
    return  TextButton(

      // padding: EdgeInsets.all(10),
      style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
      child: CustomText(text: text, color: Colors.white,
        alignment: Alignment.center,),
      onPressed: onPress,
    );
  }

}