import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

 // Reusable text widget 
class bigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

 bigText({Key? key,required this.text,this.color = const Color(0xFF332d2b),
  this.size = 0,
  this.overFlow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'poppins',
        color: color,
        fontSize: size==0? Dimensions.font20:size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}