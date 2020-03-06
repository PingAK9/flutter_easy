import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easy/core/config.dart';
import 'package:flutter_easy/demo/scan/scan_view.dart';
import 'package:flutter_easy/pages/block/block_shadow.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation();

  @override
  Widget build(BuildContext context) {
    return BlockShadow(
      color: Colors.white,
      margin: EdgeInsets.only(
          left: defaultPadding, right: defaultPadding, bottom: defaultPadding),
      padding: const EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.black.withAlpha(125),
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Hồ Chí Minh',
                  style: Theme.of(context).textTheme.body2,
                ),
                Icon(MaterialCommunityIcons.map_marker_radius, size: 20),
              ],
            ),
          ),
          Container(
            height: 100,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RoundedButton(
                  title: 'Wallet',
                  onItemTapped: () {},
                  icon: Entypo.wallet,
                  color: Colors.yellow,
                ),
                RoundedButton(
                  title: 'Scanner',
                  onItemTapped: () {
                  },
                  icon: MaterialCommunityIcons.barcode_scan,
                  color: Colors.lightBlueAccent,
                ),
                RoundedButton(
                  title: 'My Voucher',
                  onItemTapped: () {},
                  icon: MaterialCommunityIcons.ticket_percent,
                  color: Colors.redAccent,
                ),
                RoundedButton(
                  title: 'My pocket',
                  onItemTapped: () {},
                  icon: FontAwesome.shopping_basket,
                  color: Colors.orange,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    @required this.icon,
    @required this.title,
    @required this.onItemTapped,
    this.color = Colors.grey,
  });

  final String title;
  final IconData icon;
  final Color color;
  final GestureTapCallback onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: onItemTapped,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 26,
                )),
            const SizedBox(height: 10),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
