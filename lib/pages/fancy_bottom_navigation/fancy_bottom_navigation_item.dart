
import 'package:flutter/material.dart';

class FancyBottomNavigationItem{
  FancyBottomNavigationItem({@required this.icon, @required this.title}):
    assert(icon!=null),
    assert(title!=null);


  final IconData icon;
  final String title;
}