import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:make_jewel/screens/otp.dart';

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

  smsGetter(String sms) {
    smsCode = sms;
    notifyListeners();
  }

  snackBar(String? message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  String verificationId = "";
  String phone = "";
  Future<void> phoneAuth(String number, context) async {
    phone = number;
    try {
      var _auth = FirebaseAuth.instance;
      await _auth.verifyPhoneNumber(
        phoneNumber: number,
        timeout: Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          smsCode = credential.smsCode.toString();
          User? user = _auth.currentUser;
          if (smsCode.isNotEmpty) {
            try {
              UserCredential cred = await user!.linkWithCredential(credential);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'provider-already-linked') {
                await _auth.signInWithCredential(credential);
              }
            }
          }
          // await _auth.signInWithCredential(credential);
          print("verification complete! ${credential.smsCode}");

          Navigator.pushNamedAndRemoveUntil(
              context, "/landing", (route) => false);
          print(smsCode);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          String smsCode = "555555";
          print("vCode: $verificationId");
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);
          smsGetter(smsCode);
          if(smsCode.isNotEmpty)
          await Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      OtpScreen(credential: credential, auth: _auth)), (route) => false);
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
