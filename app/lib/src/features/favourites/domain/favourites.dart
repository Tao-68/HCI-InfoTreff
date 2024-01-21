import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../events/domain/event.dart';
import '../../menu/domain/menu.dart';

//part 'favourites.freezed.dart';


class Favourites  {
  Favourites();

  Set<Event> events = {};
  Set<Item> items = {};

}
