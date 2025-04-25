import 'package:book_app/core/constant/constant.dart';
import 'package:book_app/core/utils/go_router.dart';
import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/feature/home/presentation/manager/featured_books_cubit/featured_book_cubit.dart';
import 'package:book_app/feature/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:book_app/feature/home/repo/repo_home_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BookLyApp());
}

class BookLyApp extends StatelessWidget {
  const BookLyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FeaturedBookCubit(getIt.get<RepoHomeImpl>())
                    ..fetchFeaturedBooks(),
        ),

        BlocProvider(
          create:
              (context) =>
                  NewestBooksCubit(getIt.get<RepoHomeImpl>())
                    ..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: RouterNavigation.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}

//https://www.googleapis.com/books/v1/volumes?q=programming
