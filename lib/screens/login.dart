import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:make_jewel/providers/user-provider.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  final TextEditingController _controller = TextEditingController();
  final PhoneNumber phoneNumber = PhoneNumber(isoCode: 'GHA');
  bool isLoading = false;
  String phone = "";
  String verificationId = "";
  bool isValid = false;
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close)),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Continue with Phone",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
                    child: SvgPicture.asset("assets/svgs/otp.svg"),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("REGISTRATION",
                      style: TextStyle(
                          color: Color(0xff9245F5),
                          fontWeight: FontWeight.w700,
                          fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 79),
                      alignment: Alignment.center,
                      child: Text(
                        "Please confirm your country code and enter your phone number.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ))
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: InternationalPhoneNumberInput(
                  spaceBetweenSelectorAndTextField: 0,
                  textFieldController: _controller,
                  initialValue: phoneNumber,
                  onInputValidated: (bool value) {
                    isValid = value;
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  formatInput: false,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  autoValidateMode: AutovalidateMode.disabled,
                  inputBorder: OutlineInputBorder(
                      // borderSide: BorderSide.none
                      ),
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    phone = number.phoneNumber.toString();
                  },
                  onSaved: (PhoneNumber number) {
                    // print("Here");
                    // print(number);
                    // phone = number.phoneNumber.toString();
                    // context
                    //     .read<UserProvider>()
                    //     .phoneAuth(number.phoneNumber.toString());
                  },
                ),
              ),
              isLoading? CircularProgressIndicator() : MaterialButton(
                onPressed: () async {
                  if (isValid) {
                  setState(() {
                    isLoading = true;
                  });
                }
                await context.read<UserProvider>().phoneAuth(phone, context);
                },
                minWidth: MediaQuery.of(context).size.width*.7,
                color: Color(0xff9245F5),
                  padding: EdgeInsets.all(17),
                  // decoration: BoxDecoration(
                  //     color: Color(0xff9245F5),
                  //     borderRadius: BorderRadius.circular(10)),
                  child:Text(
                    "Confirm and Continue",
                    style: TextStyle(color: Colors.white),
                  )
                  // Icon(
                  //   CupertinoIcons.arrow_right,
                  //   color: Colors.white,
                  // ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
