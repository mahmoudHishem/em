
import 'dart:ffi';

import 'package:em/services/product%20services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/product_models.dart';

class ProductController extends GetxController{

  var ProductList=<Welcome>[].obs;
  var isLoading = true.obs;
  var favouritesList=<Welcome>[].obs;
  var storage = GetStorage();
  var searchList =<Welcome>[].obs;
  TextEditingController searchTextController =TextEditingController();

  @override
  void onInit(){
    super.onInit();
    storage.read<List>('favouritesList');
    getProduct();

  }
  getProduct()
  async {
    var Products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (Products.isNotEmpty) {
        ProductList.addAll(Products);
      }
    } finally {
      isLoading(false);
    }




  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);}

  void manageFavourites(int productId) async{
    var existindex=favouritesList.indexWhere((element) => element.id==productId);
    if(existindex>=0){
      favouritesList.removeAt(existindex);
      await storage.remove('favouritesList');
    }else{
      favouritesList.add(
          ProductList.firstWhere((element) => element.id == productId)
      );
     await
     storage.write("isFavouriteList", favouritesList);

    }


  }
  void  addSearchToList(String searchName){
    searchName= searchName.toLowerCase();
    searchList.value =
        ProductList.where((search) {
         var searchTitle = search.title.toLowerCase();
         var searchPrice = search.price.toString().toLowerCase();
         return
            searchTitle.contains(searchName)||
                searchPrice.toString().contains(searchName)
        ;} ).toList();
    update();

  }
  void clearSearch(){
    searchTextController.clear();
    addSearchToList('');
  }
  }
