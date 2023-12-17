import 'package:flutter/material.dart';


class AnimatedImage extends StatelessWidget {
  const AnimatedImage({
    super.key,
    required this.slidingFromTopAnimation,
    required this.image,
  });

  final Animation<Offset> slidingFromTopAnimation;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingFromTopAnimation,
      builder: (context, _) =>  SlideTransition(
        position:slidingFromTopAnimation ,
        child: image
      ),
    );
  }
}