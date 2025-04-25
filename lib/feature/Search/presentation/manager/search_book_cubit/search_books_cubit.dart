import 'package:bloc/bloc.dart';
import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:book_app/feature/Search/repo/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());
  final SearchRepo searchRepo;
  Future<void> getResultSearch(String query) async {
    if (query.isEmpty) {
      emit(SearchBooksInitial());
      return;
    }

    var res = await searchRepo.fetchResultBooks(query);

    res.fold((failure) => emit(SearchBooksFailure(failure.errorMessage)), (
      books,
    ) {
      if (books.isEmpty) {
        emit(const SearchBooksFailure("No Results"));
      } else {
        emit(SearchBooksSuccess(books));
      }
    });
  }

  void emptyRes() {
    emit(SearchBooksInitial());
  }
}
