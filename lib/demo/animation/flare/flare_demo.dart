import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlareDemo extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<FlareDemo> {

  final AssetFlare asset = AssetFlare(bundle: rootBundle, name: "assets/anims/Filip.flr");
  final String _animationName = "idle";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flare Demo'),),
      body: Center(child: FlareCacheBuilder(
        [asset],
        builder: (context, isWarm) {
          return !isWarm
              ? const Text("NO")
              : FlareActor.asset(
            asset,
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: _animationName,
          );
        },
      ),),
    );
  }
}
