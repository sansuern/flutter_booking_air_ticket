import "package:basicflutter/views/otp_screen.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_login_facebook/flutter_login_facebook.dart";
import "package:google_sign_in/google_sign_in.dart";

class AuthService {
  //signin

  signinWithEmail({required context, required email, required password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (error) {
      if (error.code == "wrong-password") {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Wrong password"),
            );
          },
        );
      } else if (error.code == "user-not-found") {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("User not found: $email"),
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Invalid Email: $email"),
            );
          },
        );
      }
    }
  }

  signinWithGoogle() async {
    //begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    //finaly
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signinWithPhoneNumber(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          throw Exception(error);
        },
        codeSent: (verificationId, forceResendingToken) {
          print(verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  signinWithFacebook() async {
    final fb = FacebookLogin();

    // Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    // Check result status
    // switch (res.status) {
    //   case FacebookLoginStatus.success:
    //     // Logged in

    //     // Send access token to server for validation and auth
    //     final FacebookAccessToken accessToken = res.accessToken;
    //     print('Access token: ${accessToken.token}');

    //     // Get profile data
    //     final profile = await fb.getUserProfile();
    //     print('Hello, ${profile.name}! You ID: ${profile.userId}');

    //     // Get user profile image url
    //     final imageUrl = await fb.getProfileImageUrl(width: 100);
    //     print('Your profile image: $imageUrl');

    //     // Get email (since we request email permission)
    //     final email = await fb.getUserEmail();
    //     // But user can decline permission
    //     if (email != null) print('And your email is $email');

    //     break;
    //   case FacebookLoginStatus.cancel:
    //     // User cancel log in
    //     break;
    //   case FacebookLoginStatus.error:
    //     // Log in failed
    //     print('Error while log in: ${res.error}');
    //     break;
    // }
  }

  //sign up

  signupWithEmailAndPassword(
      {required context, required email, required password}) async {
    try {
      FirebaseAuth.instance.signInAnonymously();

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pop(context);
    } on FirebaseAuthException catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(error.message.toString()),
          );
        },
      );
    }
  }
}
