import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SizeList extends StatefulWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  _SizeListState createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList =['s','m','l','xl','xxl',]
;  var currentSelected =0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=>
              GestureDetector(
                onTap: (){
                  setState(() {
                    currentSelected=index;
                  });
                },
                child:  Container(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),

                  decoration: BoxDecoration(
                      color: Get.isDarkMode? currentSelected==index?
                      Colors.pink.withOpacity(.4):Colors.black:
                      currentSelected==index?
                      Colors.green:Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.withOpacity(.4),
                          width: 2)
                  ),
                  child: Text(
                    sizeList[index],
                    style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold,
                      color:
                      Get.isDarkMode?
                      currentSelected ==index? Colors.white:
                      Colors.white:
                      currentSelected ==index? Colors.black:
                      Colors.black,
                    ),
                  ),

                ),
              ),
          separatorBuilder: (context,index)=>
              SizedBox(width: 10,),
          itemCount: sizeList.length),
    ) ;
  }
}







