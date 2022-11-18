import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocknews/helpers/colors_helper.dart';
import 'package:stocknews/helpers/textfieldhelper.dart';
import 'package:stocknews/screens/auth/loginscreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  TextEditingController cnfrmpswdController = TextEditingController();

  String? _email, _pswd;

  final auth = FirebaseAuth.instance;

  final databaseref = FirebaseDatabase.instance.ref();
  final imagesend = FirebaseStorage.instance;

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
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    'Sign up !',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 33,
                      color: bgimage,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  width: 320,
                  decoration: BoxDecoration(
                    color: bgimage,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(top: 10, left: 10),
                              hintText: 'Full Name',
                              hintStyle: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.3),
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder:
                                  MyCustomBorder().myCustomBorder(context),
                              focusedBorder:
                                  MyCustomBorder().myCustomBorder(context),
                              errorBorder: MyCustomErrorBorder()
                                  .myCustomErrorBorder(context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(top: 10, left: 10),
                              hintText: 'Mobile',
                              hintStyle: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.3),
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder:
                                  MyCustomBorder().myCustomBorder(context),
                              focusedBorder:
                                  MyCustomBorder().myCustomBorder(context),
                              errorBorder: MyCustomErrorBorder()
                                  .myCustomErrorBorder(context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: SizedBox(
                          height: 45,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            onChanged: (value) {
                              setState(() {
                                _email = value.trim();
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(top: 10, left: 10),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.3),
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder:
                                  MyCustomBorder().myCustomBorder(context),
                              focusedBorder:
                                  MyCustomBorder().myCustomBorder(context),
                              errorBorder: MyCustomErrorBorder()
                                  .myCustomErrorBorder(context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: pswdController,
                            onChanged: (value) {
                              setState(() {
                                _pswd = value.trim();
                              });
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(top: 10, left: 10),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.3),
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder:
                                  MyCustomBorder().myCustomBorder(context),
                              focusedBorder:
                                  MyCustomBorder().myCustomBorder(context),
                              errorBorder: MyCustomErrorBorder()
                                  .myCustomErrorBorder(context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: cnfrmpswdController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(top: 10, left: 10),
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.3),
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder:
                                  MyCustomBorder().myCustomBorder(context),
                              focusedBorder:
                                  MyCustomBorder().myCustomBorder(context),
                              errorBorder: MyCustomErrorBorder()
                                  .myCustomErrorBorder(context),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                color: Colors.transparent,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red,
                                  ),
                                ),
                              );
                            },
                          );
                          Future.delayed(const Duration(seconds: 1), () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: leftgradient.withOpacity(0.3),
                                shape: const StadiumBorder(),
                                behavior: SnackBarBehavior.floating,
                                width: 180,
                                duration: const Duration(milliseconds: 700),
                                content: const Text(
                                  "Register Sucessfully",
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }).then((value) {
                            Future.delayed(const Duration(seconds: 1), () {
                              if (nameController.text.isNotEmpty &&
                                  phoneController.text.isNotEmpty &&
                                  emailController.text.isNotEmpty &&
                                  pswdController.text.isNotEmpty &&
                                  cnfrmpswdController.text.isNotEmpty) {
                                auth
                                    .createUserWithEmailAndPassword(
                                        email: _email.toString(),
                                        password: _pswd.toString())
                                    .then((value) {
                                  insertdata(
                                    nameController.text,
                                    phoneController.text,
                                    emailController.text,
                                    pswdController.text,
                                    cnfrmpswdController.text,
                                  );
                                  Get.off(const LoginPage());
                                });
                              }
                            });
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 16,
                                color: bgimage,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void insertdata(
      String name, String phone, String email, String pswd, String cnfrmpswd) {
    databaseref
        .child("Users")
        .child(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'Id': FirebaseAuth.instance.currentUser!.uid,
      'Name': nameController.text,
      'Phone': phoneController.text,
      'Email': emailController.text,
      'Password': pswdController.text,
      'ConfirmPassword': cnfrmpswdController.text,
      'ProfileImage': ''
    });
  }
}
