// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<EventList> getEventList() async {
  final response =
      await http.get(Uri.parse('https://retoolapi.dev/khwaiu/events'));

  //print(jsonDecode(response.body));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return EventList.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load events');
  }
}

Future<http.Response> likeEvent(Event event, bool like) async {
  final response = await http
      .get(Uri.parse('https://retoolapi.dev/khwaiu/events/${event.eventID}'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON
    final eventData = jsonDecode(response.body);
    int likeVal = 0;
    if (like) {
      likeVal = 1;
    } else {
      likeVal = -1;
    }

    return http.patch(
      Uri.parse('https://retoolapi.dev/khwaiu/events/${event.eventID}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'likes': eventData['likes'] + likeVal}),
    );
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load events');
  }
}

class Event {
  Event({
    required this.eventID,
    required this.title,
    required this.date,
    this.likes = 0,
  });
  final int eventID;
  final String title;
  final String date;
  int likes = 0;

  @override
  bool operator ==(covariant Event other) => other.eventID == eventID;
  @override
  int get hashCode => eventID.hashCode;
  @override
  String toString() {
    return 'Titel: $title\nDate: $date\nLikes: $likes\n';
  }
}

class EventList {
  EventList({required this.eventList});

  factory EventList.fromJson(json) {
    final List<Event> list = List.empty(growable: true);
    for (final event in list) {
      list.add(
        Event(
          eventID: 1, //event["id"],
          title: 'Title', //event["title"],
          date: '01.01.2000', //event["date"],
          likes: 1,
        ),
      ); //event["likes"]));
    }
    return EventList(eventList: list);
  }
  List<Event> eventList;

  String getDetails() {
    String ret = '';
    for (final Event event in eventList) {
      ret += event.toString();
    }
    return ret;
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<EventList> futureEventList;

  EventList favourites = EventList(eventList: List.empty(growable: true));

  @override
  void initState() {
    super.initState();
    //futureEventList = getEventList();
  }

  dynamic toggleFavourite(Event event) {
    print('toggle favourite $event');
    setState(() {
      if (favourites.eventList.contains(event)) {
        favourites.eventList.remove(event);
        likeEvent(event, false);
      } else {
        favourites.eventList.add(event);
        likeEvent(event, true);
      }
    });
    print('Favourites: ${favourites.eventList}');
  }

  IconData getIcon(Event event) {
    if (favourites.eventList.contains(event)) {
      return Icons.star;
    } else {
      return Icons.star_border;
    }
  }

  @override
  Widget build(BuildContext context) {
    futureEventList = getEventList();
    print('BUILD');
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<EventList>(
            future: futureEventList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Event')),
                    DataColumn(label: Text('Like')),
                  ],
                  rows: [
                    for (final Event event in snapshot.data!.eventList)
                      DataRow(
                        cells: [
                          DataCell(Text(event.toString())),
                          DataCell(
                            ElevatedButton.icon(
                              onPressed: () {
                                toggleFavourite(event);
                              },
                              icon: Icon(getIcon(event)),
                              label: const Text('Like'),
                            ),
                          ),
                        ],
                      ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
