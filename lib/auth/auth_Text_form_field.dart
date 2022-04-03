import 'package:flutter/material.dart';
class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  const AuthTextFormField({required this.obscureText,
    required this.controller,
    required this.suffixIcon,
    required this.prefixIcon,
    required this.hintText,
    required this.validator,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      controller: controller ,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,


      validator: (value)=>validator(value),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon,
        suffixIcon:suffixIcon ,

        hintText:hintText,
        hintStyle:
        TextStyle(
            color: Colors.black45,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          ),borderRadius: BorderRadius.circular(10)
        ),focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white
          ),borderRadius: BorderRadius.circular(10)
      ),

      ),
    );
  }
}
