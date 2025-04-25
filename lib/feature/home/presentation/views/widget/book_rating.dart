import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rating, required this.pageCount});
  final num rating;
  final int pageCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(
          rating.toString(),
          style: Styles.textStyle16.copyWith(color: Colors.white),
        ),
        const SizedBox(width: 8),
        Opacity(
          opacity: .5,
          child: Text(
            pageCount.toString(),
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
