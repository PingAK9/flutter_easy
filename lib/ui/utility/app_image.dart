import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  AppImage(this.url,
      {this.fit = BoxFit.cover, this.heightPlaceHolder, this.widthPlaceHolder});

  final String url;
  final BoxFit fit;
  final double heightPlaceHolder;
  final double widthPlaceHolder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      placeholder: (context, url) => _buildPlaceHolder(),
      errorWidget: (context, url, error) => _buildPlaceHolder(),
    );
  }

  Widget _buildPlaceHolder() {
    return Container(
      height: heightPlaceHolder,
      width: widthPlaceHolder,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: FractionallySizedBox(
        widthFactor: 0.5,
        heightFactor: 0.5,
        child: Image.asset('assets/images/ui/hp_photos.png'),
      ),
    );
  }
}
