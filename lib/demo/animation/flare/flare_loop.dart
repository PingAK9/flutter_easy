import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';

class FlareLoop extends StatefulWidget {
  const FlareLoop(this.fileName, {this.animation});

  final String fileName;
  final String animation;

  @override
  _FlareLoopState createState() => _FlareLoopState();
}

class _FlareLoopState extends State<FlareLoop> implements FlareController {

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      widget.fileName,
      controller: this,
    );
  }

  ActorAnimation _loading;
  double _animationTime = 0;

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _animationTime += elapsed;
    _animationTime %= _loading.duration;
    _loading.apply(_animationTime, artboard, 1.0);
    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    _loading = artboard.getAnimation(widget.animation);
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

  @override
  ValueNotifier<bool> isActive = ValueNotifier<bool>(true);
}
