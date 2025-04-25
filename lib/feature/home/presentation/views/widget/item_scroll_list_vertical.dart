import 'package:book_app/core/widget/error_message.dart';
import 'package:book_app/core/widget/indicator_loading.dart';
import 'package:book_app/feature/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:book_app/feature/home/presentation/views/widget/seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemScrollListViewVertical extends StatelessWidget {
  const ItemScrollListViewVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return SellerItem(book: state.books[index]);
            },
          );
        } else if (state is NewestBooksFailure) {
          return ErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const IndicatorLoading();
        }
      },
    );
  }
}
