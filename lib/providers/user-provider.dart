import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserProvider extends ChangeNotifier {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future<GoogleSignInAccount?> logout() => _googleSignIn.disconnect();
  GoogleSignInAccount? user;
  signIn() async {
    user = await login();
  }

  signOut() {
    logout();
  }

  String smsCode = "";
  String verificationId = "";
  String phone = "";
  Future<void> phoneAuth(String number, context) async {
    phone = number;
    try {
      var _auth = FirebaseAuth.instance;
      await _auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          print("verification complete! ${credential.smsCode}");
          smsCode = credential.smsCode.toString();
          Navigator.pushNamedAndRemoveUntil(context, "/otpscreen", (route) => false);
          print(smsCode);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          String smsCode = "xxx";
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);
          await _auth.signInWithCredential(credential);
          print(credential);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print("This is the error: $e");
    }

    notifyListeners();
  }
  // notifyListeners();
}
