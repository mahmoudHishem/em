import 'package:em/logic/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
class FavoriteScreen extends StatelessWidget {
   FavoriteScreen({Key? key}) : super(key: key);
  final controller=Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx((){
        if(controller.favouritesList.isEmpty)
         {
           return Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(
                   height: 100,
                   width: 100,
                   child: Image.network('https://upload.wikimedia.org/wikipedia/common'
                       's/thumb/5/52/Heart_icon_red_hollow.svg/2166px-Heart_icon_red_hollow.svg.png'),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Text('please, Add your favorites products',
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Get.isDarkMode? Colors.white:Colors.black,
                       fontSize: 18
                   ),)

               ],
             ),
           );
         }else{
            return ListView.separated(itemBuilder: (context, index) {
          return buildFavItem(
              image:controller.favouritesList[index].image,
          price: controller.favouritesList[index].price,
            title: controller.favouritesList[index].title,
            productId: controller.favouritesList[index].id,
          );
          },
          separatorBuilder: (context, index) {
          return Divider(
          color: Colors.grey,
          thickness: 1,
          );
          },
          itemCount: controller.favouritesList.length);


        }


        }
      ),);
}

  }

  Widget buildFavItem(
{
  required String  image,
  required double price,
  required String title,
  required int productId,
}
      ) {
    final controller=Get.put(ProductController());

    return Padding(padding: EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      height:75,
      child: Row(
        children: [
          SizedBox(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(image,fit: BoxFit.cover,),
              ),
            ),
          ),
          SizedBox(width: 15,)
          ,Expanded(flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(title
                 ,
                style: TextStyle(
                overflow: TextOverflow.ellipsis,

                color: Get.isDarkMode?Colors.white:Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,


              ),),
              SizedBox(
                height: 10,
              ),
              Text('\$$price',style: TextStyle(
                color: Get.isDarkMode?Colors.white:Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                overflow: TextOverflow.ellipsis,


              ),)
            ],
          )),
          Spacer(),
          IconButton(onPressed: (){
            controller.manageFavourites(productId);
          }, icon: Icon(Icons.favorite,
          color: Colors.red,))

        ],
      ),
    ),);
  }
