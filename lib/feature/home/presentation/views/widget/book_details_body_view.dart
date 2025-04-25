import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:book_app/feature/home/presentation/views/widget/first_half_book_details_section.dart';
import 'package:book_app/feature/home/presentation/views/widget/second_half_book_details_section.dart';
import 'package:flutter/material.dart';

class BookDetailsBodyView extends StatelessWidget {
  const BookDetailsBodyView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              FirstHalfBookDetailsViewSection(bookModel: bookModel),
              SecondHalfBookDetailsViewSection(bookModel: bookModel),
            ],
          ),
        ),
      ],
    );
  }
}
