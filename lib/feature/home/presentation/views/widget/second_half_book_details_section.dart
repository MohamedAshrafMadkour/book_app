import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:book_app/feature/home/presentation/views/widget/custom_button_action.dart';
import 'package:book_app/feature/home/presentation/views/widget/similar_custom_book_list_view.dart';
import 'package:flutter/material.dart';

class SecondHalfBookDetailsViewSection extends StatelessWidget {
  const SecondHalfBookDetailsViewSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        CustomButtonAction(bookModel: bookModel),
        const SizedBox(height: 45),
        const Text('You can also like', style: Styles.textStyle18),
        const SizedBox(height: 16),
        const SimilarCustomBookListView(),
        const SizedBox(height: 30),
      ],
    );
  }
}
