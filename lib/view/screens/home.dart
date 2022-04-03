import 'package:em/widgets/home/card%20home.dart';
import 'package:em/widgets/home/searchform.dart';
import 'package:em/widgets/utilies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Get.isDarkMode?Colors.black:Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              )
            ),
            child:Padding(padding: EdgeInsets.only(left: 20,right: 20),
            child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UtiliesText(text: 'Find Your',
                      fontWeight: FontWeight.bold, fontSize:25, color: Colors.white,
                      underLine:TextDecoration.none),
                  SizedBox(height: 5,),

                  UtiliesText(text: 'INSPIRATION',
                      fontWeight: FontWeight.bold, fontSize:28, color: Colors.white,
                      underLine:TextDecoration.none),
                  SizedBox(height: 20,),
                  SearchFormText(),

                ]),)
          ),
          SizedBox(

           height: 10,
          ),
          Padding(padding: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: UtiliesText(text: "Categories",
                fontWeight: FontWeight.w500, fontSize: 20,
                color: Get.isDarkMode? Colors.white:Colors.black,
                underLine: TextDecoration.none),
          ),),
          SizedBox(height: 30,),
          CardHome(),
        ],
      ),
    ));
  }
}
