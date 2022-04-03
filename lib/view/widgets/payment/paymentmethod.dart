import 'package:em/widgets/utilies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PayMentType extends StatefulWidget {
  const PayMentType({Key? key}) : super(key: key);

  @override
  _PayMentTypeState createState() => _PayMentTypeState();
}

class _PayMentTypeState extends State<PayMentType> {
  List image=["https://play-lh.googleusercontent.com/KwUBNPbMTk9jDXYS"
      "2AeX3illtVRTkrKVh5xR1Mg4WHd0CG2tV4mrh1z3kXi5z_warlk","https://cdn.arageek.com/magazine/2021/04/encyclopedia-%"
      "D9%85%D8%A7-%D9%87%D9%88-%D8%AC%D9%88%D8%AC%D9%84-Google.jpg"

      ,"https://www.google.com/photos/about/static/images/ui/logo-photos.png"];
  int radioIndex=1;
  @override
  Widget build(BuildContext context) {
    return
      Padding(padding: EdgeInsets.only(left: 15,right: 15),
        child: Column(
          children: [
            // Wrap(
            //   children: List<Widget>.generate
            //     (3, (index) =>Padding(padding:EdgeInsets.all(25),
            //   child: CircleAvatar(
            //     radius: 30,
            //     backgroundColor: Colors.blue,
            //     child: CircleAvatar(
            //       radius: 25,
            //       backgroundImage: NetworkImage(
            //         image[index]
            //       ),
            //     ),
            //   ),)),
            // ),
            buildRadioPayment(
              name: "Paypal",
              image: "https://1.bp.blogspot.com/-cg8hqKM6Dkk/YGMqY1Bto6I/AAAAAAAAR"
                  "r8/nUsuBldltO8vRmLe62HJ__GORSXWPKWtgCLcBGAsYHQ/s900/%25D9%2581%25D8%25AA%25"
                  "D8%25AD%2B%25D8%25AD%25D8%25B3%25D8%25A7"
                  "%25D8%25A8%2B%25D8%25A8%25D8%25A7%25D9%258A%2B%25D8%25A8%25D8%25A7%25D9%2584.jpg",
              value: 1,
              scale: .2,
              onChange: (int? value){
                setState(() {
                  radioIndex =value!;
                });
              },
            ),SizedBox(height: 10,),
            buildRadioPayment(
              name: "Google pay",
              image: "https://play-lh.googleusercontent.com/6UgEjh8Xuts4n"
                  "wdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1",
              value: 2,
              scale: .7,
              onChange: (int? value){
                setState(() {
                  radioIndex =value!;
                });
              },
            ),SizedBox(height: 10,),
            buildRadioPayment(
              name: "Paypal",
              image: "https://play-lh.googleusercontent.com/6UgEjh8Xuts4n"
                  "wdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1",
              value: 3,
              scale: .7,
              onChange: (int? value){
                setState(() {
                  radioIndex =value!;
                });
              },
            )
          ],
        ),);
  }
  Widget buildRadioPayment(
      {
        required Function onChange,
        required double scale,
        required String name,
        required int value,
        required String image,


      }
      ){
    return Container
      (
        height: 50,
        width: double.infinity,
        color: Colors.grey[300],
        child: Row(              mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(image,
                  scale: scale,),
                const SizedBox(width: 10,),
                UtiliesText(text: name,
                    fontWeight: FontWeight.bold,
                    fontSize:25 ,
                    color: Colors.black,
                    underLine: TextDecoration.none),


              ],
            ),
            Radio(value: value,
                groupValue: radioIndex,
                fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
                onChanged: (int? value){
                  onChange(value);
                })
          ],
        )

    );
  }
}