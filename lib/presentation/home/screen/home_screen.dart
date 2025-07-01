import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:palm_challenge/presentation/home/screen/books_section.dart';

import '../blocs/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetIt.instance<HomeBloc>()..add(const HomeEvent.fetchBook()),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch (state) {
              case Initial _ || Loading _:
                return const Center(child: CircularProgressIndicator());
              case Loaded(:final books, :final hasReachedMax):
                return BooksSection(
                  books: books,
                  hasReachedMax: hasReachedMax,
                );
              case Error(:final message):
                return Center(child: Text('Error: $message'));
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
