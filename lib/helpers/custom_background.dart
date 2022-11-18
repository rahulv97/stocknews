// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocknews/helpers/colors_helper.dart';
import 'package:stocknews/screens/auth/loginscreen.dart';
import 'package:stocknews/screens/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class CustomBackground extends StatefulWidget {
  const CustomBackground({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBackground> createState() => _CustomBackgroundState();
}

class _CustomBackgroundState extends State<CustomBackground> {
  bool home = true;
  bool topMarket = false;

  final databaseref = FirebaseDatabase.instance.ref().child("Users");
  TextEditingController nameController = TextEditingController();
  var profilepic;
  var username;
  void getdata() async {
    DatabaseReference key =
        databaseref.child(FirebaseAuth.instance.currentUser!.uid);
    key.onValue.listen((event) {
      setState(() {
        username = event.snapshot.child('Name').value.toString();
        profilepic = event.snapshot.child('ProfileImage').value.toString();
      });
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: height / 4.5,
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
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: InkWell(
                      onTap: () {
                        if (FirebaseAuth.instance.currentUser == null) {
                          Get.to(() => const LoginPage());
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        alignment: Alignment.topLeft,
                        decoration: FirebaseAuth.instance.currentUser == null
                            ? const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/noimage.png"),
                                ),
                              )
                            : BoxDecoration(
                                shape: BoxShape.circle,
                                image: profilepic == "null"
                                    ? const DecorationImage(
                                        image: AssetImage("assets/noimage.png"),
                                      )
                                    : DecorationImage(
                                        image: NetworkImage("$profilepic"),
                                        fit: BoxFit.cover),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: FirebaseAuth.instance.currentUser == null
                                ? Text(
                                    "",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: bgimage,
                                      fontFamily: 'Segoe UI',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                : username == null
                                    ? SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1.5,
                                          color: rightgradient,
                                        ),
                                      )
                                    : Text(
                                        "$username",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: bgimage,
                                          fontFamily: 'Segoe UI',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                          ),
                        ),
                        const SizedBox(width: 50),
                        Container(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.search,
                                color: bgimage,
                                size: 25,
                              ),
                              const SizedBox(width: 20),
                              Icon(
                                Icons.notifications_outlined,
                                color: bgimage,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90, left: 50),
              child: Container(
                height: 50,
                width: 254,
                decoration: BoxDecoration(
                  color: bgimage,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 127,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: home
                            ? leftgradient.withOpacity(0.3)
                            : Colors.transparent,
                        elevation: 0,
                        onPressed: () {
                          setState(() {
                            home = true;
                            topMarket = false;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              home ? Icons.home : Icons.home,
                              color: home ? leftgradient : Colors.black,
                            ),
                            Text(
                              home ? "Home" : "Home",
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                color: home ? leftgradient : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 127,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: topMarket
                            ? leftgradient.withOpacity(0.3)
                            : Colors.transparent,
                        elevation: 0,
                        onPressed: () {
                          setState(() {
                            topMarket = true;
                            home = false;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              topMarket
                                  ? Icons.stacked_line_chart_rounded
                                  : Icons.stacked_line_chart_rounded,
                              color: topMarket ? leftgradient : Colors.black,
                            ),
                            Text(
                              topMarket ? "Top Market" : "Top Market",
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                color: topMarket ? leftgradient : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
