import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:make_jewel/providers/user-provider.dart';

class OtpScreen extends StatelessWidget {
  _buildTextField() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 9),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String number = context.read<UserProvider>().phone;
    return Scaffold(
        body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(CupertinoIcons.arrow_left)),
            SizedBox(
              width: 50,
            ),
            Text(
              "Verify Phone",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Image.asset("assets/images/verify.png", fit: BoxFit.cover,)),
            SizedBox(
              height: 20,
            ),
            Text(
              "OTP Verification",
              style: TextStyle(
                color: Color(0xff9245F5),
                fontWeight: FontWeight.bold, fontSize: 18),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(6, (index) => _buildTextField()),
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
                  InkWell(
                    onTap: () {
                      context.read<UserProvider>().phoneAuth(number, context);
                    },
                    child: Text(
                      "Request again",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ), // Icon(
            MaterialButton(
                onPressed: () {},
                minWidth: MediaQuery.of(context).size.width * .7,
                color: Color(0xff9245F5),
                padding: EdgeInsets.all(17),
                // decoration: BoxDecoration(
                //     color: Color(0xff9245F5),
                //     borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Verify and Continue",
                  style: TextStyle(color: Colors.white),
                )
                // Icon(
                //   CupertinoIcons.arrow_right,
                //   color: Colors.white,
                // ),
                )
          ],
        ),
      ]),
    ));
  }
}
