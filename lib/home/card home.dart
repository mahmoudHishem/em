import 'package:em/logic/controllers/product_controller.dart';
import 'package:em/widgets/utilies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CardItems extends StatelessWidget {
   CardItems({Key? key}) : super(key: key);
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
            child: GridView.builder(
              itemCount: controller.ProductList.length,
                gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: .8,
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 6,
                  maxCrossAxisExtent: 200,
                ), itemBuilder: (context,index){
                return buildCardItems(
                  image: controller.ProductList[index].image,
                  price: controller.ProductList[index].price,
                  rate: controller.ProductList[index].rating.rate,
                  productId: controller.ProductList[index].id,


                );
            }));
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
}
    ){
  final controller =Get.find<ProductController>();


  return Padding(padding: EdgeInsets.all(5),
  child: Container(
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
           IconButton(onPressed: (){}, icon:Icon(Icons.add),color: Colors.black,)

         ],
       ),),
        Container(
          width: double.infinity,
          height: 150,
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
  ),);
}
