
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Item with _$Item{
  const factory Item ({
    required String name,
    required bool active,
    required String ingredients,
    required String nutrition,
    required int diet,
    required String picture,
    required bool favorite,
    required int likes,
    @Default('') String allergens,
  }) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required String category,
    required List<Item> items,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json) {
    final List<Item> items = [];
    for (final element in json['items'] !as List<Object?>) {
      items.add(Item.fromJson(element !as Map<String, Object?>));      
    }
    return Category(category: json['category'] !as String, items: items);
  }
}
