import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/favourites/data/favourites_repository.dart';

class FavoritesPopup extends ConsumerWidget {
  const FavoritesPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final favourites = ref.watch(favouritesControllerProvider);
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          alignment: Alignment.topRight,
          child: CloseButton(theme: theme),
        ),
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
    );
  }
}

class CloseButton extends ConsumerWidget {
  const CloseButton({
    required this.theme,
    super.key,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: theme.colorScheme.primary),
        color: theme.colorScheme.onSecondary,
      ),
      child: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.close,
          color: theme.colorScheme.primary,
        ),
        iconSize: 40,
      ),
    );
  }
}
