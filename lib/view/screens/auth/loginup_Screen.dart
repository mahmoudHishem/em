
import 'package:em/auth/authButton.dart';
import 'package:em/auth/auth_Text_form_field.dart';
import 'package:em/auth/containerunder.dart';
import 'package:em/logic/controllers/auth_controles.dart';
import 'package:em/routes/routes.dart';
import 'package:em/utilis/my_string.dart';
import 'package:em/widgets/utilies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
   final TextEditingController nameController = TextEditingController();
   final TextEditingController emilController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
  final formKey=GlobalKey<FormState>();
  final controller =Get.find<AuthControlles>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          backgroundColor:Get.isDarkMode? Colors.black:Colors.green,
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
                            UtiliesText(text: 'LOG',
                                fontWeight: FontWeight.w500,
                                fontSize:28,
                                color: Get.isDarkMode? Colors.pink:Colors.green,
                                underLine: TextDecoration.none),
                            SizedBox(width: 3,),
                            UtiliesText(text: 'IN',
                                fontWeight: FontWeight.w500,
                                fontSize:28,
                                color: Get.isDarkMode? Colors.white:Colors.black,
                                underLine: TextDecoration.none),
                          ],)
                          ,SizedBox(
                            height: 50,
                          ),




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

                            suffixIcon: Text('',style: TextStyle(color: Colors.black),),
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
                              Icon(Icons.lock,color: Colors.pink,):

                                Icon(Icons.lock,color: Colors.green,),
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
                         Align(
                           alignment: Alignment.centerRight,child:
                         TextButton(onPressed: (){Get.toNamed(Routes.forgotPassword);},
                             child: UtiliesText(text: 'Forgot Password?',
                                 fontWeight: FontWeight.bold,
                                 fontSize: 14,
                                 color:Get.isDarkMode?Colors.white:Colors.black,
                                 underLine: TextDecoration.none)),
                         )
,
                          SizedBox(height: 50,),

                          GetBuilder<AuthControlles>(builder: (_){
                            return AuthButton(Text: 'LOG in',
                                onPressed: (){
                              if(formKey.currentState!.validate()){
                                String email = emilController.text.trim();
                                String password= passwordController.text;
                                controller.logInUsingFirebase(email: email, password: password);
                              }
                                });
                          }),
                          SizedBox(height: 20,),
                          UtiliesText(text: 'OR',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color:Get.isDarkMode?Colors.white:Colors.black,
                              underLine: TextDecoration.none)
                          ,
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [ InkWell(onTap: (){},
                              child: Icon(Icons.facebook,color: Colors.black,size: 40,)

                            ),


                              SizedBox(width: 10,),
                              GetBuilder<AuthControlles>(builder: (_){
                                return InkWell(onTap:(){
                                  controller.googleSignInApp();
                                },
                                  child:CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child:  CircleAvatar(
                                      radius: 20,
                                        child: Image.network(
                                            'https://play-lh.googleusercontent.com/6U'
                                                'gEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1')
                                    ),
                                  )

                                  ,)  ;
                              }),

                              

                          ],)

                        ],
                      ),)
                ),
              ),
              ContainerUnder(onPressed: (){Get.offNamed(Routes.SignScreen);},
                text:  "Don't have an Account?",
                textType: 'Sign Up',
              ),],
          ),
        ),),
    );
  }
}