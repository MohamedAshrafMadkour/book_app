import 'package:bloc/bloc.dart';
import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:book_app/feature/home/repo/repo_home.dart';
import 'package:equatable/equatable.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.repoHome) : super(FeaturedBookInitial());
  final RepoHome repoHome;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());
    var result = await repoHome.getFeaturedBooks();
    result.fold(
      (failure) {
        emit(FeaturedBookFailure(failure.errorMessage));
      },
      (books) {
        emit(FeaturedBookSuccess(books));
      },
    );
  }
}
