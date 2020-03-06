import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utility {
  static String formatPrice(dynamic number) {
    final oCcy = NumberFormat("#,###", "en_US");
    if (number is String) {
      if (number.toString().isNotEmpty) {
        final value = int.parse(number);
        return oCcy.format(value);
      } else {
        return '';
      }
    } else {
      return oCcy.format(number);
    }
  }

  static void showSnackBar(
      GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }
}
