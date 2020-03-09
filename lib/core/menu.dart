import 'package:flutter/material.dart';

class MenuItem {
  const  MenuItem({this.title, this.items, this.icon = Icons.label_important});
  final String title;
  final List<String> items;
  final IconData icon;
}

class Category {
  const  Category({this.title, this.icon, this.router = '/not-set'});

  final String title;
  final IconData icon;
  final String router;
}
