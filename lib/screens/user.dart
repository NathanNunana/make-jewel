import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  Widget _buildListTileItem(String title, Color color, IconData icon) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        ),
        Divider(
          indent: 70,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 50,
              child: Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "hive@email.com",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("+233540209195"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Edit Profile"),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 45),
                  primary: Theme.of(context).buttonColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(children: [
              _buildListTileItem(
                  "Theme", Colors.deepPurple, Icons.nights_stay_rounded),
              _buildListTileItem("About The App", Colors.green, Icons.info),
              _buildListTileItem(
                  "Customer Service", Colors.deepOrange, Icons.headset_mic),
              _buildListTileItem("Settings", Colors.black, Icons.settings),
              _buildListTileItem("logout", Colors.red, Icons.logout)
            ]),
          ),
        ],
      );
  }
}
