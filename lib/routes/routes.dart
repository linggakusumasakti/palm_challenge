import 'package:flutter/material.dart';
import 'package:palm_challenge/core/domain/entities/book.dart';
import 'package:palm_challenge/presentation/book/detail/screen/book_detail_screen.dart';

import '../presentation/home/screen/home_screen.dart';

class Routes {
  static const home = 'home';
  static const detail = 'detail';

  static Route<dynamic> route(RouteSettings setting) {
    return switch (setting.name) {
      home => MaterialPageRoute(builder: (_) => HomeScreen()),
      detail => MaterialPageRoute(
          builder: (_) => BookDetailScreen(
                book: setting.arguments as Book,
              )),
      _ => MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(child: Text('Page not found')),
              )),
    };
  }
}
