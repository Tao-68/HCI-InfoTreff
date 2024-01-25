import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_go_demo/src/common_widgets/async_value_widget.dart';

import '../../features/favourites/data/favourites_repository.dart';

class FavoritesPopup extends ConsumerStatefulWidget {
  const FavoritesPopup({super.key});
  @override
  ConsumerState<FavoritesPopup> createState() => _FavoritesPopup();
}

class _FavoritesPopup extends ConsumerState<FavoritesPopup> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AsyncValueWidget(
      value: ref.watch(fetchFavouritesProvider),
      data: (favourites) => Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          border: Border.all(width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorites',
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 25,
                  ),
                ),
                CloseButton(theme: theme),
              ],
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
                ListTile(
                  title: Text(event.title),
                ),
            const ListTile(
              title: Text('Drinks & Snacks'),
            ),
            if (favourites.items.isEmpty)
              const ListTile(
                title: Text('No liked Drink&Snacks'),
              )
            else
              for (final item in favourites.items)
                ListTile(
                  title: Text(item.name),
                ),
          ],
        ),
      ),
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
        border: Border.all(width: 2, color: theme.colorScheme.onSecondary),
        color: theme.colorScheme.secondary,
      ),
      child: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.close,
          color: theme.colorScheme.onSecondary,
        ),
        iconSize: 30,
      ),
    );
  }
}
