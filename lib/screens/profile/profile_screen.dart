// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stocknews/helpers/colors_helper.dart';
import 'package:stocknews/helpers/custom_bottombar.dart';
import 'package:stocknews/screens/profile/editprofile.dart';
import 'package:stocknews/theme/themes.dart';
import 'package:stocknews/widget/change_theme_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // bool darkModeSwitch = false;
  // void darkSwitch(bool value) {
  //   if (darkModeSwitch == false) {
  //     setState(() {
  //       darkModeSwitch = true;
  //       log('Dark Mode is ON');
  //     });
  //   } else {
  //     setState(() {
  //       darkModeSwitch = false;
  //       log('Dark Mode is OFF');
  //     });
  //   }
  // }

  final databaseref = FirebaseDatabase.instance.ref().child("Users");
  TextEditingController nameController = TextEditingController();
  var profilepic;
  var username;
  var email;
  void getdata() {
    DatabaseReference key = FirebaseDatabase.instance
        .ref("Users")
        .child(FirebaseAuth.instance.currentUser!.uid);
    key.onValue.listen((event) {
      setState(() {
        username = event.snapshot.child('Name').value.toString();
        profilepic = event.snapshot.child('ProfileImage').value.toString();
        email = event.snapshot.child('Email').value.toString();
      });
    });
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  //signout function
  signOut() async {
    await auth.signOut();
    Get.offAll(const CustomBottomBar());
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textThemeColor =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? 'DarkTheme'
            : 'LightTheme';
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: height / 2.5,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                            begin: const Alignment(-0.902, 0.0),
                            end: const Alignment(1.169, 0.407),
                            colors: [
                              leftgradient,
                              rightgradient,
                            ],
                            stops: const [0.0, 1.0],
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            alignment: Alignment.topLeft,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: bgimage,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 80,
                              left: 30,
                            ),
                            child: SizedBox(
                              child: Container(
                                height: 250,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(29.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditProfile(
                                              image: profilepic,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15, top: 15),
                                          child: Icon(
                                            Icons.edit_note_outlined,
                                            size: 35,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: profilepic == "null"
                                            ? const DecorationImage(
                                                image: AssetImage(
                                                    "assets/noimage.png"),
                                              )
                                            : DecorationImage(
                                                image:
                                                    NetworkImage("$profilepic"),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "$username",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Segoe UI',
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "$email",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Segoe UI',
                                        color: Theme.of(context)
                                            .iconTheme
                                            .color!
                                            .withOpacity(0.5),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 280,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.dark_mode_outlined,
                                  color: Theme.of(context).iconTheme.color,
                                  size: 25,
                                ),
                                Text(
                                  'Dark Mode ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context).iconTheme.color,
                                    fontFamily: 'Segoe UI',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                    height: 15,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(11.0),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xff707070)),
                                    ),
                                    child: const ChangeThemeButtonWidget()),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                          ],
                        ),
                        // Column(
                        //   children: [
                        //     SizedBox(height: 20),
                        //     Padding(
                        //       padding: const EdgeInsets.only(left: 20),
                        //       child: Row(
                        //         children: [
                        //           Icon(
                        //             Icons.settings,
                        //             color: iconColor,
                        //           ),
                        //           SizedBox(width: 45),
                        //           Text(
                        //             "Setting",
                        //             style: TextStyle(
                        //               color: textColor,
                        //               fontFamily: 'Segoe UI',
                        //               fontSize: 18,
                        //               fontWeight: FontWeight.w500,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     Divider(
                        //       color: Colors.grey,
                        //       thickness: 0.5,
                        //     ),
                        //   ],
                        // ),

                        Column(
                          children: [
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: signOut,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  bottom: 10,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.exit_to_app,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    const SizedBox(width: 45),
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        fontSize: 18,
                                        fontFamily: 'Segoe UI',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
