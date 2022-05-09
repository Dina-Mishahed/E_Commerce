import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final void Function() onPress;

  const CustomButtonSocial(
      {required this.text, required this.imageName, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
        ),
        child: TextButton(
          onPressed: onPress,
          style: TextButton.styleFrom(
              //padding: const EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          child: Row(
            children: [
              Image.asset(
                imageName,
                height: 45,
                width: 45,
              ),
              const SizedBox(
                width: 90,
              ),
              CustomText(
                text: text,
                color: Colors.black54,
              ),
            ],
          ),
        ));
  }
}
