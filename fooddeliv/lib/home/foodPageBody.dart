import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fooddeliv/widgets/bigtext.dart';
import 'package:fooddeliv/widgets/icon_and_text_widget.dart';
import 'package:fooddeliv/widgets/small.dart';

import '../utils/dimensions.dart';

class foodPageBody extends StatefulWidget {
  const foodPageBody({Key? key}) : super(key: key);

  @override
  State<foodPageBody> createState() => _foodPageBodyState();
}

class _foodPageBodyState extends State<foodPageBody> {

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageVal = 0.0;
  double _Scalefactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      
      setState(() {
    
        _currPageVal =  pageController.page!;

      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
      height: Dimensions.PageView,
      child: PageView.builder(
        controller:  pageController,
        itemCount: 5,
        itemBuilder: (context,position){

        return _buildPageItem(position);
      }),

    ),

   DotsIndicator(
  dotsCount: 5,
  position: _currPageVal,
  decorator: DotsDecorator(
    activeColor: Colors.greenAccent,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
),
      ],
    );
     
  }

  Widget _buildPageItem(int index){

    Matrix4 matrix = Matrix4.identity();


    if(index == _currPageVal.floor()){
      var currScale = 1- (_currPageVal-index) *(1-_Scalefactor);
      var currTransition =  _height * (1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTransition, 0);

    }else if(index == _currPageVal.floor()+1){

      var currScale = _Scalefactor + (_currPageVal - index + 1 )*(1-_Scalefactor);
      var currTransition =  _height * (1-currScale)/2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTransition, 0);

    }else if(index == _currPageVal.floor()-1){

      var currScale = 1- (_currPageVal-index) *(1-_Scalefactor);
      var currTransition =  _height * (1-currScale)/2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTransition, 0);

    }else{

        var currScale = 0.8;
              matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_Scalefactor), 0);

    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
        height: Dimensions.pageViewContainer,
        margin:  EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          color: index.isEven?const Color(0xFF69c5df): const Color.fromARGB(255, 79, 103, 175),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image:  AssetImage(
              "assets/image/food01.png",
              
            )
          )
        ),
      ),
       Align(
        alignment : Alignment.bottomCenter,
         child: Container(
          height: Dimensions.pageViewTextContainer,
          margin:  EdgeInsets.only(left: Dimensions.height30,right: Dimensions.height30,bottom: Dimensions.height30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            color: Colors.white,
            boxShadow:const [
               BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
                offset: Offset(0,3),
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-5,0),
              ),
               BoxShadow(
                color: Colors.white,
                offset: Offset(5,0),
              ),
              
            ],
            ),
            child: Container(
    
              padding:  EdgeInsets.only(top: Dimensions.height10,left: Dimensions.height15,right: Dimensions.height15),
              child: Column(
    
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bigText(text: "Salade"),
                   SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    children: [
                      Wrap( // put children horizontally
                        children: List.generate(5, (index) => const Icon(Icons.star,color: Colors.greenAccent,size: 15)),
                      ),
    
                       SizedBox(
                        width: Dimensions.height10,
                      ),
                      smallText(text: "5"),
                    ],
                  ),
                   SizedBox(
                    height: Dimensions.height20,
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconAndTextWidget(
                        icon: Icons.circle_sharp, 
                        text:"normal", 
                        iconColor: Colors.yellow,
                        color: Colors.black54,
                        ),
    
                        iconAndTextWidget(
                        icon: Icons.location_on, 
                        text:"1.7Km", 
                        iconColor: Colors.greenAccent,
                        color: Colors.black54,
                        ),
    
                        iconAndTextWidget(
                        icon: Icons.timer, 
                        text:"32 min", 
                        iconColor: Colors.limeAccent,
                        color: Colors.black54,
                        ),
                    ],
                  )
                ],
              ),
            ),

            


          ),
           ),


           
      
        ],
      ),
    );
  }
}