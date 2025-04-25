import 'package:book_app/core/error/failure.dart';
import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:dartz/dartz.dart';

abstract class RepoHome {
  Future<Either<ServerFailure, List<BookModel>>> getNewestBooks();
  Future<Either<ServerFailure, List<BookModel>>> getFeaturedBooks();
  Future<Either<ServerFailure, List<BookModel>>> getSimilarBooks({
    required String category,
  });
}
