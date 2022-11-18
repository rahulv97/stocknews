import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stocknews/helpers/colors_helper.dart';
import 'package:stocknews/helpers/custom_background.dart';
import 'package:stocknews/helpers/custom_bottombar.dart';
import 'package:stocknews/helpers/textfieldhelper.dart';
import 'package:stocknews/screens/homepage/homescreen.dart';
import 'package:stocknews/screens/profile/profile_screen.dart';

class EditProfile extends StatefulWidget {
  final image;
  const EditProfile({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? profileimage;

  String imagepath = '';

  Future pickProfileImageCardGallary() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 25);

      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.profileimage = imageTemporary);
      setState(() => imagepath = image.path.split('/').last);
      if (profileimage == null) {
        log("exterior1 empty");
      } else {
        log("exterior1 file $profileimage");
      }
    } catch (e) {
      log("failed with error $e");
    }
  }

  Future pickProfileImageCardCamera() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 25);

      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.profileimage = imageTemporary);
      setState(() => imagepath = image.path.split('/').last);
      if (profileimage == null) {
        log("exterior1 empty");
      } else {
        log("exterior1 file $profileimage");
      }
    } catch (e) {
      log("failed with error $e");
    }
  }

  bool isloading = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final databaseref = FirebaseDatabase.instance.ref().child("Users");

  String? profilepic;

  @override
  void initState() {
    getdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        width: 320,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        content: SizedBox(
                                          height: 82,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CupertinoButton(
                                                  child: Column(
                                                    children: [
                                                      Icon(
                                                        Icons.camera_alt,
                                                        size: 30,
                                                        color: leftgradient,
                                                      ),
                                                      Text(
                                                        "Camera",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Segoe UI',
                                                          fontSize: 16,
                                                          color: leftgradient,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      isloading = false;
                                                      Navigator.pop(context);
                                                      Future.delayed(
                                                          const Duration(
                                                              seconds: 1), () {
                                                        pickProfileImageCardCamera()
                                                            .then((value) {
                                                          setState(() {
                                                            isloading = true;
                                                          });
                                                        });
                                                      });
                                                    });
                                                  }),
                                              CupertinoButton(
                                                  child: Column(
                                                    children: [
                                                      Icon(
                                                        Icons.photo,
                                                        size: 30,
                                                        color: leftgradient,
                                                      ),
                                                      Text(
                                                        "Gallery",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Segoe UI',
                                                          fontSize: 16,
                                                          color: leftgradient,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      isloading = false;
                                                      Navigator.pop(context);
                                                      Future.delayed(
                                                          const Duration(
                                                              seconds: 1), () {
                                                        pickProfileImageCardGallary()
                                                            .then((value) {
                                                          setState(() {
                                                            isloading = true;
                                                          });
                                                        });
                                                      });
                                                    });
                                                  }),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: leftgradient.withOpacity(0.5),
                                          blurRadius: 5)
                                    ]),
                                child: CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.white,
                                    child: ClipOval(child: getImage())),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Change Profile Photo',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: 320,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 45,
                                      child: TextFormField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                          label: Text(
                                            "User Name",
                                            style: LabelStyle().lebel(context),
                                          ),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          floatingLabelStyle:
                                              FloatingTextStyle()
                                                  .floatingStyle(context),
                                          enabledBorder: MyCustomBorder()
                                              .myCustomBorder(context),
                                          focusedBorder: MyCustomBorder()
                                              .myCustomBorder(context),
                                          errorBorder: MyCustomErrorBorder()
                                              .myCustomErrorBorder(context),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    SizedBox(
                                      height: 45,
                                      child: TextFormField(
                                        controller: emailController,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          label: Text(
                                            "Email address",
                                            style: LabelStyle().lebel(context),
                                          ),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          floatingLabelStyle:
                                              FloatingTextStyle()
                                                  .floatingStyle(context),
                                          enabledBorder: MyCustomBorder()
                                              .myCustomBorder(context),
                                          focusedBorder: MyCustomBorder()
                                              .myCustomBorder(context),
                                          errorBorder: MyCustomErrorBorder()
                                              .myCustomErrorBorder(context),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    SizedBox(
                                      height: 45,
                                      child: TextFormField(
                                        controller: phoneController,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          label: Text(
                                            "Mobile No.",
                                            style: LabelStyle().lebel(context),
                                          ),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          floatingLabelStyle:
                                              FloatingTextStyle()
                                                  .floatingStyle(context),
                                          enabledBorder: MyCustomBorder()
                                              .myCustomBorder(context),
                                          focusedBorder: MyCustomBorder()
                                              .myCustomBorder(context),
                                          errorBorder: MyCustomErrorBorder()
                                              .myCustomErrorBorder(context),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Center(
                                      child: SizedBox(
                                        width: 130,
                                        child: CupertinoButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.red,
                                                  ),
                                                );
                                              },
                                            );

                                            Future.delayed(
                                                const Duration(seconds: 1), () {
                                              if (profileimage == null) {
                                                updatedata(
                                                  profilepic!,
                                                  nameController.text,
                                                );
                                              } else {
                                                uploadFile(profileimage!.path);
                                              }
                                              Get.offAll(
                                                  const CustomBottomBar());
                                            });
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Save",
                                                style: TextStyle(
                                                  fontFamily: 'Segoe UI',
                                                  fontSize: 16,
                                                  letterSpacing: 1,
                                                  color: bgimage,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            isloading
                ? Container()
                : Container(
                    color: Colors.transparent,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void getdata() {
    DatabaseReference key = FirebaseDatabase.instance
        .ref("Users")
        .child(FirebaseAuth.instance.currentUser!.uid);
    key.onValue.listen((event) {
      setState(() {
        nameController.text = event.snapshot.child('Name').value.toString();
        phoneController.text = event.snapshot.child('Phone').value.toString();
        emailController.text = event.snapshot.child('Email').value.toString();
        profilepic = event.snapshot.child('ProfileImage').value.toString();
      });
    });
  }

  void updatedata(
    String profileimage,
    String name,
  ) {
    databaseref.child(FirebaseAuth.instance.currentUser!.uid).update({
      'ProfileImage': profileimage,
      'Name': nameController.text,
    });
  }

  Image getImage() {
    Image image;
    if (profileimage == null) {
      if (profilepic == "null") {
        image = Image.asset(
          "assets/noimage.png",
          fit: BoxFit.cover,
          height: 220,
          width: 200,
        );
      } else {
        image = Image.network(
          "$profilepic",
          fit: BoxFit.cover,
          height: 220,
          width: 200,
        );
      }
    } else {
      image = Image.file(
        profileimage!,
        fit: BoxFit.cover,
        height: 220,
        width: 200,
      );
    }
    return image;
  }

  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      var snap = await firebase_storage.FirebaseStorage.instance
          .ref('profilePics/' +
              FirebaseAuth.instance.currentUser!.uid +
              '/profile_pic.png')
          .putFile(file);

      await snap.ref
          .getDownloadURL()
          .then((value) => updatedata(value, nameController.text))
          .onError((error, stackTrace) {
        setState(() {
          //booll = true;
        });
      });
    } catch (e) {
      setState(() {
        //booll = true;
      });
      // e.g, e.code == 'canceled'
    }
  }
}
