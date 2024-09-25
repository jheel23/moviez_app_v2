import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviez_app/screens/all_movie_tv_screen.dart';
import 'package:moviez_app/screens/all_trending_screen.dart';
import 'package:moviez_app/screens/home_screen.dart';
import 'package:moviez_app/screens/movie_details_screen.dart';
import 'package:moviez_app/theme/theme_constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZEST',
      theme: mainTheme,
      home: AnimatedSplashScreen(
          splash: Container(
              clipBehavior: Clip.hardEdge,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset('assets/images/logo.jpg')),
          splashTransition: SplashTransition.fadeTransition,
          duration: 2500,
          backgroundColor: Colors.green.withOpacity(0.1),
          splashIconSize: double.infinity,
          nextScreen: const HomeScreen()),
      routes: {
        MovieDetailsScreen.routeName: (context) => const MovieDetailsScreen(),
        AllMoviesTvScreen.routeName: (context) => const AllMoviesTvScreen(),
        AllTrendingScreen.routeName: (context) => const AllTrendingScreen(),
      },
    );
  }
}
