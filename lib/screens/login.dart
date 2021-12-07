import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginWithPhoneNumber extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final PhoneNumber number = PhoneNumber(isoCode: 'GHA');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(CupertinoIcons.arrow_right),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
                    child: SvgPicture.asset("assets/svgs/otp.svg"),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 79),
                      alignment: Alignment.center,
                      child: Text(
                        "You'll receive a 4 digit code to verify next.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ))
                ],
              ),
              // SizedBox(height: 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: InternationalPhoneNumberInput(
                  textFieldController: _controller,
                  initialValue: number,
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  formatInput: false,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  autoValidateMode: AutovalidateMode.disabled,
                  // inputDecoration: InputDecoration(
                  //   filled: true,

                  // ),
                  inputBorder: OutlineInputBorder(
                      // borderSide: BorderSide.none
                      ),
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
              // SizedBox(height: 50),
              Container(
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                    color: Color(0xff9245F5), shape: BoxShape.circle),
                child: Icon(
                  CupertinoIcons.arrow_right,
                  color: Colors.white,
                ),
              )
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              //   child: TextField(
              //     keyboardType: TextInputType.number,
              //     decoration: InputDecoration(
              //       filled: true,
              //       label: Text("Enter your phone"),
              //       suffix: Container(
              //         padding: EdgeInsets.all(20),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             color: Color(0xff9245F5)),
              //         child: Text(
              //           "Continue",
              //           style: TextStyle(
              //               color: Colors.white, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide.none),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
