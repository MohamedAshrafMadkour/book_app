import 'package:book_app/core/function/custom_launch.dart';
import 'package:book_app/core/widget/custom_button.dart';
import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:flutter/material.dart';

class CustomButtonAction extends StatelessWidget {
  const CustomButtonAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: CustomButton(
              color: Colors.white,
              textColor: Colors.black,
              title: 'Free',
              borderRadius: BorderRadius.only(
                topRight: Radius.zero,
                bottomRight: Radius.zero,
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                await customLaunchUrl(
                  bookModel.volumeInfo.previewLink!,
                  context,
                );
              },
              color: const Color(0xffEF8262),
              textColor: Colors.white,
              title: getText(),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.zero,
                bottomLeft: Radius.zero,
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText() {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not available';
    } else {
      return 'Preview';
    }
  }
}
