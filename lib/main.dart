import 'package:em/language/localization.dart';
import 'package:em/logic/controllers/theme.dart';
import 'package:em/routes/routes.dart';
import 'package:em/utilis/my_string.dart';
import 'package:em/utilis/theme.dart';
import 'package:em/view/screens/WelcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init()
;  await Firebase.initializeApp();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>('lang').toString()),
      fallbackLocale: Locale(ene),
      translations: LocalizationApp(),
      title: 'Asroo shop',
     theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,

      home: WellcomeScreen(),
      initialRoute: FirebaseAuth.instance.currentUser!=null||
      GetStorage().read<bool>('auth')==true?
      AppRoutes.mainScreen:AppRoutes.wellcome,
      getPages: AppRoutes.routes,

    );
  }
}
