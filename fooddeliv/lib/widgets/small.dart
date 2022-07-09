import 'dart:ui';

import 'package:flutter/cupertino.dart';

 // Reusable text widget 
class smallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double  height;

 smallText({Key? key,required this.text,this.color = const Color(0xFFccc7c5),
  this.size = 12,
  this.height= 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontFamily: 'poppins',
        color: color,
        fontSize: size,
        height: height
      ),
    );
  }
}