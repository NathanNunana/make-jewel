import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserProvider extends ChangeNotifier{
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future<GoogleSignInAccount?> logout() => _googleSignIn.disconnect();
  GoogleSignInAccount? user;
  signIn() async {
    user = await login();
  }
  signOut(){
    logout();
  }
  notifyListeners();
}