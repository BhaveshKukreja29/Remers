import 'package:flutter/material.dart';

class Myfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;


  Myfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
                borderRadius: BorderRadius.circular(15.0)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black87),
                borderRadius: BorderRadius.circular(15.0)
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500)
          )
        ),
      );
  }
}
