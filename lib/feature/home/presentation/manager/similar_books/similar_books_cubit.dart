import 'package:bloc/bloc.dart';
import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:book_app/feature/home/repo/repo_home.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.repoHome) : super(SimilarBooksInitial());
  final RepoHome repoHome;
  Future<void> fetchSimilarBook({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await repoHome.getNewestBooks();
    result.fold((failure) => emit(SimilarBooksFailure(failure.errorMessage)), (
      books,
    ) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
