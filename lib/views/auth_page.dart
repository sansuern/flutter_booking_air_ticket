import 'package:basicflutter/views/home.dart';
import 'package:basicflutter/views/index.dart';
import 'package:basicflutter/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return const Index();
          } else {
            return const LoginPage();
          }
          //user is not logged in
        },
      ),
    );
  }
}
