import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:em/logic/controllers/cartcontroller.dart';
import 'package:em/routes/routes.dart';
import 'package:em/view/widgets/productdetails/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../logic/controllers/cartcontroller.dart';
class ImageSlider extends StatefulWidget {
  final String imageUrl;
 ImageSlider({
   required this.imageUrl,Key? key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController carouselControlle= CarouselController();
  final cartController =Get.find<CartController>();
   late  int currentPage =0;
   int currentColor =0;
 final List<Color> colorSelected =[
   Colors.black26,
   Colors.blue,
   Colors.yellow,
   Colors.red,
   Colors.pink,
   Colors.green,
   Colors.white

 ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController:carouselControlle ,
            itemCount: 3,
            itemBuilder:(context , index,realIndex){
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(25)
                
              ),
            );

            } ,
            options:CarouselOptions(
              height: 500,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index,reason){
                setState(() {
                   currentPage = index;
                });
              }
              ,
            ) ),
        Positioned(
          left: 180,
          bottom: 30,
            child: AnimatedSmoothIndicator(
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Get.isDarkMode? Colors.pink:Colors.green,
                dotColor: Colors.black
              ),
                activeIndex:currentPage , count: 3),
        ),
        Positioned(
          bottom: 30,
            right: 30,
            child: Container(
          height: 200,
          width: 50,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.5),
            borderRadius: BorderRadius.circular(30)
          ),child: ListView.separated(
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        currentColor =index;
                      });
                    },
                    child: ColorPicker(
                      outerBorder: currentColor==index,
                      color: colorSelected[index],
                    ),
                  );
                },
                separatorBuilder:(context,index)=>
    SizedBox(height: 3,),
                itemCount: colorSelected.length),
        )),Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 25,
            right: 25,

          ),child:
    Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
             onTap: (){
               Get.back();
             },
             child:  Container(
               padding: EdgeInsets.all(8),
               decoration: BoxDecoration(
                 color: Get.isDarkMode? Colors.pink.withOpacity(.8):Colors.green.withOpacity(.8),
                 shape: BoxShape.circle,

               ),
               child: Padding(
                 padding: EdgeInsets.only(left: 10),
                 child: Icon(Icons.arrow_back_ios,size: 20,
                 color: Get.isDarkMode? Colors.blue:Colors.white,),

               ),

             ),
           ),
                Obx(
                    ()=>Badge(
                        position: BadgePosition.topEnd(top: -10, end: -10),
                        animationDuration: Duration(milliseconds: 300),
                        animationType: BadgeAnimationType.slide,

                        badgeContent: Text(
                          cartController.quantity().toString()

                        ),
                        child:
                         InkWell(
                                onTap: (){
                            Get.toNamed(Routes.carditem);
    },
                                      child:  Container(
                       padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                      color: Get.isDarkMode? Colors.pink.withOpacity(.8):Colors.green.withOpacity(.8),
                        shape: BoxShape.circle,

                               ), child: Icon(Icons.shopping_cart,
                          color: Get.isDarkMode? Colors.blue:Colors.white,
                          size: 20,),)
                    )
                ),
                //
                //



              ),

          ],),
        )
      ],
    );
  }
}
