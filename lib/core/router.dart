import 'package:flutter/material.dart';
import 'package:flutter_easy/pages/home_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    /// add settings on MaterialPageRoute for which route you want to tracking
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomePage(), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: Text('404 ${settings.name} not found'),
                  ),
                ));
    }
  }

  static String getNameExtractor(RouteSettings settings) {
    /// User for override route's name
    switch (settings.name) {
      case '/':
        return null;
      default:
        return settings.name;
    }
  }
}
