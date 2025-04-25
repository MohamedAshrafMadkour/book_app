import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/feature/Search/presentation/manager/search_book_cubit/search_books_cubit.dart';
import 'package:book_app/feature/Search/presentation/views/widget/search_view_body.dart';
import 'package:book_app/feature/Search/repo/search_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBooksCubit(getIt.get<SearchRepoImpl>()),
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SearchViewBody(),
          ),
        ),
      ),
    );
  }
}
