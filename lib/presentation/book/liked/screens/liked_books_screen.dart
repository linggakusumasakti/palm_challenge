import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_challenge/presentation/book/liked/blocs/liked_books_bloc.dart';

import '../../../home/screen/books_section.dart';

class LikedBooksScreen extends StatelessWidget {
  const LikedBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikedBooksBloc, LikedBooksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Liked Books',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ),
          backgroundColor: Colors.white,
          body: _buildContent(state, context),
        );
      },
    );
  }

  Widget _buildContent(LikedBooksState state, BuildContext context) {
    switch (state) {
      case Initial _ || Loading _:
        return const Center(child: CircularProgressIndicator());
      case Loaded(:final books):
        return BooksSection(
          books: books,
          hasReachedMax: true,
          isDisablePagination: true,
        );
      case Empty _:
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your liked books will appear here',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  backgroundColor: Colors.blue,
                  shape: const StadiumBorder(),
                  elevation: 6,
                  shadowColor: Colors.blue.withValues(alpha: 0.4),
                ),
                child: const Text(
                  'Add some books',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      case Error(:final message):
        return Center(child: Text('Error: $message'));
    }
    return SizedBox();
  }
}
