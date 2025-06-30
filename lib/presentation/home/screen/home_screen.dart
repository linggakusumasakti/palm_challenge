import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../blocs/home_bloc.dart';
import '../widgets/book_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetIt.instance<HomeBloc>()..add(const HomeEvent.fetchBook(page: 1)),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch (state) {
              case Initial _ || Loading _:
                return const Center(child: CircularProgressIndicator());
              case Loaded(:final books):
                return SafeArea(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: books.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return BookCard(book: book);
                    },
                  ),
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
