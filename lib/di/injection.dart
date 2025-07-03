import 'package:get_it/get_it.dart';
import 'package:palm_challenge/core/data/datasources/remote_data_source.dart';
import 'package:palm_challenge/core/domain/repositories/book_repository.dart';
import 'package:palm_challenge/core/domain/usecases/get_books.dart';
import 'package:palm_challenge/core/domain/usecases/get_liked_books.dart';
import 'package:palm_challenge/core/domain/usecases/is_book_liked.dart';
import 'package:palm_challenge/core/domain/usecases/like_book.dart';
import 'package:palm_challenge/presentation/book/detail/blocs/detail_book_bloc.dart';
import 'package:palm_challenge/presentation/book/liked/blocs/liked_books_bloc.dart';
import 'package:palm_challenge/presentation/home/blocs/home_bloc.dart';

import '../core/data/datasources/db/database_helper.dart';
import '../core/data/datasources/local_data_source.dart';
import '../core/data/utils/connection_checker.dart';
import '../core/data/utils/dio_config.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory<HomeBloc>(() => HomeBloc(locator()));
  locator.registerFactory<DetailBookBloc>(
      () => DetailBookBloc(locator(), locator()));
  locator.registerFactory<LikedBooksBloc>(() => LikedBooksBloc(locator()));
  //use cases
  locator.registerLazySingleton(() => GetBooks(repository: locator()));
  locator.registerLazySingleton(() => LikeBook(repository: locator()));
  locator.registerLazySingleton(() => IsBookLiked(repository: locator()));
  locator.registerLazySingleton(() => GetLikedBooks(repository: locator()));

  //utils
  locator
      .registerLazySingleton(() => DioConfig(baseUrl: 'https://gutendex.com'));
  locator
      .registerLazySingleton<ConnectionChecker>(() => ConnectionCheckerImpl());

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(DatabaseHelper.instance));

  // repository
  locator.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      connectionChecker: locator()));
}
