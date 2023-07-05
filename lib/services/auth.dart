import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_login_facebook/flutter_login_facebook.dart";
import "package:google_sign_in/google_sign_in.dart";

class AuthService {
  signinWithGoogle() async {
    //begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    //finaly
    return await FirebaseAuth.instance.signInWithCredential(credential);
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
}
