import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(
      'assets/images/lottieloading.json',
      height: MediaQuery.of(context).size.height * 0.3,
      fit: BoxFit.fill,
    ));
  }
}
