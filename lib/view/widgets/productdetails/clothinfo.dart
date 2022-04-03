import 'package:em/logic/controllers/product_controller.dart';
import 'package:em/model/product_models.dart';
import 'package:em/widgets/utilies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothInfo extends StatelessWidget {
  final String title;
  final String description;
  final int productId;
  late final double rate;
  final controller =Get.find<ProductController>();
  ClothInfo({Key? key,
  required this.title,
    required this.description,
    required this.rate,
  required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:
      Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:20,

                  color: Get.isDarkMode? Colors.white:Colors.black,
                ),),
              ),
              Obx(()=>Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Get.isDarkMode?Colors.white.withOpacity(.9)
                        :Colors.grey.withOpacity(.4),
                    shape: BoxShape.circle),
                child:InkWell(
                  onTap: (){
                    controller.manageFavourites(productId);

                  },
                  child:controller.isFavourites(productId)?
                  Icon(Icons.favorite,
                    color: Colors.red,
                    size: 20,):
                  Icon(Icons.favorite_outline,
                    color: Colors.black,
                    size: 20,),
                ) ,
              ))
            ],
          ),
          Row(
            children: [
              UtiliesText(text:"$rate" ,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Get.isDarkMode? Colors.white:Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(width: 8,),
              RatingBarIndicator(
                rating: rate,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 50.0,
                direction: Axis.horizontal,
              ),

              // RatingBar(
              //   icon: Icon(Icons.star,
              //   size: 20,
              //   color: Colors.grey,),
              //   starCount: 5
              //   ,spacing: 1,
              //   size: 20,
              //   isIndicator: false,
              //   allowHalfRating: true,
              //   onRatingCallback: (value,isIndictor){
              //     isIndictor.value=true;
              //   },
              //   color: Colors.orange,
              // )
            ],
          ),
          SizedBox(height: 15,),
          ReadMoreText(

            description,
            trimMode: TrimMode.Line,
            style: TextStyle(
            color: Get.isDarkMode?Colors.white:Colors.black,
            fontWeight: FontWeight.bold,
            height: 2,
            fontSize: 16
          ),
            trimLines: 4,
            trimLength: 150,
            textAlign: TextAlign.justify,
            trimCollapsedText: "show More",
            trimExpandedText:  "Show Less",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode? Colors.pink:Colors.green
            ),
      moreStyle:  TextStyle(
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode? Colors.pink:Colors.green
            ),
          )
        ],
      ),
    );
  }
}
