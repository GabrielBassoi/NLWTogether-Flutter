import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nlw_together/shared/auth/auth_controller.dart';
import 'package:nlw_together/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();
  final githubController = FirebaseAuthOAuth();
  GoogleSignIn _google = GoogleSignIn(
    scopes: [
      "email",
    ],
  );
  Future<void> googleSignIn(BuildContext context) async {
    try {
      final response = await _google.signIn();
      final user = UserModel(
        name: response!.displayName!,
        photoURL: response.photoUrl,
      );
      authController.setUser(context, user);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<void> googleLogOut(BuildContext context) async {
    try {
      await _google.signOut();
      authController.logOut();
      Navigator.pushReplacementNamed(context, "/login");
    } catch (e) {
      print(e);
    }
  }

  Future<void> githubLogin(BuildContext context) async {
    try {
      var response = await githubController.openSignInFlow(
        "github.com",
        ["user:email"],
        {"lang": "br"},
      );
      final user = UserModel(
        name: response!.email!.substring(0, response.email!.length - 10),
        photoURL: response.photoURL,
      );
      authController.setUser(context, user);
    } on PlatformException catch (error) {
      debugPrint("${error.code}: ${error.message}");
    }
  }
}
