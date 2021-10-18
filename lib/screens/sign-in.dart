import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:make_jewel/api/google-sign-in-api.dart';
import 'package:make_jewel/screens/landing_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Future _signIn() async{
    GoogleSignInAccount? user = await GoogleSignInApi.login();
    if(user == null){
      return Scaffold(
        body: Center(child: Text("Sign in Failed!"),),
      );
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LandingPage(user: user)));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _signIn,
          child: Text("Sign in with Googles"),
        ),
      ),
    );
  }
}