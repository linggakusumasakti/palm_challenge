import 'package:get_it/get_it.dart';
import 'package:palm_challenge/core/data/datasources/remote_data_source.dart';
import 'package:palm_challenge/core/domain/repositories/book_repository.dart';
import 'package:palm_challenge/core/domain/usecases/get_books.dart';
import 'package:palm_challenge/presentation/home/blocs/home_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory<HomeBloc>(() => HomeBloc(locator()));
  //use cases
  locator.registerLazySingleton(() => GetBooks(repository: locator()));

  // remote data source
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  // repository
  locator.registerLazySingleton<BookRepository>(
      () => BookRepositoryImpl(remoteDataSource: locator()));
}
