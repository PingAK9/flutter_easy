import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/pages/fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter_easy/pages/fancy_bottom_navigation/fancy_bottom_navigation_item.dart';
import 'package:flutter_easy/repository/utility/navigation_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationProvider>(context);
    return Scaffold(
      body:homeTap.elementAt(navigation.index),
      bottomNavigationBar: FancyBottomNavigation(
        currentIndex: navigation.index,
        inactiveColor: Colors.black87,
        backgroundColor: Colors.white,
        activeColor: Colors.deepOrange,
        onItemSelected: _onItemTapped,
        items: [
          FancyBottomNavigationItem(
              icon: Icons.home, title: 'Home'),
          FancyBottomNavigationItem(
              icon: Icons.calendar_view_day, title: 'Menu'),
          FancyBottomNavigationItem(
              icon: Icons.collections_bookmark, title: 'Category'),
          FancyBottomNavigationItem(
            icon: Icons.info_outline,
            title: 'Information',
          )
        ],
      ),
    );
  }
  void _onItemTapped(_index) {
    Provider.of<NavigationProvider>(context, listen: false).switchTo(_index);
  }
}
