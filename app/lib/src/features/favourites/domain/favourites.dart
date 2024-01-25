import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../events/domain/event.dart';
import '../../menu/domain/menu.dart';

part 'favourites.freezed.dart';

@freezed
class Favourites with _$Favourites {
  const factory Favourites({
    required Set<Event> events,
    required Set<Item> items,
  }) = _Favourites;
}
