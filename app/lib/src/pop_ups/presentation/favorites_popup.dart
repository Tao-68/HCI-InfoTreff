import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infotreff_connect/src/common_widgets/async_value_widget.dart';
import 'package:infotreff_connect/src/features/events/presentation/event_card.dart';
import 'package:infotreff_connect/src/features/events/presentation/like_event_controller.dart';
import 'package:infotreff_connect/src/routing/app_router.dart';
import '../../features/favourites/data/favourites_repository.dart';

class FavoritesPopup extends ConsumerStatefulWidget {
  const FavoritesPopup({super.key});
  @override
  ConsumerState<FavoritesPopup> createState() => _FavoritesPopup();
}

class _FavoritesPopup extends ConsumerState<FavoritesPopup> {
  late final LikeEventController _likeEventController;
  @override
  void initState() {
    super.initState();
    _likeEventController = ref.read(likeEventControllerProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          Headline(theme: theme),
          Container(
            alignment: Alignment.center,
            child: Divider(
              color: theme.colorScheme.secondary,
              thickness: 2,
            ),
          ),
          Expanded(
            child: SizedBox(
              child: EventList(
                ref: ref,
                likeEventController: _likeEventController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventList extends StatelessWidget {
  const EventList({
    required this.ref,
    required LikeEventController likeEventController,
    super.key,
  }) : _likeEventController = likeEventController;

  final WidgetRef ref;
  final LikeEventController _likeEventController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AsyncValueWidget(
      value: ref.watch(fetchFavouritesProvider),
      data: (favourites) => ListView(
        children: [
          const ListTile(
            title: Text(
              'Events',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          if (favourites.events.isEmpty)
            const ListTile(
              title: Text('No liked events'),
            )
          else
            for (final event in favourites.events)
              EventCard(
                title: event.title,
                dateTime: event.date,
                attendeeCount: event.likes,
                imagePath:
                    'assets/events-assets/${event.title.toLowerCase().replaceAll(' ', '_')}.jpg',
                description: 'This is an awsome Event',
                controller: _likeEventController,
                specials: event.specials,
                event: event,
                likeEventController: _likeEventController,
              ),
          const ListTile(
            title: Text(
              'Drinks & Snacks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          if (favourites.items.isEmpty)
            const ListTile(
              title: Text('No liked Drink & Snacks'),
            )
          else
            for (final item in favourites.items)
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.5,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    item.name,
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    switch (item.diet) {
                      1 => 'vegetarian',
                      2 => 'vegan',
                      _ => '',
                    },
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 38, 107, 40),
                    ),
                  ),
                  trailing: Text(
                    item.price,
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () => context.goNamed(
                    SubRoutes.menuItemDetails.name,
                    extra: item,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

class Headline extends StatelessWidget {
  const Headline({
    required this.theme,
    super.key,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Favorites',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimary,
            fontSize: 35,
          ),
        ),
        CloseButton(theme: theme),
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
