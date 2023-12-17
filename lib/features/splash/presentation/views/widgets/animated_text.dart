import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
    required this.slidingFromBottomAnimation,
    required this.text,
  });

  final Animation<Offset> slidingFromBottomAnimation;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingFromBottomAnimation,
      builder: (context, _) => SlideTransition(
        position: slidingFromBottomAnimation,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}