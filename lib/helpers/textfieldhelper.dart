import 'package:flutter/material.dart';
import 'package:stocknews/helpers/colors_helper.dart';

class MyCustomBorder {
  myCustomBorder(BuildContext context) {
    var customDesign = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.5),
      ),
    );
    return customDesign;
  }
}

class MyCustomErrorBorder {
  myCustomErrorBorder(BuildContext context) {
    var customError = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.5),
      ),
    );
    return customError;
  }
}

class FloatingTextStyle {
  floatingStyle(BuildContext context) {
    var label = TextStyle(
      fontFamily: 'Segoe UI',
      fontSize: 16,
      color: leftgradient,
      fontWeight: FontWeight.w600,
    );
    return label;
  }
}

class LabelStyle {
  lebel(BuildContext context) {
    var labelStyle = const TextStyle(
      fontFamily: 'Segoe UI',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    return labelStyle;
  }
}
