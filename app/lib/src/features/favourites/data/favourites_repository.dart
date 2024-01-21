import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/logger.dart';
import '../../events/domain/event.dart';
import '../../menu/domain/menu.dart';
import '../domain/favourites.dart';

part 'favourites_repository.g.dart';

@riverpod
class FavouritesRepository extends _$FavouritesRepository {
  @override
  Favourites build() => Favourites();
  void favouriteEvent({required Event event, required bool like}) {
    if (like)
      {state.events.add(event);}
    else
      {state.events.remove(event);}
  }
  void favouriteItem({required Item item, required bool like}) {
    if (like)
      {state.items.add(item);}
    else
      {state.items.remove(item);}
  }

  Set<Event> getEventList(){
    return state.events;
  }
  Set<Item> getItemList(){
    return state.items;
  }

}
