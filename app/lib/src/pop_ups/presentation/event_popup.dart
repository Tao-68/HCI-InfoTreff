import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';


class EventDetailsPopUp extends ConsumerWidget {
  const EventDetailsPopUp({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
  final theme = Theme.of(context);
  return Stack(
    children: [
      Positioned(
        top: 30,
        right: 20,
        child: CloseButton(theme: theme),
      ),
      ListView(  // Or use Column if you don't need scrolling
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        children: <Widget>[
          EventCard(
            title: 'Halloween',
            dateTime: '2024-10-31T21:00:00',
            attendeeCount: 14,
            imagePath: 'assets/events-assets/halloween.jpg',
            description: 'This is a description for an extremely awesome event',
          ),
            EventCard(
              title: 'Christmas',
              dateTime: '2024-12-25T20:00:00',
              attendeeCount: 20,
              imagePath: 'assets/events-assets/christmas.jpg',
              description: 'Celebrate Christmas with joy and happiness',
            ),
            EventCard(
              title: 'New Year',
              dateTime: '2024-12-31T21:00:00',
              attendeeCount: 25,
              imagePath: 'assets/events-assets/newyear.jpg',
              description: 'Join us to welcome the New Year with a grand celebration',
            ),
            // ... Add more EventCard widgets as needed
          ],
        ),
      ],
    );
  }
}

final specialsExpandedProvider = StateProvider.family<bool, String>((ref, eventId) => false);

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
  }
);

@override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSpecialsExpanded = ref.watch(specialsExpandedProvider(title).state);
    // Parse the ISO 8601 date string and format it for display
    DateTime parsedDateTime = DateTime.parse(dateTime);
    String formattedDateTime = DateFormat('yyyy-MM-dd  HH:mm').format(parsedDateTime);

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
                  formattedDateTime,
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
              isSpecialsExpanded.state ? Icons.arrow_drop_up : Icons.arrow_drop_down,
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
                    child: Text("I'm coming!", style: TextStyle(color: Color(0xFFFFF2E3))),
                  ),
                  ElevatedButton(
                    onPressed: () 
                    {
                      final event = Event(
                        title: title,
                        description: description,
                        location: 'Event Location', // Optional: Add event location
                        startDate: DateTime.parse(dateTime),
                        endDate: DateTime.parse(dateTime).add(Duration(hours: 2)), // Adjust duration as needed
                    );
                    Add2Calendar.addEvent2Cal(event);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF734217),
                    ),
                    child: Text("Export Date", style: TextStyle(color: Color(0xFFFFF2E3))),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final content = 'Check out this event: $title on $dateTime';
                      Share.share(content);
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF734217),
                    ),
                    child: Text("Share", style: TextStyle(color: Color(0xFFFFF2E3))),
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
                    isSpecialsExpanded.state ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: Color(0xFFFFF2E3),
                  ),
                  onPressed: () {
                    ref.read(specialsExpandedProvider(title).state).state = !isSpecialsExpanded.state;
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
                crossFadeState: isSpecialsExpanded.state ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 300),
              ),
            ],
          ),
        ],
      ),
    );
  }
}