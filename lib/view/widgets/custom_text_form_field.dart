import 'package:flutter/cupertino.dart';
import 'custom_text.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget{
  final String text;
  final String hint;
  final void Function(String?)? onSave;
  final String Function(String?)? onValidator;

  CustomTextFormField({this.text ="", this.hint="", this.onSave, this.onValidator});

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      children: [
        CustomText(
          text: text,
          fontsize: 14,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          onSaved: onSave,
          validator: onValidator,
          decoration:  InputDecoration(
            hintStyle: const TextStyle(color: Colors.grey),
            hintText: hint,
            fillColor: Colors.white,
          ),
        )
      ],
    ),
    );
  }
}