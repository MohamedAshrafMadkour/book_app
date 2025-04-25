import 'package:book_app/core/utils/api_services.dart';
import 'package:book_app/feature/Search/repo/search_repo_impl.dart';
import 'package:book_app/feature/home/repo/repo_home_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<RepoHomeImpl>(RepoHomeImpl(getIt.get<ApiServices>()));
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt.get<ApiServices>()),
  );
}
