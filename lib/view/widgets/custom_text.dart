import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;
  final Alignment alignment;

  // ignore: use_key_in_widget_constructors
  const CustomText(
      {required this.text,
      this.fontsize = 14,
      this.color = Colors.black,
      this.alignment = Alignment.topLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontsize,
        ),
      ),
    );
  }
}
