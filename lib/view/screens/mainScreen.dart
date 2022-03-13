import 'package:em/logic/controllers/main_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MainScreen extends StatelessWidget {
 MainScreen({Key? key}) : super(key: key);
  final controller= Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx((){
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(leading: Container(),

          actions: [
            IconButton(onPressed: (){


            }, icon: Icon(Icons.shop))
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
