import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFunction {
  static void showSnackBar({required String title, required String message, SnackPosition? snackPosition}) {
    Get.snackbar(
      title,
      message,
      snackPosition: snackPosition ?? SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      borderRadius: 8,
      backgroundColor: title.toLowerCase().contains('success') ? Colors.green : Colors.red,
      animationDuration: const Duration(milliseconds: 900),
      barBlur: 10,
      colorText: Colors.white,
      isDismissible: false,
    );
  }

  static Future<DateTime?> pickDate() async {
    DateTime? date;
    await showDatePicker(
            context: Get.context!, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2120))
        .then((pickedDate) {
      if (pickedDate == null) {
        return null;
      } else {
        date = pickedDate;
      }
    });
    return date;
  }

  static BorderRadius roundedShapeOnly({double? topLeft, double? bottomLeft, double? topRight, double? bottomRight}) {
    return BorderRadius.only(
        topLeft: topLeft == null ? const Radius.circular(0) : Radius.circular(topLeft),
        bottomLeft: bottomLeft == null ? const Radius.circular(0) : Radius.circular(bottomLeft),
        topRight: topRight == null ? const Radius.circular(0) : Radius.circular(topRight),
        bottomRight: bottomRight == null ? const Radius.circular(0) : Radius.circular(bottomRight));
  }

  static BorderRadius roundedShapeAll(double radius) {
    return BorderRadius.all(Radius.circular(radius));
  }

  static RoundedRectangleBorder roundedRectangleBorderAll(double radius) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    );
  }

  static RoundedRectangleBorder roundedRectangleBorderOnly(
      {double? topLeft, double? bottomLeft, double? topRight, double? bottomRight}) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: topLeft == null ? const Radius.circular(0) : Radius.circular(topLeft),
          bottomLeft: bottomLeft == null ? const Radius.circular(0) : Radius.circular(bottomLeft),
          topRight: topRight == null ? const Radius.circular(0) : Radius.circular(topRight),
          bottomRight: bottomRight == null ? const Radius.circular(0) : Radius.circular(bottomRight)),
    );
  }
}
