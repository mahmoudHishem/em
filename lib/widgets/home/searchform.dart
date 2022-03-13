import 'package:flutter/material.dart';

class SearchFormText extends StatelessWidget {
  const SearchFormText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.red,
        prefixIcon: Icon(Icons.search,color: Colors.grey,),filled: true,
        hintText: 'Search you are looking for',hintStyle: TextStyle(
        color: Colors.black45,
        fontSize: 16,
        fontWeight: FontWeight.w500
      ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10))
        
      ),
    );
  }
}
