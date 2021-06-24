import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nlw_together/shared/auth/auth_controller.dart';
import 'package:nlw_together/shared/models/user_model.dart';

class LoginController {
  Future<void> googleSignIn(BuildContext context) async {
    final authController = AuthController();
    GoogleSignIn _google = GoogleSignIn(
      scopes: [
        "email",
      ],
    );
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
}
