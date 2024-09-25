import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviez_app/API/serach_api.dart';
import 'package:moviez_app/model/movie.dart';
import 'package:moviez_app/widgets/custom/custom_search_card.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Movie> searchMovie = [];
  Future<void> _searchMovies(String query) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          CupertinoActivityIndicator(
            animating: true,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: 20,
          ),
          const Text('Loading...'),
        ],
      ),
      backgroundColor: Colors.black,
      duration: const Duration(days: 1),
    ));
    await ref.watch(searchProvider.notifier).searchMovies(query);
    setState(() {
      searchMovie = ref.watch(searchProvider);
    });
    if (!mounted) return;
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    ref.watch(searchProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          _searchController.clear();
          ref.read(searchProvider.notifier).clearList();
        },
        child: Column(children: [
          SizedBox(
            height: deviceSize.height * 0.03,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                FocusScope.of(context).unfocus();
                _searchMovies(value);
              },
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                  ),
                  hintText: 'Search for movies, tv shows...',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          searchMovie.isEmpty
              ? Container(
                  height: deviceSize.height * 0.8,
                  alignment: Alignment.center,
                  child: const Text('Search for movies, tv shows...',
                      style: TextStyle(color: Colors.white)),
                )
              : Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: List.generate(
                      searchMovie.length,
                      (index) => CustomSearchCard(movie: searchMovie[index]),
                    ),
                  )),
        ]),
      ),
    );
  }
}
