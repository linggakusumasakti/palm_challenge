import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_challenge/presentation/home/screen/books_section.dart';
import 'package:palm_challenge/routes/routes.dart';

import '../blocs/home_bloc.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: HomeSearchBar(
                      controller: searchController,
                      onChanged: (query) {
                        context.read<HomeBloc>().add(
                            HomeEvent.fetchBook(query: searchController.text));
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.liked);
                      },
                      icon: Icon(
                        Icons.favorite_rounded,
                        color: Colors.black87,
                      ))
                ],
              ),
              _buildHomeContent(state, context)
            ],
          ));
        },
      ),
    );
  }

  Widget _buildHomeContent(HomeState state, BuildContext context) {
    switch (state) {
      case Initial _ || Loading _:
        return Expanded(
            child: const Center(child: CircularProgressIndicator()));
      case Loaded(:final books, :final hasReachedMax):
        return Expanded(
          child: BooksSection(
            books: books,
            hasReachedMax: hasReachedMax,
            query: searchController.text,
          ),
        );
      case Error(:final message):
        return Center(child: Text('Error: $message'));
    }
    return SizedBox();
  }
}
