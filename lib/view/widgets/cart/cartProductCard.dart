import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartProductCard extends StatelessWidget {
  const CartProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      margin: EdgeInsets.only(left: 20,right: 20,top: 5),
      decoration: BoxDecoration(
        color: Get.isDarkMode? Colors.pink.withOpacity(.7):Colors.green.withOpacity(.5),
borderRadius: BorderRadius.circular(20),


      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Row(
          children: [
            Container(
              height: 120,
              width: 100,
              margin: EdgeInsets.only(left: 15,),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1594583388647-364ea6532257?ixlib=rb-1.2.'
                          '1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',),
                      fit: BoxFit.cover
                  )
              ),
            ),SizedBox(width: 20,
            ),
            Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("flutter devolper codeudemyflutterdevolper code udemy",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ?Colors.white:Colors.black,
                      fontSize: 14,fontWeight: FontWeight.bold

                  ),),SizedBox(height: 20,),
                Text("\$109.99",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ?Colors.white:Colors.black,
                      fontSize: 16,fontWeight: FontWeight.bold

                  ),),

              ],
            )),
           SizedBox(height: 60,),
           Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Row(
                 children: [
                   IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle,
                     color: Get.isDarkMode? Colors.white:Colors.black,)),
                   Text("1",
                     style: TextStyle(
                         overflow: TextOverflow.ellipsis,
                         color: Get.isDarkMode ?Colors.white:Colors.black,
                         fontSize: 16,fontWeight: FontWeight.bold

                     ),),
                   IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,
                     color: Get.isDarkMode? Colors.white:Colors.black,

                   )),

                 ],
               ),
               IconButton(onPressed: (){}, icon: Icon(Icons.delete,
               color:Get.isDarkMode? Colors.red:Colors.black,
               size: 20,))
             ],
           )
          ],
        ),
]
    ),
    );
  }
}
