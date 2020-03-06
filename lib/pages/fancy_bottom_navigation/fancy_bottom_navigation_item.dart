
import 'package:flutter/material.dart';

class FancyBottomNavigationItem{
  final IconData icon;
  final String title;

  FancyBottomNavigationItem({@required this.icon, @required this.title}){
    assert(icon!=null);
    assert(title!=null);
  }
}