//
// import 'package:em/services/category_service.dart';
// import 'package:get/get.dart';
//
// class   CategoryController extends GetxController{
//   var isCategoryLoading =false.obs;
//   var categoryNameList =<String>[].obs;
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     getCategory();
//     super.onInit();
//   }
//   void getCategory()async{
//     var categoryName =await CategoryServices.getCategory();
//     try{
//       if(categoryName.isNotEmpty){
//         categoryNameList.addAll(categoryName);
//       }
//     }
//        finally{
//       isCategoryLoading(false);
//        }
//
//   }
// }


import 'package:em/model/product_models.dart';
import 'package:em/services/category_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class CategoryController extends GetxController{
  List<String> images=["https://i.ytimg.com/vi/rmE6etFIHXU/maxresdefault.jpg",
    "https://cdn.w600.comps.canstockphoto.com/fashion-jewelrys-fashion-jewels-as-stock-photo_csp53220743.jpg",
    "https://cdn.vox-cdn.com/thumbor/QgEMwYKlcK9fSFsZD2FIe9SouxM=/0x0:4915x3930/1200x800/filters:focal(1719x1156:2505x1942)/cdn.vox-cdn.c"
        "om/uploads/chorus_image/image/61753005/clothingrack.0.jpg",
    "https://cdn.vox-cdn.com/thumbor/QgEMwYKlcK9fSFsZD2FIe9SouxM=/0x0:4915x3930/1200x800/filters:focal(1719x1156:2505x1942)/cdn.vox-cdn.c"
        "om/uploads/chorus_image/image/61753005/clothingrack.0.jpg"];
  var categoryNameList =<String>[].obs;
  var categoryList= <Welcome>[].obs;
  var isCategoryLoading=false.obs;
  var isAllCategory =false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getCategory();
    super.onInit();
  }
  void getCategory()async{
    var categoryName =await CategoryServices.getCategory();
    try{
      if(categoryName.isNotEmpty){
        categoryNameList.addAll(categoryName);
      }
    }finally{
      isCategoryLoading(false);
    }
  }
 getAllCategory(String namecategory)async{

    categoryList.value=await AllCategoryServices.getAllCategory(namecategory);
    isAllCategory (false);
 }
   getCategoryIndex(int index)async{
     var categoryAllName= await getAllCategory(categoryNameList[index]);

     if(categoryAllName !=null){
       categoryList.value=categoryAllName;
     }
   }
   }

