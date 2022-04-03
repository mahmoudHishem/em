import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class  ThemeController{
  final GetStorage boxStorage =GetStorage();
  final Key ='isDarkMode';
  saveThmemDataInbox(bool isDark){

    boxStorage.write(Key, isDark);
  }
   bool getThemeDataFromBox(){
    return  boxStorage.read<bool>(Key) ?? false;
  }
  ThemeMode get themeDataGet=>
      getThemeDataFromBox()? ThemeMode.dark:ThemeMode.light;
  void ChangesTheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThmemDataInbox(!getThemeDataFromBox());


    //   Get.isDarkMode?
    //
    //   Get.changeThemeMode(ThemeMode.dark);
  }
}