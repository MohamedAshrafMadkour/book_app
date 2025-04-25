import 'package:book_app/core/utils/go_router.dart';

import 'package:book_app/feature/splash/presentation/views/widgets/animation_builder.dart';
import 'package:book_app/feature/splash/presentation/views/widgets/book_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<Offset> slidingAnimation2;
  @override
  void initState() {
    super.initState();
    buildAnimationController();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      navigationToHome();
    });
  }

  void navigationToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        (context).go(RouterNavigation.kHomeView);
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BookAnimation(slidingAnimation: slidingAnimation2),
        AnimationBuilder(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void buildAnimationController() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 13),
      end: Offset.zero,
    ).animate(animationController);
    slidingAnimation2 = Tween<Offset>(
      begin: const Offset(0, -13),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
}
