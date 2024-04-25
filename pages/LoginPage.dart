import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reminders/UI elements/animated_text.dart';
import 'package:reminders/UI elements/humraTextfildu.dart';
import 'package:reminders/UI elements/button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Add this line

  void signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail.text,
        password: userPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EmailNotThere();
      } else if (e.code == 'wrong-password') {
        WrongPassword();
      }
    }
  }

  void EmailNotThere() {
    showDialog(
      context: _scaffoldKey.currentContext, // Change this line
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  void WrongPassword() {
    showDialog(
      context: _scaffoldKey.currentContext, // Change this line
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              AnimaText(),

              const SizedBox(height: 40),

              Myfield(
                controller: userEmail,
                hintText: 'Your email',
                obscureText: false,
              ),

              const SizedBox(height: 15),

              Myfield(
                controller: userPassword,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 15),

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

              const SizedBox(height: 20),

              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(
                        thickness: 2.5,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                          "Or Continue With",
                        style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                      ),
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 2.5,
                    ),
                  ),
                    ],
                  ),
              const SizedBox(height: 45),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/images/google_light.png',
                    height: 70,
                  )
                ],
              ),
              const SizedBox(height: 30),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?  ",
                    style: TextStyle(
                        fontSize: 15
                    ),
                  ),
                  Text(
                    "Register Now!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

