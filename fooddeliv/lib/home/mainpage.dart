import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fooddeliv/home/foodPageBody.dart';
import 'package:fooddeliv/utils/dimensions.dart';
import 'package:fooddeliv/widgets/bigtext.dart';
import 'package:fooddeliv/widgets/small.dart';

class mainFoodPage extends StatefulWidget {
  const mainFoodPage({Key? key}) : super(key: key);

  @override
  State<mainFoodPage> createState() => _mainFoodPageState();
}

class _mainFoodPageState extends State<mainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin:  EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height45),
          padding:  EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              bigText(text: "Morocco",),
              Row(
                children: [
                  smallText(text: "City",color: Colors.black54,),
                  const Icon(Icons.arrow_drop_down_rounded),
                ],
              )
            ],
          ),
          Center(
            child: Container(
              width: Dimensions.width45,
              height: Dimensions.width45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.amber,
              ),
              child:  Icon(
                Icons.search,
                color: Colors.white,
                size: Dimensions.iconSize24,
              ),
            ),
          ),
        ],
          ),
        ),
        const foodPageBody(),
      ],
    )
    
    );
  }
}
