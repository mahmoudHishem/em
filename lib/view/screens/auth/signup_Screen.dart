

import 'package:em/auth/authButton.dart';
import 'package:em/auth/auth_Text_form_field.dart';
import 'package:em/auth/checkwidget.dart';
import 'package:em/auth/containerunder.dart';
import 'package:em/logic/controllers/auth_controles.dart';
import 'package:em/routes/routes.dart';
import 'package:em/utilis/my_string.dart';
import 'package:em/widgets/utilies.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
 SignUpScreen({Key? key}) : super(key: key);
 final formKey=GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emilController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  final controller =Get.find<AuthControlles>();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Get.isDarkMode? Colors.white:Colors.black,
          elevation: 0,

        ),
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/1.3,
                child: Padding(
                  padding: EdgeInsets.only(left: 25,right: 25,top: 40),
                  child:Form(
                    key: formKey,
                    child:  Column(
                    children: [
                      Row(children: [
                        UtiliesText(text: 'SIGN',
                            fontWeight: FontWeight.w500,
                            fontSize:28,
                            color: Get.isDarkMode? Colors.green:Colors.pink,
                            underLine: TextDecoration.none),
                        SizedBox(width: 3,),
                        UtiliesText(text: 'UP',
                            fontWeight: FontWeight.w500,
                            fontSize:28,
                            color: Get.isDarkMode? Colors.white:Colors.black,
                            underLine: TextDecoration.none),
                      ],)
                      ,SizedBox(
                        height: 50,
                      ),
                      AuthTextFormField(
                        controller: nameController,
                        validator:(value){
                          if(value.toString().length<=2||!RegExp(validationName).hasMatch(value)){
                            return 'Enter Vaild Name';
                          }else{
                            return null;
                          }
                        } ,
                        obscureText: false,
                        prefixIcon:Get.isDarkMode?
                        Icon(Icons.supervised_user_circle_outlined,color: Colors.green,)
                            :
                        Icon(Icons.person,color: Colors.pink,),
                        suffixIcon: Text(''),
                        hintText: 'UserName',
                      ),



                      SizedBox (height: 20,),
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
                        Icon(Icons.email,color: Colors.green,):
                        Icon(Icons.email,color: Colors.pink,),
                        suffixIcon: Text(''),
                        hintText: 'Email',

                      ),
                      SizedBox(height: 20,),
                     GetBuilder<AuthControlles>(builder: (_){
                       return AuthTextFormField(
                         controller: passwordController ,
                         validator:(value){
                           if(value.toString().length<6){
                             return'unvalid password';
                           }else{
                             return null;
                           }
                         } ,
                         obscureText: controller.isVisibility?false:true,
                         prefixIcon:Get.isDarkMode?
                         Icon(Icons.lock,color: Colors.green,):
                         Icon(Icons.lock,color: Colors.pink,),
                         suffixIcon: IconButton(onPressed: (){
                           controller.visibility();
                         },
                             icon:controller.isVisibility ?
                             Icon(Icons.visibility_off,color: Colors.black,):
                                 Icon(Icons.visibility,color: Colors.black,)
                         ),
                         hintText: 'Password',

                       );

                     }),
                      SizedBox(height: 50,),
                      CheckWidget(),
                      SizedBox(height: 50,),

                      GetBuilder<AuthControlles>(builder: (_){
                        return AuthButton(Text: 'Sign UP',
                            onPressed: (){
                          if(controller.isCheckBox==false){
                            Get.snackbar("Check Box",
                                "Please, Accept terms & conditions",
                            snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                              colorText: Colors.white
                            );
                          }else if(formKey.currentState!.validate()){
                          String name =nameController.text.trim();
                          String email =emilController.text.trim();
                          String password =passwordController.text;


                          if(formKey.currentState!.validate()){
                            controller.signUpUsingFirebase(
                                name: name, email:email ,
                                password: password);
                            controller.isCheckBox= true;

                          }}
                        });
                      })
                    ],
                  ),)
                ),
              ),
              ContainerUnder(onPressed: (){Get.offNamed(Routes.LoginScreen);}, text: 'Already have an Account? ',
textType: 'Log in',
          ),],
        ),
      ),),
    );
  }
}
