import 'package:flutter/material.dart';
import 'package:stocknews/helpers/colors_helper.dart';

class AlertBox {
  alertBox(
    BuildContext context,
  ) {
    var alertBox = Future.delayed(
      Duration(seconds: 0),
      () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    leftgradient,
                    rightgradient,
                  ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Register Successfully",
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          color: bgimage,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Click Here",
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 16,
                            color: bgimage,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
    return alertBox;
  }
}
