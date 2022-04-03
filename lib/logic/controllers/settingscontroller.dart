import 'package:em/language/ar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utilis/my_string.dart';
class SettingsController extends GetxController{

var storage =GetStorage();
  var switchValue= false.obs;
  var langLocal= ene;
  String capitalize (String profileName){
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }
  @override
  void onInit()async {
    super.onInit();
    langLocal =await getLanguage;
  }
  void saveLanguage(String lang)async{
    await storage.write("lang", lang);

}
  Future<String> get getLanguage  async{
return await storage.read("lang");
  }
  void changeLanguage( String typeLang){
    saveLanguage(ene);
   if (langLocal ==typeLang){
     return;
   }if(typeLang==frf){
     langLocal =frf;
     saveLanguage(frf);

   }else if(typeLang==ara){
     langLocal =ara;
     saveLanguage(ara);
    }else{
     langLocal=ene;
     saveLanguage(ene);
    }
   update();
  }
}