import 'package:em/model/product_models.dart';
import 'package:em/view/widgets/productdetails/clothinfo.dart';
import 'package:em/view/widgets/productdetails/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/productdetails/addcart.dart';
import '../widgets/productdetails/imageslider.dart';
class ProductDetails extends StatelessWidget {
   ProductDetails({Key? key,
   required this.welcome}) : super(key: key);
  final Welcome welcome;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(
              imageUrl:welcome.image ,

            ),
            ClothInfo(
              title: welcome.title,
              productId: welcome.id,
              rate: welcome.rating.rate,
              description: welcome.description,
            ),
            SizeList(),
            AddCart(
              welcome: welcome,
              price: welcome.price,
            )
            // SizeList();

          ],
        ),
      ),
    ));
  }
}
