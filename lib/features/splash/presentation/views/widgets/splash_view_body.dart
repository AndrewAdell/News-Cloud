import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/errors/util/app_router.dart';
import 'package:news_app/core/errors/util/assets.dart';
import 'sliding_text.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({Key? key}) : super(key: key);

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeInAnimation;
  late Animation<Offset> slidingAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    initAnimations();
    navigateToRegisterView();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FadeTransition(
                  opacity: fadeInAnimation,
                  child: Image.asset(Assets.splashImage,
                  fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SlideTransition(
                  position: slidingAnimation,
                  child: ScaleTransition(
                    scale: scaleAnimation,
                    child: SlidingText(
                      slidingAnimation: slidingAnimation,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void initAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero).animate(
            CurvedAnimation(
                parent: animationController, curve: Curves.easeOut));

    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );

    animationController.forward();
  }

  void navigateToRegisterView() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).push(AppRouter.registerView);
      },
    );
  }
}
