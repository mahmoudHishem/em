import 'package:badges/badges.dart';
import 'package:em/logic/controllers/cartcontroller.dart';
import 'package:em/logic/controllers/cartcontroller.dart';
import 'package:em/routes/routes.dart';
import 'package:em/view/screens/carditem.dart';
import 'package:em/logic/controllers/main_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/cartcontroller.dart';
class MainScreen extends StatelessWidget {
 MainScreen({Key? key}) : super(key: key);
  final controller= Get.find<MainController>();
  final cartController =Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx((){
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(leading: Container(),

          actions: [
           Obx(()=>
               Badge(
                   position: BadgePosition.topEnd(top: 0, end: 3),
                   animationDuration: Duration(milliseconds: 300),
                   animationType: BadgeAnimationType.slide,
                   badgeContent: Text(
                     cartController.quantity().toString(),
                     style: TextStyle(color: Colors.white),
                   ),
                   child:  IconButton(onPressed: (){
                     Get.toNamed(Routes.carditem);


                   }, icon: Icon(Icons.shop))
               ),)

          ],
          backgroundColor: Get.isDarkMode ?Colors.black:Colors.green,
          elevation: 0,
          title: Text(controller.titles[controller.currentIndex.value]),
          centerTitle: true,
        ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
          currentIndex: controller.currentIndex.value,
          onTap: (index){
            controller.currentIndex.value=index;
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home,
                  color: Get.isDarkMode?Colors.pink:Colors.green),
              icon: Icon(Icons.home,

                color: Get.isDarkMode?Colors.white:Colors.black,),
              label: '',

            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.category,
                  color: Get.isDarkMode?Colors.pink:Colors.green),
              icon: Icon(Icons.category,

                color: Get.isDarkMode?Colors.white:Colors.black,),
              label: '',


            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite,
                  color: Get.isDarkMode?Colors.pink:Colors.green),
              icon: Icon(Icons.favorite,

                color: Get.isDarkMode?Colors.white:Colors.black,),
              label: '',


            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings,
                  color: Get.isDarkMode?Colors.pink:Colors.green),
              icon: Icon(Icons.settings,

                color: Get.isDarkMode?Colors.white:Colors.black,),
              label: '',


            )
            ,
          ],
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children:controller.tabs.value,
        ),
      );
    }));
  }
}
