import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:make_jewel/providers/user-provider.dart';
import 'package:make_jewel/screens/landing_page.dart';
import 'package:make_jewel/screens/login.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    var signIn = context.read<UserProvider>();
    _signIn() async {
      await signIn.signIn();
      GoogleSignInAccount? user = signIn.user;
      if (user == null) {
        return Scaffold(
          body: Center(
            child: Text("Sign in Failed!"),
          ),
        );
      } else {
        print(user);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LandingPage()));
      }
    }

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 1,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(Icons.arrow_back),
      //   ),
      // ),
      backgroundColor: Colors.white,
      body:
          // SingleChildScrollView(
          //   child:
          SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   child: Image.asset("assets/images/circular.png"),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Text(
              //   "Sign In",
              //   style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
              // ),
              // SizedBox(
              //   height: 40,
              // ),
              // Container(
              //   child: Column(
              //     children: [
              //       Text(
              //         "Sign in",
              //         style: TextStyle(
              //             fontSize: 36, fontWeight: FontWeight.w600),
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       Text("Enter your credentials to continue"),
              //       SizedBox(
              //         height: 15,
              //       )
              //     ],
              //   ),
              // ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     filled: true,
              //     labelText: "email",
              //     border: InputBorder.none,
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     filled: true,
              //     labelText: "password",
              //     border: InputBorder.none,
              //   ),
              // ),
              // Container(
              //     alignment: Alignment.centerRight,
              //     child: TextButton(
              //         style: TextButton.styleFrom(
              //             primary: Color(0xff848484).withOpacity(.55)),
              //         onPressed: () {},
              //         child: Text("Forgot password?"))),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //       width: double.infinity,
              //       height: 52,
              //       child: ElevatedButton(
              //           style: ElevatedButton.styleFrom(
              //               primary: Color(0xff9245F5)),
              //           onPressed: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(builder: (_) => LoginWithPhoneNumber()));
              //             // Navigator.pushReplacementNamed(context, "/landing");
              //           },
              //           child: Text("Login"))),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text("Do you have an account?"),
              //     TextButton(
              //       style: TextButton.styleFrom(
              //           primary: Color(0xff9245F5)),
              //       child: Text("Sign up"),
              //       onPressed: () {},
              //       // style: TextStyle(
              //       //     color: Theme.of(context).buttonColor,
              //       //     fontWeight: FontWeight.w600),
              //     )
              //   ],
              // ),
              Container(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade400
                          // Color(0xff9245F5),
                          ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => LoginWithPhoneNumber()));
                        // Navigator.pushReplacementNamed(context, "/landing");
                      },
                      child: Text("Sign in with phone"))),

              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.black45,
                    height: 1,
                    width: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Or Sign in With"),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.black45,
                    height: 1,
                    width: 50,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: _signIn,
                child: Container(
                  width: 50,
                  child:
                      Image.asset("assets/images/glogo.png", fit: BoxFit.cover),
                ),
              ),
              // IconButton(
              //     onPressed: _signIn,
              //     icon: Icon(
              //       Icons.facebook,
              //       size: 50,
              //       color: Colors.blue,
              //     ))
            ],
          ),
        ),
      ),
      // )
    );
  }
}
