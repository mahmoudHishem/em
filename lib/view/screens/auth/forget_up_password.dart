
import 'package:em/auth/authButton.dart';
import 'package:em/auth/auth_Text_form_field.dart';
import 'package:em/logic/controllers/auth_controles.dart';
import 'package:em/utilis/my_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
   ForgotPassword({Key? key}) : super(key: key);
  final formKey=GlobalKey<FormState>();
   final TextEditingController emilController = TextEditingController();
   final controller= Get.find<AuthControlles>();


   @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      appBar: AppBar(
        backgroundColor: Get.isDarkMode?Colors.white:Colors.black,
        centerTitle: true,
        title: Text('Forgot PassWord',
        style: TextStyle(
          color: Get.isDarkMode? Colors.pink:Colors.white
        ),),
        leading: IconButton(
          onPressed: (){
            Get.back();
          }
          ,
        icon:Icon(Icons.arrow_back,
        color: Get.isDarkMode?Colors.black:Colors.white,) ,
        ),
      ),backgroundColor: context.theme.backgroundColor,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(

            children: [
              Align(alignment: Alignment.centerRight,
              child: IconButton(onPressed: (){
                Get.back();
              },icon: Icon(Icons.close_rounded,color: Get.isDarkMode?Colors.black:Colors.white,),),),
              SizedBox(height: 20,),
              Text(''
                  'If you want to recover your account, then please provide your email Id below..'
              ,textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Get.isDarkMode?Colors.white:Colors.black
              ),)
              ,SizedBox(height: 60,),
              Image.network('https://corpjurist.com/assets/images/forgotpassword/forgot_password.png',
              width: 250,)
              ,SizedBox(height: 50,),
              AuthTextFormField(
                controller:emilController,

                validator:(value){
                  if(!RegExp(validationEmail).hasMatch(value)){
                    return' Error Valid email';
                  }else{
                    return null;
                  }
                } ,
                obscureText: false,
                prefixIcon: Get.isDarkMode?
                Icon(Icons.email,color: Colors.pink,):

                  Icon(Icons.email,color: Colors.green,),
                suffixIcon: Text(''),
                hintText: 'Email',

              )
            ,SizedBox(height: 50,),
          GetBuilder<AuthControlles>(builder: (_){
            return AuthButton(onPressed: (){
              if (formKey.currentState!.validate()){
                controller.restPassword(emilController.text.trim());
              }
            },
                Text:'SEND');
          })


            ],
          ),)
        ),
      ),
    ));
  }
}
