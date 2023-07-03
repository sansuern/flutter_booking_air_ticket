import 'package:basicflutter/models/auth.dart';
import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  //ชื่อสมาชิก  , password, วันที่
  List<Auth> auth = [
    Auth(username: "demo", password: "demo", date: DateTime.now()),
    Auth(username: "demo2", password: "demo2", date: DateTime.now()),
    Auth(username: "demo3", password: "demo3", date: DateTime.now()),
  ];

  List<Auth> getAuth() {
    return auth;
  }
}
