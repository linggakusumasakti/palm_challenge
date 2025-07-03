import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:palm_challenge/di/injection.dart' as di;
import 'package:palm_challenge/presentation/book/liked/blocs/liked_books_bloc.dart';
import 'package:palm_challenge/presentation/home/blocs/home_bloc.dart';
import 'package:palm_challenge/presentation/home/screen/home_screen.dart';
import 'package:palm_challenge/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                GetIt.instance<HomeBloc>()..add(const HomeEvent.fetchBook())),
        BlocProvider(
            create: (_) => GetIt.instance<LikedBooksBloc>()
              ..add(LikedBooksEvent.getLikedBooks())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: Routes.route,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
