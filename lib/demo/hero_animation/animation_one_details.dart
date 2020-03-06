import 'dart:io';
import 'package:flutter/material.dart';

class AnimationOneDetails extends StatelessWidget {
  const AnimationOneDetails({Key key, this.index, this.image, this.dummy}) : super(key: key);
  final int index;
final String image;
final Map dummy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
              tag: "image$index",
              child: Image.asset(image, fit: BoxFit.cover)),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               const SizedBox(height: 20.0),
                IconButton(
                  color: Colors.white,
                  icon: Icon(
                      Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                const Spacer(),
                const SizedBox(height: 10.0),
                Hero(
                  tag: "title$index",
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      dummy["title"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Hero(
                  tag: "price$index",
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      dummy['price'],
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
