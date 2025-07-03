import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:palm_challenge/core/data/datasources/remote_data_source.dart';
import 'package:palm_challenge/core/data/models/book_model.dart';
import 'package:palm_challenge/core/data/utils/dio_config.dart';

class MockDioConfig extends Mock implements DioConfig {}

void main() {
  late MockDioConfig mockDioConfig;
  late RemoteDataSourceImpl dataSource;

  setUp(() {
    mockDioConfig = MockDioConfig();
    dataSource = RemoteDataSourceImpl(mockDioConfig);
  });

  const mockResponseData = {
    "results": [
      {
        "id": 2701,
        "title": "Moby Dick; Or, The Whale",
        "authors": [
          {"name": "Melville, Herman", "birth_year": 1819, "death_year": 1891}
        ],
        "summaries": [
          "\"Moby Dick; Or, The Whale\" by Herman Melville is a novel written in the mid-19th century. The story follows Ishmael, a sailor on a whaling voyage, who seeks adventure and escape from his gloomy life on land. As he embarks on this journey, he becomes drawn into the complex world of whaling and is introduced to the ominous figure of Captain Ahab, whose obsession with a legendary white whale ultimately drives the narrative.  At the start of the novel, Ishmael introduces himself and shares his philosophy about the sea as a remedy for his melancholic disposition. He muses on the magnetic pull of the ocean, describing not only his own urge to set sail but also the collective longing of city dwellers for the water. Ishmael's journey takes him to New Bedford, where he experiences a series of humorous and strange encounters while seeking lodging before joining a whaling ship. As he navigates his way through the town, he is introduced to Queequeg, a tattooed harpooner with a mysterious past, setting the stage for a unique friendship that unfolds amidst the backdrop of whaling adventures. (This is an automatically generated summary.)"
        ],
        "translators": [],
        "subjects": [
          "Adventure stories",
          "Ahab, Captain (Fictitious character) -- Fiction",
          "Mentally ill -- Fiction",
          "Psychological fiction",
          "Sea stories",
          "Ship captains -- Fiction",
          "Whales -- Fiction",
          "Whaling -- Fiction",
          "Whaling ships -- Fiction"
        ],
        "bookshelves": [
          "Best Books Ever Listings",
          "Browsing: Fiction",
          "Browsing: Literature"
        ],
        "languages": ["en"],
        "copyright": false,
        "media_type": "Text",
        "formats": {
          "text/html": "https://www.gutenberg.org/ebooks/2701.html.images",
          "application/epub+zip":
              "https://www.gutenberg.org/ebooks/2701.epub3.images",
          "application/x-mobipocket-ebook":
              "https://www.gutenberg.org/ebooks/2701.kf8.images",
          "text/plain; charset=us-ascii":
              "https://www.gutenberg.org/ebooks/2701.txt.utf-8",
          "application/rdf+xml": "https://www.gutenberg.org/ebooks/2701.rdf",
          "image/jpeg":
              "https://www.gutenberg.org/cache/epub/2701/pg2701.cover.medium.jpg",
          "application/octet-stream":
              "https://www.gutenberg.org/cache/epub/2701/pg2701-h.zip"
        },
        "download_count": 93457
      }
    ]
  };

  test('should return list of BookModel when the response code is 200',
      () async {
    // Arrange
    final response = Response(
      requestOptions: RequestOptions(path: ''),
      statusCode: 200,
      data: mockResponseData,
    );

    when(() => mockDioConfig.get(
          endpoint: any(named: 'endpoint'),
          queryParameters: any(named: 'queryParameters'),
        )).thenAnswer((_) async => response);

    // Act
    final result = await dataSource.getBooks(page: 1, search: 'book');

    // Assert
    expect(result, isA<List<BookModel>>());
    expect(result.first.id, 2701);
    expect(result.first.title, "Moby Dick; Or, The Whale");
  });

  test('should throw FormatException when Dio throws an error', () async {
    // Arrange
    when(() => mockDioConfig.get(
          endpoint: any(named: 'endpoint'),
          queryParameters: any(named: 'queryParameters'),
        )).thenThrow(DioException(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 500,
        statusMessage: 'Internal Server Error',
      ),
    ));

    // Act & Assert
    expect(() => dataSource.getBooks(), throwsA(isA<FormatException>()));
  });
}
