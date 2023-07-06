import 'package:basicflutter/views/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import '../login.dart';

class TestOTP extends StatelessWidget {
  const TestOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IELTS Speaking',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.grey),
        ),
        snackBarTheme: const SnackBarThemeData(
          actionTextColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData.dark(), // standard dark theme
      themeMode: ThemeMode.system,
      // theme: ThemeData.dark(),
      home: const AuthPage(),
    );
  }
}
