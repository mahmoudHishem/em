
import 'package:em/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardEmpty extends StatelessWidget {
  const CardEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart,
            size: 150,
            color:Get.isDarkMode? Colors.white:Colors.black,),
          SizedBox(height: 30,),
          RichText(text: TextSpan(
            children: [
              TextSpan(
                  text:"your Cart is  ",
                style: TextStyle(
                  color: Get.isDarkMode? Colors.white:Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
              ),
              TextSpan(
                  text:"Empty",
                  style: TextStyle(
                      color: Get.isDarkMode? Colors.pink:Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  )
              ),
            ]
          )),
          SizedBox(height: 10,),
          Text('Add items to get started', style: TextStyle(
              color: Get.isDarkMode? Colors.white:Colors.black,
              fontSize:15,
              fontWeight: FontWeight.bold
          )),SizedBox(height: 50,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),

              ),primary: Get.isDarkMode ? Colors.pink:Colors.green,elevation: 0
            ),
              onPressed: (){
                Get.toNamed(Routes.mainScreen);
              },
              child:Text('Go to Home',style: TextStyle(fontSize: 20,color: Colors.white,),))
        ],

      ),
    );
  }
}
