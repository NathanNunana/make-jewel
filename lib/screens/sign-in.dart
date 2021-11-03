import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:make_jewel/api/google-sign-in-api.dart';
import 'package:make_jewel/screens/landing_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Future _signIn() async {
    GoogleSignInAccount? user = await GoogleSignInApi.login();
    if (user == null) {
      return Scaffold(
        body: Center(
          child: Text("Sign in Failed!"),
        ),
      );
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LandingPage(user: user)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),),
      ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset("assets/images/circular.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Enter your credentials to continue"),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "email",
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "password",
                    border: InputBorder.none,
                  ),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(primary: Color(0xff848484).withOpacity(.55)),
                        onPressed: () {}, child: Text("Forgot password?"))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Theme.of(context).buttonColor),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/landing");
                      }, child: Text("Login"))),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do you have an account?"),
                    TextButton(
                      style: TextButton.styleFrom(primary: Theme.of(context).buttonColor),
                      child: Text("Sign up"),
                      onPressed: (){},
                      // style: TextStyle(
                      //     color: Theme.of(context).buttonColor,
                      //     fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Divider(), Text("Or Sign in With"), Divider()],
                ),
                SizedBox(
                  height: 30,
                ),
                IconButton(
                    onPressed: _signIn,
                    icon: Icon(
                      Icons.facebook,
                      size: 50,
                      color: Colors.blue,
                    ))
              ],
            ),
          ),
        ));
  }
}
