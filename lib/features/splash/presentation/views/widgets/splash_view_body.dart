import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../../../const.dart';
import '../../../../../core/utils/services/app_router.dart';
import '../../../../../core/utils/assets.dart';
import 'animated_image.dart';
import 'animated_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingFromBottomAnimation;
  late Animation<Offset> slidingFromTopAnimation;
  late CurvedAnimation curvedAnimation =
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedImage(
          slidingFromTopAnimation: slidingFromTopAnimation,
          image: Image.asset(AssetsData.logo),
        ),
        const SizedBox(height: 12),
        AnimatedText(
            slidingFromBottomAnimation: slidingFromBottomAnimation,
            text: 'Read Free Books '),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: kTranstionDuration,
    );
    slidingFromBottomAnimation =
        Tween(begin: const Offset(0, 4), end: Offset.zero)
            .animate(curvedAnimation);

    slidingFromTopAnimation =
        Tween(begin: const Offset(0, -1), end: Offset.zero)
            .animate(curvedAnimation);

    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void navigateToHome() {
    Future.delayed(const Duration(milliseconds: 2020), () {
      //Get.to(() => const HomeView(), transition: Transition.fadeIn);

      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
