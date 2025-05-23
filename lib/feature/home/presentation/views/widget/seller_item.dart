import 'package:book_app/core/constant/constant.dart';
import 'package:book_app/core/utils/go_router.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:book_app/feature/home/presentation/views/widget/book_rating.dart';
import 'package:book_app/feature/home/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SellerItem extends StatelessWidget {
  const SellerItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => (context).push(RouterNavigation.kBookDetailsView, extra: book),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .25,
              child: CustomBookImage(
                imageUrl:
                    book.volumeInfo.imageLinks?.thumbnail ??
                    'data:image/jpeg;base64,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',
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(fontFamily: kFont),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      book.volumeInfo.authors?[0] ?? 'anonymous author',
                      style: Styles.textStyle14,
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Text(
                          book.saleInfo?.saleability ?? 'Free',
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        BookRating(
                          pageCount: book.volumeInfo.ratingsCount ?? 0,
                          rating: book.volumeInfo.averageRating ?? 0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
