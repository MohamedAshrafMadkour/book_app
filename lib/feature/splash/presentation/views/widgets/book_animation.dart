import 'package:book_app/core/utils/asset.dart';
import 'package:flutter/material.dart';

class BookAnimation extends StatelessWidget {
  const BookAnimation({super.key, required this.slidingAnimation});
  final Animation<Offset> slidingAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Image.asset(AssetsData.logo),
        );
      },
      animation: slidingAnimation,
    );
  }
}
