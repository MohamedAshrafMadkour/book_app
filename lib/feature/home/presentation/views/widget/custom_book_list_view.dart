import 'package:book_app/core/utils/go_router.dart';
import 'package:book_app/core/widget/error_message.dart';
import 'package:book_app/core/widget/indicator_loading.dart';
import 'package:book_app/feature/home/presentation/manager/featured_books_cubit/featured_book_cubit.dart';
import 'package:book_app/feature/home/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBookListView extends StatelessWidget {
  const CustomBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .23,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap:
                      () => (context).push(
                        RouterNavigation.kBookDetailsView,
                        extra: state.books[index],
                      ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                          '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBookFailure) {
          return ErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const IndicatorLoading();
        }
      },
    );
  }
}
