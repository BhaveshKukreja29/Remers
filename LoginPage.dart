import 'package:flutter/material.dart';
import 'package:reminders/UI elements/animated_text.dart';
import 'package:reminders/UI elements/humraTextfildu.dart';
import 'package:reminders/UI elements/button.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final userEmail = TextEditingController();
  final userPassword = TextEditingController();

  void signUserIn(){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),

              AnimaText(),

              SizedBox(height: 40),

              Myfield(
                controller: userEmail,
                hintText: 'Your email',
                obscureText: false,
              ),

              SizedBox(height: 10),

              Myfield(
                controller: userPassword,
                hintText: 'Password',
                obscureText: true,
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20),

              MyButton(
                onTap: signUserIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
