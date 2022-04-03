import 'package:em/view/screens/favorite.dart';
import 'package:em/view/screens/home.dart';
import 'package:em/view/screens/catogeryscreen.dart';
import 'package:em/view/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MainController extends GetxController{
  RxInt currentIndex=0.obs;
  final tabs=[
    Home(),
    CategoryScreen(),

    FavoriteScreen(),
    SettingsScreen()


  ].obs;
  final titles=[
    'Asroo shop',
    'Category',
    'Favorite',

    'Settings'

  ].obs;
}