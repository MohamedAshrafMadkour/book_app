import 'package:bloc/bloc.dart';
import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:book_app/feature/home/repo/repo_home.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.repoHome) : super(NewestBooksInitial());
  final RepoHome repoHome;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await repoHome.getNewestBooks();
    result.fold((failure) => emit(NewestBooksFailure(failure.errorMessage)), (
      books,
    ) {
      emit(NewestBooksSuccess(books));
    });
  }
}
