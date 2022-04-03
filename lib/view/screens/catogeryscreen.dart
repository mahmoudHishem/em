import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/category/catogery_widget.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

        Padding(padding: EdgeInsets.all(25),
        child: Column(

          children: [
         Align(
           alignment: Alignment.topLeft,
           child:    Text("Category",
             style: TextStyle(
               fontSize: 30,
               fontWeight: FontWeight.bold,
               color: Colors.black
           ),),
         ),
            SizedBox(height: 20,),
            CategoryBody()            // CategoryScreen(),


          ],
        )
        )

        ;
  }
}
