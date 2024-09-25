import 'package:flutter/material.dart';
import 'package:moviez_app/screens/search_screen.dart';
import 'package:moviez_app/widgets/core/trending_movie_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pages = [
    const TrendingMovieWidget(),
    const SearchScreen(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      maintainBottomViewPadding: true,
      child: Scaffold(
          backgroundColor: Colors.black,
          extendBodyBehindAppBar: true,
          appBar: _selectedIndex == 0
              ? AppBar(
                  elevation: 0,
                  centerTitle: true,
                  title: const Text(
                    'Z E S T',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w900,
                        fontSize: 30),
                  ),
                  backgroundColor: Colors.transparent,
                  // actions: [
                  //   IconButton(
                  //     onPressed: () {
                  //       Navigator.of(context)
                  //           .push(MaterialPageRoute(builder: (context) {
                  //         return const SearchScreen();
                  //       }));
                  //     },
                  //     icon: const Icon(
                  //       Icons.search,
                  //       color: Colors.white,
                  //       size: 18,
                  //     ),
                  //   )
                  // ],
                )
              : null,
          body: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: _pages[_selectedIndex],
                ),
              ]),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
            ],
          )),
    );
  }
}
