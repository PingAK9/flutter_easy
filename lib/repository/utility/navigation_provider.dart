import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easy/demo/account_profile.dart';
import 'package:flutter_easy/pages/fancy_appbar/fancy_appbar_demo.dart';
import 'package:flutter_easy/pages/home/home_view.dart';
import 'package:flutter_easy/pages/sliver_appbar/sliver_appbar_demo.dart';

class NavigationProvider extends ChangeNotifier {
  int index = 0;

  final StreamController reTap = StreamController<int>.broadcast();

  void switchTo(int value) {
    if (index != value) {
      index = value;
      notifyListeners();
    } else {
      reTap.add(index);
    }
  }
}

enum PageName { home, category, schedule, game, account }

List<Widget> homeTap = [
  HomeView(),
  SliverAppbarDemo(),
  FancyAppbarDemo(),
  AccountProfile(),
];
