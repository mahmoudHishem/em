


import 'package:em/logic/bindings/auth_binding.dart';
import 'package:em/logic/bindings/main_binding.dart';
import 'package:em/logic/bindings/product_binding.dart';
import 'package:em/view/screens/WelcomeScreen.dart';
import 'package:em/view/screens/auth/forget_up_password.dart';
import 'package:em/view/screens/auth/loginup_Screen.dart';
import 'package:em/view/screens/auth/signup_Screen.dart';
import 'package:em/view/screens/mainScreen.dart';
import 'package:em/view/screens/mainScreen.dart';
import 'package:em/view/screens/mainScreen.dart';
import 'package:get/get.dart';

class AppRoutes{
  static const wellcome =Routes.wellcomeScreen;
  static const LoginUP =Routes.SignScreen;
  static const SignUp =Routes.LoginScreen;
 static const forgotpassword= Routes.forgotPassword;
 static const mainScreen =Routes.mainScreen;

  static final routes=[
    GetPage(name: Routes.wellcomeScreen,
        page: ()=> const WellcomeScreen()),

    GetPage(name: Routes.LoginScreen,
        page: ()=>  LoginScreen()
    ,binding: AuthBinding()),

    GetPage(name: Routes.SignScreen,
        page: ()=> SignUpScreen(),
    binding: AuthBinding()),
    GetPage(name: Routes.forgotPassword,
        page: ()=>  ForgotPassword(),
        binding: AuthBinding()),
    GetPage(name: Routes.mainScreen,
        page: ()=>  MainScreen(),
        bindings: [
          AuthBinding(),MainBinding(),
          ProductBinding(),
        ]),

  ];
}
class Routes{
  static const wellcomeScreen='/wellcomeScreen';
  static const LoginScreen='/LoginScreen';
  static const SignScreen='/SignScreen';
  static const forgotPassword='/ForgotPassword';
  static const mainScreen ='/MainScreen';



}