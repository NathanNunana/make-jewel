import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:make_jewel/providers/user-provider.dart';

class UserPage extends StatelessWidget {
  Widget _buildListTileItem(String title, Color color, IconData icon) {
    print("Here ${FirebaseAuth.instance.currentUser!.email.toString()}");
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
    GoogleSignInAccount? user = context.read<UserProvider>().user;
    print("This is the user: $user");
    User? fuser = FirebaseAuth.instance.currentUser;
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        CircleAvatar(
            backgroundColor: Colors.grey[500],
            radius: 50,
            backgroundImage: (fuser == null)
                ? NetworkImage(
                    user!.photoUrl.toString(),
                  )
                : (fuser.photoURL != null)
                    ? NetworkImage(
                        fuser.photoURL.toString(),
                      )
                    : null,
            child: (user == null)
                ? Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.white,
                  )
                : Container()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              (user != null)
                  ? Text(
                      (user.displayName == null)
                          ? "..."
                          : user.displayName.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    )
                  : (fuser != null)? Text(
                      (fuser.displayName == null)
                          ? "New User"
                          : fuser.displayName.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ):Container(),
              SizedBox(
                height: 5,
              ),
              (user != null)
                  ? Text(
                      user.email.toString(),
                      // user!.email
                    )
                  : (fuser != null)
                      ? Text((fuser.email == null)
                              ? "name@makejewel.com"
                              : fuser.email.toString()
                          // user!.email
                          )
                      : Container(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Edit Profile"),
            style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 45), primary: Color(0xff9245F5)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView(children: [
            // _buildListTileItem(
            //     "Theme", Colors.deepPurple, Icons.nights_stay_rounded),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/about-app");
                },
                child: _buildListTileItem(
                    "About The App", Colors.green, Icons.info)),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/my-shop");
              },
              child:
                  _buildListTileItem("My Shop", Colors.deepOrange, Icons.store),
            ),
            _buildListTileItem("Settings", Colors.black, Icons.settings),
            GestureDetector(
                onTap: () {
                  (fuser == null)
                      ? context.read<UserProvider>().signOut()
                      : FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, "/");
                },
                child: _buildListTileItem("logout", Colors.red, Icons.logout))
          ]),
        ),
      ],
    );
  }
}
