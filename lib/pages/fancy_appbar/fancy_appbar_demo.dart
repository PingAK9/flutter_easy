import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/pages/fancy_appbar/fancy_appbar.dart';

class FancyAppbarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FancyAppbar(
        title: 'Template floating app bar above a list',
        appbarSetting: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        expandedHeight: 240,
        bigAppbar: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Template floating app bar above a list",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20.0),
              Text(
                "AWESOME",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              )
            ],
          ),
        ),
        children: [1, 2, 3, 4, 5, 6, 7, 8]
            .map((index) => Container(
                  margin: EdgeInsets.all(15),
                  height: 300,
                  width: double.infinity,
                  color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                      .withAlpha(255),
                ))
            .toList());
  }
}
