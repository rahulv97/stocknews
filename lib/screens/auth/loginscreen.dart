import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocknews/helpers/colors_helper.dart';
import 'package:stocknews/helpers/custom_bottombar.dart';
import 'package:stocknews/helpers/textfieldhelper.dart';
import 'package:stocknews/screens/auth/registerscreen.dart';
import 'package:stocknews/screens/homepage/homescreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email, _pswd;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
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
                      'Login !',
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
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          child: SizedBox(
                            height: 45,
                            child: TextFormField(
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
                        const SizedBox(height: 50),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red,
                                  ),
                                );
                              },
                            );
                            Future.delayed(const Duration(seconds: 1), () {
                              auth
                                  .signInWithEmailAndPassword(
                                      email: _email.toString(),
                                      password: _pswd.toString())
                                  .then((value) =>
                                      Get.offAll(const CustomBottomBar()));
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
                                "Login",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have a Account ?",
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 18,
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => const SignUpScreen());
                                },
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ],
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
      ),
    );
  }
}
