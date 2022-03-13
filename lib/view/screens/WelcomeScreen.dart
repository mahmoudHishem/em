
import 'package:em/routes/routes.dart';
import 'package:em/widgets/utilies.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
    body: Stack(
children: [
SizedBox(
height: double.infinity,
width: double.infinity,
child: Image.network('https://i.pinimg.com/474x/a5/a0/5d/a5a05d2e95e97f6e2e2281f97d50b4c9.jpg',fit: BoxFit.cover,)

),
  Container(
    color: Colors.black.withOpacity(.2),
    width: double.infinity,
    height: double.infinity,
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
          height: 60,
          width: 190,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.3)
                ,borderRadius: BorderRadius.circular(6),
          ),child: Center(child: UtiliesText(
          text: 'wellcome',
          fontSize: 35,
          color: Colors.white,
          fontWeight: FontWeight.bold, underLine: TextDecoration.none,
        )
        ),
    ),SizedBox(
          height: 10,
        ),Container(
          height: 60,
          width: 230,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.3)
            ,borderRadius: BorderRadius.circular(6),
          ),child: Row(
          children: [
            UtiliesText(
              text: 'ASroo',
              fontSize: 35,
              color: Colors.green,
              fontWeight: FontWeight.bold,underLine: TextDecoration.none,
            ),SizedBox(width: 10,),
            UtiliesText(
              text: 'Shop',
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.bold,underLine: TextDecoration.none,
            )
          ],
        )
        ),SizedBox(height: 250,),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 40
            )
            ),
            onPressed: (){Get.toNamed(Routes.LoginScreen);},
            child: UtiliesText(text: 'Get Start',
                fontWeight: FontWeight.bold,
                fontSize: 22, color: Colors.white,underLine: TextDecoration.none,)),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UtiliesText(text: "Don't Have An Acount?",
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.white,underLine: TextDecoration.none,),
            TextButton(onPressed: (){Get.offNamed(Routes.SignScreen);},
                child: UtiliesText(text: "SignUp",
                    fontWeight: FontWeight.normal,
                    fontSize: 18, color: Colors.white,
                underLine: TextDecoration.underline,))
          ],
        )


      ],
    ) ,
  )
],
),
));
  }
}

