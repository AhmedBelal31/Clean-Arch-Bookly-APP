import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.errorImageAspectRatio,
  });

  final String imageUrl;
  final double errorImageAspectRatio;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.fill,
      errorWidget: (context, url, error) => ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: AspectRatio(
          aspectRatio: errorImageAspectRatio,
          child: Image.asset(
            'assets/images/No-Image-Placeholder.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
