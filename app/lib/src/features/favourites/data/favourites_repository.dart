import 'package:ri_go_demo/src/features/events/data/event_repository.dart';
import 'package:ri_go_demo/src/features/menu/data/menu_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/logger.dart';
import '../../events/domain/event.dart';
import '../../menu/domain/menu.dart';
import '../domain/favourites.dart';

part 'favourites_repository.g.dart';

late SharedPreferences prefs;

class FavouritesRepository {
  Future<Favourites> getFavourites(
    AsyncValue<List<Event>> eventRepo,
    AsyncValue<Menu> itemRepo,
  ) async {
    final List<Event>? eventList = eventRepo.value;
    final Menu? itemList = itemRepo.value;
    final prefs = await SharedPreferences.getInstance();
    final eventFavs = prefs.getStringList('events') ?? [];
    final Set<Event> events = {};
    if (eventList != null) {
      for (final element in eventFavs) {
        final int index =
            eventList.indexWhere((event) => event.id == int.parse(element));
        if (index != -1) {
          events.add(
            eventList[index],
          );
        }
      }
    }
    final itemFavs = prefs.getStringList('items') ?? [];
    final Set<Item> items = {};
    if (itemList != null) {
      for (final element in itemFavs) {
        if (itemList.contains(element)) {
          items.add(itemList.getByName(element));
        }
      }
    }
    return Favourites(
      events: events,
      items: items,
    );
  }

  Future<void> changeFavouriteEvent(Event event) async {
    final prefs = await SharedPreferences.getInstance();
    final eventFavs = prefs.getStringList('events') ?? [];
    if (eventFavs.contains(event.id.toString())) {
      eventFavs.remove(event.id.toString());
    } else {
      eventFavs.add(event.id.toString());
    }
    await prefs.setStringList('events', eventFavs);
  }

  Future<void> changeFavouriteItem(Item item) async {
    final prefs = await SharedPreferences.getInstance();
    final itemFavs = prefs.getStringList('items') ?? [];
    if (itemFavs.contains(item.name)) {
      itemFavs.remove(item.name);
    } else {
      itemFavs.add(item.name);
    }
    await prefs.setStringList('items', itemFavs);
  }
}

@riverpod
FavouritesRepository favouritesRepository(FavouritesRepositoryRef ref) =>
    FavouritesRepository();

@riverpod
Future<Favourites> fetchFavourites(FetchFavouritesRef ref) async {
  logger.d('favourites_repository.fetchFavourites');
  final repo = ref.read(favouritesRepositoryProvider);
  final eventList = ref.read(fetchEventsProvider);
  final itemList = ref.read(fetchMenuProvider);
  return repo.getFavourites(eventList, itemList);
}
