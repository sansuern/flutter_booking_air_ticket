import 'package:basicflutter/models/auth.dart';
import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  bool _SignedIn = false;
  bool get isSignedIn => isSignedIn;
}
