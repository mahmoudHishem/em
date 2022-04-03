import 'package:em/widgets/home/card%20home.dart';
import 'package:em/logic/controllers/cartcontroller.dart';
import 'package:em/logic/controllers/category%20controller.dart';
import 'package:em/logic/controllers/product_controller.dart';
import 'package:em/view/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/product_models.dart';
import '../../../widgets/utilies.dart';

class CategoryItem extends StatelessWidget {
  final String categoryTitle;

  CategoryItem({Key? key,required this.categoryTitle}) : super(key: key);

   final categorycontroller =Get.find<CategoryController>();


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title:Text ("Category item"),
        centerTitle: true,
        backgroundColor: Get.isDarkMode? Colors.black:Colors.green,
      ),
      body:
      Obx((){
        if(categorycontroller.isAllCategory.value){
          return Center(
            child: CircularProgressIndicator(
              color:Get.isDarkMode?Colors.pink: Colors.green,

            ),
          );
        }else{
         return GridView.builder(
              itemCount:categorycontroller.categoryList.length ,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 6.0,
                  childAspectRatio: .8,
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 9.0
              )
              , itemBuilder: (contex,index){
            return buildCardItems(
                image:categorycontroller.categoryList[index].image ,
                price:categorycontroller.categoryList[index].price,
                rate: categorycontroller.categoryList[index].rating.rate,
                productId: categorycontroller.categoryList[index].id,
                Welcome: categorycontroller.categoryList[index],
                onTap: (){
                  Get.to(()=>ProductDetails(welcome: categorycontroller.categoryList[index]));
                });
          });
        }
      }

         ),
    );}

    Widget
    buildCardItems(
        {
          required String image,
          required double price,
          required double rate,
          required int productId,
          required Welcome Welcome,
          required Function() onTap,
        }
        ){
final controller=Get.find<ProductController>();
final cartcontroller =Get.find<CartController>();


      return Padding(padding: EdgeInsets.all(5),
          child: InkWell(
            onTap: onTap,child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow:[
                BoxShadow(
                  color: Colors.grey.withOpacity(.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                ),
              ],
            ),
            child:Column(
              children: [
                Obx(()=> Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      controller.manageFavourites(productId);
                    },
                      icon: controller.isFavourites(productId)?

                      const Icon(Icons.favorite,
                        color: Colors.red,):
                      Icon(Icons.favorite_outline,
                        color: Colors.black,),),
                    IconButton(onPressed: (){
                      cartcontroller.addProductCart(Welcome);
                    },
                      icon:Icon(Icons.shopping_cart),color: Colors.black,)

                  ],
                ),),
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Image.network(image,),
                ),
                Padding(padding: EdgeInsets.only(left: 15,right: 15,top: 10),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$ $price",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                      Container(
                        width: 45,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)

                        ),child: Padding(padding: EdgeInsets.only(left: 3,right: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UtiliesText(text: "$rate",
                                  fontWeight: FontWeight.bold, fontSize:13, color: Colors.white,
                                  underLine: TextDecoration.none),
                              Icon(Icons.star,size: 13,
                                color: Colors.white,)
                            ],
                          )),

                      ),

                    ],
                  ),),


              ],
            ) ,
          ),
          ));

    }
}
