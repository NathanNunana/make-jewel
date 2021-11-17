import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text("About"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: RichText(
              text: TextSpan(
                  text: "Make",
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(
                      text: "Jewel",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ]),
            ),
          ),
          Divider(),
          ListTile(
            leading: Text(
              "Version:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: Text("1.0.1"),
          ),
          Divider()
        ],
      ),
    );
  }
}
