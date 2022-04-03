import 'package:em/logic/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget {
   SearchFormText({Key? key}) : super(key: key);
  final controller =Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: controller,
        builder: (_)=>

            TextFormField(style: const TextStyle(
              color: Colors.black
            ),
              controller: controller.searchTextController,
              keyboardType: TextInputType.text,
              onChanged: (searchName){
                controller.addSearchToList(searchName);

              },
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.red,
                  prefixIcon: const Icon(Icons.search,color: Colors.grey,),filled: true,
                  suffixIcon:controller.searchTextController.text.isNotEmpty?
                  IconButton(onPressed: (){
                    controller.clearSearch();
                  }, icon: const Icon(Icons.close,
                    color: Colors.black,)):
                  null,
                  hintText: 'Search With Name And Price',hintStyle:const TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),
                  focusedBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  errorBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10))

              ),
            ));
  }
}
