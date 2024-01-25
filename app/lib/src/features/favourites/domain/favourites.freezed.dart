// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourites.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Favourites {
  Set<Event> get events => throw _privateConstructorUsedError;
  Set<Item> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouritesCopyWith<Favourites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritesCopyWith<$Res> {
  factory $FavouritesCopyWith(
          Favourites value, $Res Function(Favourites) then) =
      _$FavouritesCopyWithImpl<$Res, Favourites>;
  @useResult
  $Res call({Set<Event> events, Set<Item> items});
}

/// @nodoc
class _$FavouritesCopyWithImpl<$Res, $Val extends Favourites>
    implements $FavouritesCopyWith<$Res> {
  _$FavouritesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as Set<Event>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Set<Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavouritesImplCopyWith<$Res>
    implements $FavouritesCopyWith<$Res> {
  factory _$$FavouritesImplCopyWith(
          _$FavouritesImpl value, $Res Function(_$FavouritesImpl) then) =
      __$$FavouritesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<Event> events, Set<Item> items});
}

/// @nodoc
class __$$FavouritesImplCopyWithImpl<$Res>
    extends _$FavouritesCopyWithImpl<$Res, _$FavouritesImpl>
    implements _$$FavouritesImplCopyWith<$Res> {
  __$$FavouritesImplCopyWithImpl(
      _$FavouritesImpl _value, $Res Function(_$FavouritesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? items = null,
  }) {
    return _then(_$FavouritesImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as Set<Event>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as Set<Item>,
    ));
  }
}

/// @nodoc

class _$FavouritesImpl with DiagnosticableTreeMixin implements _Favourites {
  const _$FavouritesImpl(
      {required final Set<Event> events, required final Set<Item> items})
      : _events = events,
        _items = items;

  final Set<Event> _events;
  @override
  Set<Event> get events {
    if (_events is EqualUnmodifiableSetView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_events);
  }

  final Set<Item> _items;
  @override
  Set<Item> get items {
    if (_items is EqualUnmodifiableSetView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_items);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Favourites(events: $events, items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Favourites'))
      ..add(DiagnosticsProperty('events', events))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouritesImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouritesImplCopyWith<_$FavouritesImpl> get copyWith =>
      __$$FavouritesImplCopyWithImpl<_$FavouritesImpl>(this, _$identity);
}

abstract class _Favourites implements Favourites {
  const factory _Favourites(
      {required final Set<Event> events,
      required final Set<Item> items}) = _$FavouritesImpl;

  @override
  Set<Event> get events;
  @override
  Set<Item> get items;
  @override
  @JsonKey(ignore: true)
  _$$FavouritesImplCopyWith<_$FavouritesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
