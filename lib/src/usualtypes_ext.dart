import 'package:flutter/material.dart';

/*
 this File clone from repo :https://github.com/seyf1elislam
*/
extension StringExtensions on String {
  String cutString(maxLen) {
    if (length >= maxLen) {
      return "${substring(0, maxLen)}...";
    } else {
      return this;
    }
  }

  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }

  // ...more here
}

extension IntegerExt on int {
  Widget get height {
    return SizedBox(height: toDouble());
  }

  Widget get width {
    return SizedBox(width: toDouble());
  }
  //more here
}
// //?Usage example
// 10.height //this will return Sized box with height 10
// 10.width //this will return Sized box with width 10

extension DoubleExt on double {
  Widget height() {
    return SizedBox(
      height: this,
    );
  }
}
