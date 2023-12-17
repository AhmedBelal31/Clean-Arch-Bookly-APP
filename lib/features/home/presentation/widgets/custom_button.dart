import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final BorderRadius? borderRadius;
  final Function() onPressed;

  final Color backgroundColor;

  final Color textColor;

  final String text;

  const CustomButton({
    super.key,
    this.borderRadius,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.all(14.0),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Styles.textStyle16.copyWith(
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
