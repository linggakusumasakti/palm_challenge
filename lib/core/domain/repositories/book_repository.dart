import 'package:palm_challenge/core/data/datasources/remote_data_source.dart';

import '../entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks({int page = 1});
}

class BookRepositoryImpl implements BookRepository {
  final RemoteDataSource remoteDataSource;

  const BookRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Book>> getBooks({int page = 1}) async {
    final models = await remoteDataSource.getBooks(page: page);
    return models
        .map((e) => Book(
              id: e.id,
              title: e.title,
              authors: e.authors,
              summaries: e.summaries,
              subjects: e.subjects,
              bookshelves: e.bookshelves,
              languages: e.languages,
              downloadCount: e.downloadCount,
              formats: e.formats,
              mediaType: e.mediaType,
              copyright: e.copyright,
            ))
        .toList();
  }
}
