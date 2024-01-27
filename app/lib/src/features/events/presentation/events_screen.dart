import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infotreff_connect/src/routing/app_router.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../data/event_repository.dart';
import '../domain/event.dart';
import '../presentation/like_event_controller.dart';
import 'event_card.dart';

class EventsScreen extends ConsumerStatefulWidget {
  const EventsScreen({super.key});
  @override
  ConsumerState<EventsScreen> createState() => _EventsScreen();
}

class _EventsScreen extends ConsumerState<EventsScreen> {
  late final LikeEventController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ref.read(likeEventControllerProvider.notifier);
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
        //zurück zu Home

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Headline(theme: theme),
              Expanded(
                child: SizedBox(
                  child: EventList(
                    theme: theme,
                    likeEventController: _controller,
                  ),
                ),
              ),
            ],
          ),
        ),

        GestureDetector(
          onHorizontalDragUpdate: (details) {
            const int senitivity = 8;
            if (details.delta.dx > senitivity) {
              context.go('/${TopLevelDestinations.home.name}');
            }
          },
        ),
      ],
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
        BackButton(theme: theme),
        Row(
          children: [
            Text(
              'Events',
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ],
    );
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
    return IconButton(
      onPressed: () => context.go('/${TopLevelDestinations.home.name}'),
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: theme.colorScheme.onPrimary,
      ),
      iconSize: 30,
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

class EventList extends ConsumerWidget {
  const EventList({
    required this.theme,
    required this.likeEventController,
    super.key,
  });

  final ThemeData theme;
  final LikeEventController likeEventController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget<List<Event>>(
      value: ref.watch(fetchEventsProvider),
      data: (events) => ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          String imageName = events[index].title.toLowerCase();
          imageName = imageName.replaceAll(' ', '_');
          return EventCard(
            title: events[index].title,
            dateTime: events[index].date,
            attendeeCount: events[index].likes,
            imagePath: 'assets/events-assets/$imageName.jpg',
            description: 'This is a description for an extremely awesome event',
            controller: likeEventController,
            specials: events[index].specials,
            event: events[index],
            likeEventController: likeEventController,
          );
        },
      ),
    );
  }
}
