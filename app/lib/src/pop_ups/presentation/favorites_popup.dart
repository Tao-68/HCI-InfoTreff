import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/favourites/data/favourites_repository.dart';

class FavoritesPopup extends ConsumerStatefulWidget {
  const FavoritesPopup({super.key});
  @override
  ConsumerState<FavoritesPopup> createState() => _FavoritesPopup();
}

class _FavoritesPopup extends ConsumerState<FavoritesPopup> {
  late final FavouritesController _favouriteController;

  @override
  void initState() {
    super.initState();
    _favouriteController = ref.read(favouritesControllerProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
        if (_favouriteController.getEventList().isEmpty)
          const ListTile(
            title: Text('No liked events'),
          )
        else
          for (final event in _favouriteController.getEventList())
            ListTile(title: Text(event.title),
            ),
        const ListTile(
          title: Text('Drinks & Snacks'),
        ),
        if (_favouriteController.getItemList().isEmpty)
          const ListTile(
            title: Text('No liked events'),
          )
        else
          for (final item in _favouriteController.getItemList()) 
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
