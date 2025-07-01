import 'package:palm_challenge/core/data/datasources/remote_data_source.dart';
import 'package:palm_challenge/core/data/utils/ext/mapper.dart';

import '../../data/datasources/local_data_source.dart';
import '../../data/utils/connection_checker.dart';
import '../entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks({int page = 1, String? search});
}

class BookRepositoryImpl implements BookRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final ConnectionChecker connectionChecker;

  const BookRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectionChecker,
  });

  @override
  Future<List<Book>> getBooks({int page = 1, String? search}) async {
    final isOnline = await connectionChecker.isConnected;

    if (isOnline) {
      try {
        final remoteData = await remoteDataSource.getBooks(page: page, search: search);
        await localDataSource.saveBooks(remoteData.toTableModelList());
        return remoteData.map((e) => e.toEntity()).toList();
      } catch (e) {
        final localData = await localDataSource.getBooks();
        return localData.map((e) => e.toEntity()).toList();
      }
    } else {
      final localData = await localDataSource.getBooks();
      return localData.map((e) => e.toEntity()).toList();
    }
  }
}
