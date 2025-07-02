import 'package:get_it/get_it.dart';
import 'package:palm_challenge/core/data/datasources/remote_data_source.dart';
import 'package:palm_challenge/core/domain/repositories/book_repository.dart';
import 'package:palm_challenge/core/domain/usecases/get_books.dart';
import 'package:palm_challenge/core/domain/usecases/is_book_liked.dart';
import 'package:palm_challenge/core/domain/usecases/like_book.dart';
import 'package:palm_challenge/presentation/book/detail/blocs/detail_book_bloc.dart';
import 'package:palm_challenge/presentation/home/blocs/home_bloc.dart';

import '../core/data/datasources/local_data_source.dart';
import '../core/data/utils/connection_checker.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory<HomeBloc>(() => HomeBloc(locator()));
  locator.registerFactory<DetailBookBloc>(
      () => DetailBookBloc(locator(), locator()));
  //use cases
  locator.registerLazySingleton(() => GetBooks(repository: locator()));
  locator.registerLazySingleton(() => LikeBook(repository: locator()));
  locator.registerLazySingleton(() => IsBookLiked(repository: locator()));

  // data source
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  locator
      .registerLazySingleton<ConnectionChecker>(() => ConnectionCheckerImpl());

  // repository
  locator.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      connectionChecker: locator()));
}
