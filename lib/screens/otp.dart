import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:make_jewel/providers/user-provider.dart';

class OtpScreen extends StatefulWidget {
  final String? verificationId;
  // final FirebaseAuth? auth;
  OtpScreen({this.verificationId});
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _controller = TextEditingController();
  bool isLoading = false;

  Future<void> _signIn() async {
    setState(() {
      isLoading = true;
    });
    print("Credential: ${widget.verificationId}");

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId.toString(),
        smsCode: _controller.text);
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => Navigator.pushReplacementNamed(context, "/landing"));
    print(credential);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _controller.text = context.read<UserProvider>().smsCode;
  // }

  @override
  Widget build(BuildContext context) {
    String number = context.read<UserProvider>().phone;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.all(20),
                // width: 150,
                child: Image.asset(
                  "assets/images/otp.gif",
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              "OTP Verification",
              style: TextStyle(
                  color: Color(0xff9245F5),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter the OTP Code sent to $number",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: PinCodeTextField(
                controller: _controller,
                appContext: context,
                length: 6,
                onChanged: (String code) {},
                // obscuringCharacter: "*",
                animationType: AnimationType.fade,
                blinkWhenObscuring: true,
                // obscureText: true,
                enableActiveFill: false,
                keyboardType: TextInputType.number,
                pastedTextStyle: TextStyle(
                    color: Colors.green.shade600, fontWeight: FontWeight.bold),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  fieldHeight: 50,
                  fieldWidth: 40,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code? ",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<UserProvider>().phoneAuth(number, context);
                    },
                    child: Text(
                      "Request again",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ), // Icon(
            (isLoading)
                ? CircularProgressIndicator()
                : MaterialButton(
                    onPressed: _signIn,
                    minWidth: MediaQuery.of(context).size.width * .7,
                    color: Color(0xff9245F5),
                    padding: EdgeInsets.all(17),
                    child: Text(
                      "Verify and Continue",
                      style: TextStyle(color: Colors.white),
                    ))
          ],
        ),
      ),
    ));
  }
}
