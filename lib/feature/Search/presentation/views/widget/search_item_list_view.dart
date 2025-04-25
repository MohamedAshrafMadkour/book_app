import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/core/widget/error_message.dart';
import 'package:book_app/core/widget/indicator_loading.dart';
import 'package:book_app/feature/Search/presentation/manager/search_book_cubit/search_books_cubit.dart';
import 'package:book_app/feature/home/presentation/views/widget/seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchItemListView extends StatelessWidget {
  const SearchItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return SellerItem(book: state.books[index]);
            },
          );
        } else if (state is SearchBooksFailure) {
          return ErrorMessage(errorMessage: state.errorMessage);
        } else if (state is SearchBooksLoading) {
          return const IndicatorLoading();
        } else {
          return const Text(
            textAlign: TextAlign.center,
            'search first please !',
            style: Styles.textStyle16,
          );
        }
      },
    );
  }
}
