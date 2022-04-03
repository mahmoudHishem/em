import 'package:em/logic/controllers/cartcontroller.dart';
import 'package:em/logic/controllers/product_controller.dart';
import 'package:em/view/screens/product_details.dart';
import 'package:em/widgets/utilies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product_models.dart';
class CardItems extends StatelessWidget {
   CardItems({Key? key}) : super(key: key);
   final searchList =Get.find<ProductController>();
  final controller =Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if (controller.isLoading.value){
        return    Center(
          child: CircularProgressIndicator(
            color:Get.isDarkMode?Colors.pink: Colors.green,

          ),
        );
      }else{
        return Expanded(

            child:
            controller.searchList.isEmpty&&controller.searchTextController.text.isNotEmpty?
            Get.isDarkMode?
            Image.network("https://www.citypng.com/p"
                "ublic/uploads/preview/download-black-search-icon-button-png-11640084021zgwjfva3zm.png"):
            Image.network("https://i.pinimg.com/originals/89/39/"
                "06/893906d9df7228cc36e1b3679a0d1dac.png"):

            GridView.builder(

              itemCount: controller.searchList.length,
                gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: .8,
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 6,
                  maxCrossAxisExtent: 200,
                ), itemBuilder: (context,index){
                if(controller.searchList.isEmpty){
                  return buildCardItems(
                      image: controller.ProductList[index].image,
                      price: controller.ProductList[index].price,
                      rate: controller.ProductList[index].rating.rate,
                      productId: controller.ProductList[index].id,
                      Welcome: controller.ProductList[index],
                      onTap: (){
                        Get.to(()=>ProductDetails(
                          welcome: controller.ProductList[index],
                        )
                        );
                      }


                  );
                }
                else{return buildCardItems(
                    image: controller.searchList[index].image,
                    price: controller.searchList[index].price,
                    rate: controller.searchList[index].rating.rate,
                    productId: controller.searchList[index].id,
                    Welcome: controller.searchList[index],
                    onTap: (){
                      Get.to(()=>ProductDetails(
                        welcome: controller.searchList[index],
                      )
                      );
                    }


                );

                }
                return buildCardItems(
                  image: controller.searchList[index].image,
                  price: controller.searchList[index].price,
                  rate: controller.searchList[index].rating.rate,
                  productId: controller.searchList[index].id,
                  Welcome: controller.searchList[index],
                  onTap: (){
                    Get.to(()=>ProductDetails(
                      welcome: controller.searchList[index],
                    )
                    );
                  }


                );
            })


        );
      }
    });
  }
}

Widget buildCardItems(
{
  required String image,
   required double price,
  required double rate,
  required int productId,
  required Welcome Welcome,
  required Function() onTap,
}
    ){
  final controller =Get.find<ProductController>();
  final cartController = Get.find<CartController>();


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
              cartController.addProductCart(Welcome);
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
