import 'package:book_app/core/error/failure.dart';
import 'package:book_app/core/utils/api_services.dart';
import 'package:book_app/core/model/all_books/all_books.dart';
import 'package:book_app/feature/home/repo/repo_home.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RepoHomeImpl extends RepoHome {
  final ApiServices apiServices;

  RepoHomeImpl(this.apiServices);
  @override
  Future<Either<ServerFailure, List<BookModel>>> getFeaturedBooks() async {
    try {
      var data = await apiServices.get(
        endPoints:
            'volumes?q=subject:programming&Filtering=free-ebooks&Sorting=newest',
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

  @override
  Future<Either<ServerFailure, List<BookModel>>> getNewestBooks() async {
    try {
      var data = await apiServices.get(
        endPoints: 'volumes?q=information technology &Filtering=free-ebooks',
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

  @override
  Future<Either<ServerFailure, List<BookModel>>> getSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiServices.get(
        endPoints: 'volumes?q=programming&Sorting=relevance',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
