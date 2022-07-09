import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fooddeliv/utils/dimensions.dart';
import 'package:fooddeliv/widgets/small.dart';

class iconAndTextWidget extends StatelessWidget {

  final IconData icon;
  final String text;
  Color? color ;
  final Color iconColor;

  iconAndTextWidget({Key? key,
  required this.icon,
  required this.text,
  this.color =const Color(0x0fffffff),
  required this.iconColor,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor, size: Dimensions.iconSize24,),
        const SizedBox(width: 5,),
        smallText(text: text, color: color),
      ],
    );
  }
}