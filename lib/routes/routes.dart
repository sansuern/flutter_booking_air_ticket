import 'package:basicflutter/views/home.dart';
import 'package:basicflutter/views/index.dart';
import 'package:flutter/material.dart';

import 'package:basicflutter/views/login.dart';

import '../views/test.dart';

class AppRoutes {
  static const index = "index";
  static const login = "login";
  static const test = "test";

  static get all => <String, WidgetBuilder>{
        login: (context) => const LoginPage(),
        index: (context) => const Index(),
        test: (context) => const TestPage(),
      };
}
