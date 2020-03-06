import 'dart:math';

import 'package:flutter/material.dart';

class HomeCoverTop extends StatefulWidget {
  const HomeCoverTop(this.heightBanner);

  final double heightBanner;

  @override
  _HomeCoverTopState createState() => _HomeCoverTopState();
}

class _HomeCoverTopState extends State<HomeCoverTop> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomArcClip(),
      child: Container(
          height: widget.heightBanner,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/banner/flutter-banner.png'),
            fit: BoxFit.cover,
          )),
          child: Container(
            padding: const EdgeInsets.only(left: 20, bottom: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const <Widget>[Text('Xin chào!')],
            ),
          )),
    );
  }
}

class CustomArcClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final rect = Rect.fromCircle(
        center: Offset(size.width / 2,  - size.height / 2), radius: size.height * 1.5);
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, 100)
      ..arcTo(rect, pi, -pi, false)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
