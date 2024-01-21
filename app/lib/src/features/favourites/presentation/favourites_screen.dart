import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ri_go_demo/src/utils/localization.dart';

import '../data/favourites_repository.dart';

class FavouritesScreen extends ConsumerWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourites = ref.watch(favouritesRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(context.loc.appTitle),
      ),
      body: ListView(
        children: <Widget>[
          const ListTile(
            title: Text('Events'),
          ),
          if (favourites.events.isEmpty)
            const ListTile(
              title: Text('No liked events'),
            )
          else
            for (final event in favourites.events)
              ListTile(title: Text(event.title),
              ),
          const ListTile(
            title: Text('Drinks & Snacks'),
          ),
          if (favourites.items.isEmpty)
            const ListTile(
              title: Text('No liked events'),
            )
          else
            for (final item in favourites.items) 
              ListTile(title: Text(item.name),
              ),
        ],
      ),
    );
  }
}
