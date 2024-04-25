import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final void Function()? onTap;
  final String bolText;

  const MyButton({
    super.key,
    required this.onTap,
    required this.bolText,
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30.0)),
        child: Center(
          child: Text(
            bolText,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
