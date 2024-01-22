import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_go_demo/src/routing/app_router.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../../favourites/data/favourites_repository.dart';
import '../data/event_repository.dart';
import '../domain/event.dart';
import '../presentation/like_event_controller.dart';

import 'package:add_2_calendar/add_2_calendar.dart' as calendar;
import 'package:intl/intl.dart';
import 'package:share/share.dart';

class EventsScreen extends ConsumerStatefulWidget {
  const EventsScreen({super.key});
  @override
  ConsumerState<EventsScreen> createState() => _EventsScreen();
}

class _EventsScreen extends ConsumerState<EventsScreen> {
  late final LikeEventController _controller;
  late final FavouritesController _favouriteController;

  @override
  void initState() {
    super.initState();
    _controller = ref.read(likeEventControllerProvider.notifier);
    _favouriteController = ref.read(favouritesControllerProvider.notifier);
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
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
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
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                  child: EventList(theme: theme, controller: _controller),
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

  void likeEvent({required Event event, required bool like}) {
    _controller.like(event: event, like: true);
    _favouriteController.favouriteEvent(event: event, like: like);
    //ref.invalidate(favouritesControllerProvider);
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
        iconSize: 30,
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

class EventList extends ConsumerWidget {
  const EventList({
    required this.theme,
    required this.controller,
    super.key,
  });

  final ThemeData theme;
  final LikeEventController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget<List<Event>>(
      value: ref.watch(fetchEventsProvider),
      data: (events) => ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          //ab hier ersetzten mit schönerer Eventliste
          //variable events hat die eventliste
          return EventCard(
            title: events[index].title,
            dateTime: events[index].date,
            attendeeCount: 14,
            imagePath:
                '../../../assets/events-assets/${events.elementAt(index).title.toLowerCase()}.jpg',
            description: 'This is a description for an extremely awesome event',
          );

          //onPressed: () =>
          //   controller.like(event: events[index], like: true),
        },
      ),
    );
  }
}

final specialsExpandedProvider =
    StateProvider.family<bool, String>((ref, eventId) => false);

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

class EventCard extends ConsumerWidget {
  final String title;
  final String dateTime; //ISO 8601 Format
  final int attendeeCount;
  final String imagePath;
  final String description;

  EventCard({
    required this.title,
    required this.dateTime,
    required this.attendeeCount,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSpecialsExpanded = ref.watch(specialsExpandedProvider(title).state);
    // Parse the ISO 8601 date string and format it for display
    //DateTime parsedDateTime = DateTime.parse(dateTime);
    //String formattedDateTime =
    //    DateFormat('yyyy-MM-dd  HH:mm').format(parsedDateTime);
    final controller = ref.watch(fetchEventsProvider);

    return Card(
      color: Color(0xFF401E11), // Card background color
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(8),
      elevation: 5,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 150, // Set a fixed height for the image container
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFF2E3),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.thumb_up, color: Color(0xFFFFF2E3)),
                    SizedBox(width: 4), // Space between icons
                    Icon(Icons.star, color: Color(0xFFFFF2E3)),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            initiallyExpanded: isSpecialsExpanded.state,
            backgroundColor: Color(0xFF401E11),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateTime, //formattedDateTime,
                  style: TextStyle(color: Color(0xFFFFF2E3)),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.person, color: Color(0xFFFFF2E3)),
                    Text(
                      ' $attendeeCount',
                      style: TextStyle(color: Color(0xFFFFF2E3)),
                    ),
                  ],
                ),
              ],
            ),
            onExpansionChanged: (bool expanded) {
              ref.read(specialsExpandedProvider(title).state).state = expanded;
            },
            trailing: Icon(
              isSpecialsExpanded.state
                  ? Icons.arrow_drop_up
                  : Icons.arrow_drop_down,
              color: Color(0xFFFFF2E3),
            ),
            children: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF734217),
                    ),
                    child: Text("I'm coming!",
                        style: TextStyle(color: Color(0xFFFFF2E3))),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final event = calendar.Event(
                        title: title,
                        description: description,
                        location:
                            'Event Location', // Optional: Add event location
                        startDate: DateTime.parse(dateTime),
                        endDate: DateTime.parse(dateTime).add(
                            Duration(hours: 2)), // Adjust duration as needed
                      );
                      calendar.Add2Calendar.addEvent2Cal(event);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF734217),
                    ),
                    child: Text("Export Date",
                        style: TextStyle(color: Color(0xFFFFF2E3))),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final content =
                          'Check out this event: $title on $dateTime';
                      Share.share(content);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF734217),
                    ),
                    child: Text("Share",
                        style: TextStyle(color: Color(0xFFFFF2E3))),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  description,
                  style: TextStyle(color: Color(0xFFFFF2E3)),
                ),
              ),
              ListTile(
                title: Text(
                  'Specials',
                  style: TextStyle(color: Color(0xFFFFF2E3)),
                ),
                trailing: IconButton(
                  icon: Icon(
                    isSpecialsExpanded.state
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: Color(0xFFFFF2E3),
                  ),
                  onPressed: () {
                    ref.read(specialsExpandedProvider(title).state).state =
                        !isSpecialsExpanded.state;
                  },
                ),
              ),
              AnimatedCrossFade(
                firstChild: SizedBox.shrink(),
                secondChild: Container(
                  color: Color(0xFF734217),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Bloody Mary',
                          style: TextStyle(color: Color(0xFFFFF2E3)),
                        ),
                        trailing: Text(
                          '3,30 Euro',
                          style: TextStyle(color: Color(0xFFFFF2E3)),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Pina Colada',
                          style: TextStyle(color: Color(0xFFFFF2E3)),
                        ),
                        trailing: Text(
                          '5 Euro',
                          style: TextStyle(color: Color(0xFFFFF2E3)),
                        ),
                      ),
                    ],
                  ),
                ),
                crossFadeState: isSpecialsExpanded.state
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 300),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
