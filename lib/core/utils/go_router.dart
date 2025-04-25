import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/feature/Search/presentation/views/search_view.dart';
import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:book_app/feature/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:book_app/feature/home/presentation/views/book_details_view.dart';
import 'package:book_app/feature/home/presentation/views/home_view.dart';
import 'package:book_app/feature/home/presentation/views/widget/test.dart';
import 'package:book_app/feature/home/repo/repo_home_impl.dart';
import 'package:book_app/feature/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class RouterNavigation {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/detailsView';
  static const kSearchView = '/searchView';
  static const kTestNavigation = '/testNavigation';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kTestNavigation,
        builder: (BuildContext context, GoRouterState state) {
          return const TestDataNavigation();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<RepoHomeImpl>()),
            child: BookDetailsView(bookModel: state.extra as BookModel),
          );
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
    ],
  );
}
