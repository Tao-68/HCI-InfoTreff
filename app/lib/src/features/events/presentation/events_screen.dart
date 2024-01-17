import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ri_go_demo/src/utils/localization.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../data/event_repository.dart';
import '../domain/event.dart';

class EventsScreen extends ConsumerWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(context.loc.appTitle),
      ),
      body: AsyncValueWidget<List<Event>>(
        value: ref.watch(fetchEventsProvider),
        //ListView müsste dann eventuell ersetzt werden mit dem Widget das genutzt wird
        //eventliste in variable events
        //jeder eintrag in liste ist ein event
        //Eventklasse ist in domain/event.dart
        data: (events) => ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(events[index].title),
            );
          },
        ),
      ),
    );
  }
}
