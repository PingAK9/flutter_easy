import 'package:flutter/material.dart';

ThemeData get appTheme => ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
      accentColor: Colors.green,
      backgroundColor: Colors.lightBlue[50],
      appBarTheme: AppBarTheme(
        color: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.black54),
        iconTheme: IconThemeData(color: Colors.black54),
        textTheme: TextTheme(
          title: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black54),
        ),
      ),
      buttonColor: Colors.green,
      buttonTheme: const ButtonThemeData(
        height: 40,
        shape: StadiumBorder(),
        buttonColor: Colors.green,
        textTheme: ButtonTextTheme.accent,
      ),
    );
