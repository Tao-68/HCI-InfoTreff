import 'package:add_2_calendar/add_2_calendar.dart' as calendar;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ri_go_demo/src/routing/app_router.dart';
import 'package:share/share.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../../favourites/data/favourites_repository.dart';
import '../../menu/domain/menu.dart';
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Headline(theme: theme),
              Expanded(
                child: SizedBox(
                  child:
                      EventList(theme: theme, likeEventEontroller: _controller),
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
    required this.likeEventEontroller,
    super.key,
  });

  final ThemeData theme;
  final LikeEventController likeEventEontroller;

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
                'assets/events-assets/${events.elementAt(index).title.toLowerCase()}.jpg',
            description: 'This is a description for an extremely awesome event',
            controller: likeEventEontroller,
            specials: events[index].specials,
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

class EventCard extends ConsumerWidget {
  const EventCard({
    required this.title,
    required this.dateTime,
    required this.attendeeCount,
    required this.imagePath,
    required this.description,
    required this.controller,
    required this.specials,
    super.key,
  });

  final String title;
  final String dateTime; //ISO 8601 Format
  final int attendeeCount;
  final String imagePath;
  final String description;
  final LikeEventController controller;
  final List<Item> specials;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSpecialsExpanded = ref.watch(specialsExpandedProvider(title));
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2, color: theme.colorScheme.primary),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 4,
      color: theme.colorScheme.onPrimary,
      shadowColor: Colors.black,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          EventCover(imagePath: imagePath, title: title, theme: theme),
          ExpansionTile(
            initiallyExpanded: isSpecialsExpanded,
            backgroundColor: theme.colorScheme.onPrimary,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateTime,
                  style: TextStyle(color: theme.colorScheme.primary),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.person, color: theme.colorScheme.primary),
                    Text(
                      ' $attendeeCount',
                      style: TextStyle(color: theme.colorScheme.primary),
                    ),
                  ],
                ),
              ],
            ),
            onExpansionChanged: (bool expanded) {
              ref.read(specialsExpandedProvider(title).state).state = expanded;
            },
            trailing: Icon(
              isSpecialsExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: theme.colorScheme.primary,
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Column(
                  children: [
                    EventMainBody(
                      theme: theme,
                      title: title,
                      description: description,
                      dateTime: dateTime,
                    ),
                    Accordion(
                      title: 'Specials',
                      childWidget:
                          SpecialsList(specials: specials, theme: theme),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SpecialsList extends StatelessWidget {
  const SpecialsList({
    required this.specials,
    required this.theme,
    super.key,
  });

  final List<Item> specials;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final item in specials)
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.5,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            child: ListTile(
              title: Text(
                item.name,
                style: TextStyle(
                  color: theme.colorScheme.primary,
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
                  color: Color.fromARGB(255, 41, 172, 45),
                ),
              ),
              trailing: Text(
                item.price,
                style: TextStyle(
                  color: theme.colorScheme.primary,
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
    );
  }
}

class Accordion extends ConsumerStatefulWidget {
  const Accordion({required this.title, required this.childWidget, super.key});
  final String title;
  final Widget childWidget;

  @override
  ConsumerState<Accordion> createState() => _AccordionState();
}

class _AccordionState extends ConsumerState<Accordion> {
  // Show or hide the content
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2, color: theme.colorScheme.primary),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 4,
      color: theme.colorScheme.onSecondary,
      shadowColor: Colors.black,
      child: Column(
        children: [
          // The title
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(color: theme.colorScheme.primary, fontSize: 20),
            ),
            onTap: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
            trailing: Icon(
              _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: theme.colorScheme.primary,
            ),
          ),
          // Show or hide the content based on the state
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.5,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: widget.childWidget,
            ),
            crossFadeState: _showContent
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}

class EventMainBody extends StatelessWidget {
  const EventMainBody({
    required this.theme,
    required this.title,
    required this.description,
    required this.dateTime,
    super.key,
  });

  final ThemeData theme;
  final String title;
  final String description;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.5,
            color: theme.colorScheme.onSecondary,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: const EdgeInsets.all(2),
            children: [
              ImCommingButton(
                theme: theme,
              ),
              ExportDateButton(
                title: title,
                description: description,
                dateTime: dateTime,
                theme: theme,
              ),
              ShareButton(
                title: title,
                dateTime: dateTime,
                theme: theme,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Text(
              description,
              style: TextStyle(color: theme.colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class EventCover extends StatelessWidget {
  const EventCover({
    required this.imagePath,
    required this.title,
    required this.theme,
    super.key,
  });

  final String imagePath;
  final String title;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.thumb_up_outlined,
                    color: theme.colorScheme.primary,
                    size: 30,
                  ),
                  // Space between icons
                  const SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.star_outline_rounded,
                    color: theme.colorScheme.primary,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({
    required this.title,
    required this.dateTime,
    required this.theme,
    super.key,
  });

  final String title;
  final String dateTime;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final content = 'Check out this event: $title on $dateTime';
        Share.share(content);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onSecondary,
        padding: const EdgeInsets.symmetric(horizontal: 10),
      ),
      child: Text(
        'Share',
        style: TextStyle(color: theme.colorScheme.primary),
      ),
    );
  }
}

class ExportDateButton extends StatelessWidget {
  const ExportDateButton({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.theme,
    super.key,
  });

  final String title;
  final String description;
  final String dateTime;
  final ThemeData theme;

  //var parsedDateTime = DateTime.parse(dateTime);

  @override
  Widget build(BuildContext context) {
    final newFormat = DateFormat('dd.MM.yyyy H:m');

    return ElevatedButton(
      onPressed: () {
        final event = calendar.Event(
          title: title,
          description: description,
          location: 'Event Location', // Optional: Add event location
          startDate: newFormat.parse(dateTime),
          endDate: newFormat
              .parse(dateTime)
              .add(const Duration(hours: 2)), // Adjust duration as needed
        );
        calendar.Add2Calendar.addEvent2Cal(event);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onSecondary,
        padding: const EdgeInsets.symmetric(horizontal: 10),
      ),
      child: Text(
        'Export Date',
        style: TextStyle(color: theme.colorScheme.primary),
      ),
    );
  }
}

class ImCommingButton extends StatelessWidget {
  const ImCommingButton({
    required this.theme,
    super.key,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //TODO(): add funtion for adding participant to event
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onSecondary,
        padding: const EdgeInsets.symmetric(horizontal: 10),
      ),
      child: Text(
        "I'm coming!",
        style: TextStyle(color: theme.colorScheme.primary),
      ),
    );
  }
}
