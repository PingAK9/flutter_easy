import 'dart:ui';

import 'package:flare_flutter/asset_provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy/core/config.dart';
import 'package:flutter_easy/demo/animation/flare/flare_loop.dart';
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
                  icon: Icon(
                    Entypo.wallet,
                    size: 28,
                    color: Colors.white,
                  ),
                  color: Colors.lightBlueAccent,
                ),
                RoundedButton(
                  title: 'Scanner',
                  onItemTapped: () {},
                  icon: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: FlareLoop(
                      'assets/anims/scan.flr',
                      animation: "scan",
                    ),
                  ),
                  color: Colors.yellow[300],
                ),
                RoundedButton(
                  title: 'My Voucher',
                  onItemTapped: () {},
                  icon: Icon(
                    MaterialCommunityIcons.ticket_percent,
                    size: 26,
                    color: Colors.white,
                  ),
                  color: Colors.redAccent,
                ),
                RoundedButton(
                  title: 'My pocket',
                  onItemTapped: () {},
                  icon: Icon(
                    FontAwesome.shopping_basket,
                    size: 24,
                    color: Colors.white,
                  ),
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
  final Widget icon;
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
                child: icon),
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
