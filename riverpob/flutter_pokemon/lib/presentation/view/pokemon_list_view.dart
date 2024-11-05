import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class PokemonListView extends ConsumerStatefulWidget {
  const PokemonListView({super.key});

  @override
  ConsumerState<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends ConsumerState<PokemonListView> {
  final ScrollController _scrollController = ScrollController();
  int next = 0;
  int previous = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  _onScroll() {
    if (_isBottom) {}
  }

  @override
  Widget build(BuildContext context) {
    final pokemonAsync = ref.watch(
        pokemonFutureProvider(PokemonParamsModel(limit: 1302, offset: 0)));
    return Center(
      child: pokemonAsync.maybeWhen(
        data: (data) {
          return ListView.builder(
            // controller: _scrollController,
            itemCount: data.results.length,
            itemBuilder: (BuildContext context, int index) {
              PokemonsModel item = data.results[index];
              return GestureDetector(
                onTap: () {
                  print("Pressed ${item.name}");
                },
                child: ListTile(
                  title: Text(item.name,
                      style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.fontSize)),
                  subtitle: Text(item.url),
                ),
              );
            },
          );
        },
        orElse: () => const Text("Error"),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
