import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: signOut,
                icon: Icon(Icons.logout_sharp)
            ),
          ]
      ),
      body: Center(
        child: Text("Ok nice"),
      ),
    );
  }
}
