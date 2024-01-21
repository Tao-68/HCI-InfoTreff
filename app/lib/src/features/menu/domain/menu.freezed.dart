// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get name => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String get ingredients => throw _privateConstructorUsedError;
  String get nutrition => throw _privateConstructorUsedError;
  int get diet => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  bool get favorite => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get allergens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String name,
      bool active,
      String ingredients,
      String nutrition,
      int diet,
      String picture,
      bool favorite,
      int likes,
      String price,
      String allergens});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? active = null,
    Object? ingredients = null,
    Object? nutrition = null,
    Object? diet = null,
    Object? picture = null,
    Object? favorite = null,
    Object? likes = null,
    Object? price = null,
    Object? allergens = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      nutrition: null == nutrition
          ? _value.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as String,
      diet: null == diet
          ? _value.diet
          : diet // ignore: cast_nullable_to_non_nullable
              as int,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      allergens: null == allergens
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      bool active,
      String ingredients,
      String nutrition,
      int diet,
      String picture,
      bool favorite,
      int likes,
      String price,
      String allergens});
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? active = null,
    Object? ingredients = null,
    Object? nutrition = null,
    Object? diet = null,
    Object? picture = null,
    Object? favorite = null,
    Object? likes = null,
    Object? price = null,
    Object? allergens = null,
  }) {
    return _then(_$ItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      nutrition: null == nutrition
          ? _value.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as String,
      diet: null == diet
          ? _value.diet
          : diet // ignore: cast_nullable_to_non_nullable
              as int,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      allergens: null == allergens
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl with DiagnosticableTreeMixin implements _Item {
  const _$ItemImpl(
      {required this.name,
      required this.active,
      required this.ingredients,
      required this.nutrition,
      required this.diet,
      required this.picture,
      required this.favorite,
      required this.likes,
      required this.price,
      this.allergens = ''});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final String name;
  @override
  final bool active;
  @override
  final String ingredients;
  @override
  final String nutrition;
  @override
  final int diet;
  @override
  final String picture;
  @override
  final bool favorite;
  @override
  final int likes;
  @override
  final String price;
  @override
  @JsonKey()
  final String allergens;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Item(name: $name, active: $active, ingredients: $ingredients, nutrition: $nutrition, diet: $diet, picture: $picture, favorite: $favorite, likes: $likes, price: $price, allergens: $allergens)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Item'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('active', active))
      ..add(DiagnosticsProperty('ingredients', ingredients))
      ..add(DiagnosticsProperty('nutrition', nutrition))
      ..add(DiagnosticsProperty('diet', diet))
      ..add(DiagnosticsProperty('picture', picture))
      ..add(DiagnosticsProperty('favorite', favorite))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('allergens', allergens));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.ingredients, ingredients) ||
                other.ingredients == ingredients) &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition) &&
            (identical(other.diet, diet) || other.diet == diet) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.allergens, allergens) ||
                other.allergens == allergens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, active, ingredients,
      nutrition, diet, picture, favorite, likes, price, allergens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {required final String name,
      required final bool active,
      required final String ingredients,
      required final String nutrition,
      required final int diet,
      required final String picture,
      required final bool favorite,
      required final int likes,
      required final String price,
      final String allergens}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  String get name;
  @override
  bool get active;
  @override
  String get ingredients;
  @override
  String get nutrition;
  @override
  int get diet;
  @override
  String get picture;
  @override
  bool get favorite;
  @override
  int get likes;
  @override
  String get price;
  @override
  String get allergens;
  @override
  @JsonKey(ignore: true)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Category {
  String get category => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call({String category, List<Item> items, int id});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? items = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, List<Item> items, int id});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? items = null,
    Object? id = null,
  }) {
    return _then(_$CategoryImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CategoryImpl with DiagnosticableTreeMixin implements _Category {
  const _$CategoryImpl(
      {required this.category,
      required final List<Item> items,
      required this.id})
      : _items = items;

  @override
  final String category;
  final List<Item> _items;
  @override
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Category(category: $category, items: $items, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Category'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(_items), id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);
}

abstract class _Category implements Category {
  const factory _Category(
      {required final String category,
      required final List<Item> items,
      required final int id}) = _$CategoryImpl;

  @override
  String get category;
  @override
  List<Item> get items;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Menu {
  List<Category> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuCopyWith<Menu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res, Menu>;
  @useResult
  $Res call({List<Category> categories});
}

/// @nodoc
class _$MenuCopyWithImpl<$Res, $Val extends Menu>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuImplCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$$MenuImplCopyWith(
          _$MenuImpl value, $Res Function(_$MenuImpl) then) =
      __$$MenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Category> categories});
}

/// @nodoc
class __$$MenuImplCopyWithImpl<$Res>
    extends _$MenuCopyWithImpl<$Res, _$MenuImpl>
    implements _$$MenuImplCopyWith<$Res> {
  __$$MenuImplCopyWithImpl(_$MenuImpl _value, $Res Function(_$MenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$MenuImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$MenuImpl with DiagnosticableTreeMixin implements _Menu {
  const _$MenuImpl({required final List<Category> categories})
      : _categories = categories;

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Menu(categories: $categories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Menu'))
      ..add(DiagnosticsProperty('categories', categories));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      __$$MenuImplCopyWithImpl<_$MenuImpl>(this, _$identity);
}

abstract class _Menu implements Menu {
  const factory _Menu({required final List<Category> categories}) = _$MenuImpl;

  @override
  List<Category> get categories;
  @override
  @JsonKey(ignore: true)
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
