import 'package:book_app/core/constant/constant.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:book_app/feature/home/presentation/views/widget/book_details_app_bar.dart';
import 'package:book_app/feature/home/presentation/views/widget/book_rating.dart';
import 'package:book_app/feature/home/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/material.dart';

class FirstHalfBookDetailsViewSection extends StatelessWidget {
  const FirstHalfBookDetailsViewSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        const BookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .25),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail,
          ),
        ),
        const SizedBox(height: 36),
        Text(
          textAlign: TextAlign.center,
          bookModel.volumeInfo.title ?? 'anonymous book',
          style: Styles.textStyle30,
        ),
        const SizedBox(height: 2),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle20.copyWith(fontFamily: kFont),
          ),
        ),
        const SizedBox(height: 12),
        BookRating(
          pageCount: bookModel.volumeInfo.ratingsCount ?? 0,
          rating: bookModel.volumeInfo.averageRating ?? 0,
        ),
      ],
    );
  }
}
