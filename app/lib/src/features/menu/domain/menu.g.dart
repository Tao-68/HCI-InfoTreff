// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      name: json['name'] as String,
      active: json['active'] as bool,
      ingredients: json['ingredients'] as String,
      nutrition: json['nutrition'] as String,
      diet: json['diet'] as int,
      picture: json['picture'] as String,
      favorite: json['favorite'] as bool,
      likes: json['likes'] as int,
      price: json['price'] as String,
      allergens: json['allergens'] as String? ?? '',
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'active': instance.active,
      'ingredients': instance.ingredients,
      'nutrition': instance.nutrition,
      'diet': instance.diet,
      'picture': instance.picture,
      'favorite': instance.favorite,
      'likes': instance.likes,
      'price': instance.price,
      'allergens': instance.allergens,
    };
