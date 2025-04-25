import 'package:book_app/core/error/failure.dart';
import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:book_app/core/utils/api_services.dart';
import 'package:book_app/feature/Search/repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl(this.apiServices);
  @override
  Future<Either<ServerFailure, List<BookModel>>> fetchResultBooks(
    String query,
  ) async {
    try {
      var data = await apiServices.get(
        endPoints: 'volumes?q=$query&filter=ebooks',
      );

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
