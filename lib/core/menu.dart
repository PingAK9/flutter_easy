import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final List<String> items;
  final IconData icon;

  MenuItem(
      {Key key,
      @required this.title,
      this.items,
      this.icon = Icons.label_important});
}
