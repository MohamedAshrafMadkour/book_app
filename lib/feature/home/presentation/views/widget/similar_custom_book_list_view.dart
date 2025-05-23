import 'package:book_app/core/widget/error_message.dart';
import 'package:book_app/core/widget/indicator_loading.dart';
import 'package:book_app/feature/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:book_app/feature/home/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarCustomBookListView extends StatelessWidget {
  const SimilarCustomBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .16,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                        '',
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return ErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const IndicatorLoading();
        }
      },
    );
  }
}
