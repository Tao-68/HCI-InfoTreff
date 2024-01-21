import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_go_demo/src/routing/app_router.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../../favourites/data/favourites_repository.dart';
import '../data/event_repository.dart';
import '../domain/event.dart';
import '../presentation/like_event_controller.dart';

class EventsScreen extends ConsumerStatefulWidget {
  const EventsScreen({super.key});
  @override
  ConsumerState<EventsScreen> createState() => _EventsScreen();
}

class _EventsScreen extends ConsumerState<EventsScreen> {
  late final LikeEventController _controller;
  late final FavouritesRepository _favouriteController;

  @override
  void initState() {
    super.initState();
    _controller = ref.read(likeEventControllerProvider.notifier);
    _favouriteController = ref.read(favouritesRepositoryProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        const BackgroundAsImage(),
        AsyncValueWidget<List<Event>>(
          value: ref.watch(fetchEventsProvider),
          //ListView müsste dann eventuell ersetzt werden
          ////mit dem Widget das genutzt wird
          //eventliste in variable events
          //jeder eintrag in liste ist ein event
          //Eventklasse ist in domain/event.dart
          data: (events) => ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              return Row(
              children: <Widget>[
                Expanded(
                  child: Text(events[index].title),
                ),
                Expanded(
                  child: TextButton(
                    child: Text('like'),
                    onPressed: () =>
                        _controller.like(event: events[index], like: true),
                  ),
                ),
                Expanded(
                  child: Text(events[index].likes.toString()),
                  ),
                ],
              );
            },
          ),
        ),

        //zurück zu Home
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          alignment: Alignment.topLeft,
          child: BackButton(theme: theme),
        ),
      ],
    );
  }

  void likeEvent({required Event event, required bool like}) {
    _controller.like(event: event, like: true);
    _favouriteController.favouriteEvent(event: event, like: like);
    ref.invalidate(favouritesRepositoryProvider); 
  }
}

class BackButton extends ConsumerWidget {
  const BackButton({
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
        onPressed: () => context.go('/${TopLevelDestinations.home.name}'),
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: theme.colorScheme.primary,
        ),
        iconSize: 40,
      ),
    );
  }
}

class BackgroundAsImage extends ConsumerWidget {
  const BackgroundAsImage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/events_background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }


}
