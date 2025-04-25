import 'package:book_app/core/error/failure.dart';
import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<ServerFailure, List<BookModel>>> fetchResultBooks(String query);
}
