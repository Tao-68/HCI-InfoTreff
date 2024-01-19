// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventRepositoryHash() => r'0b62e70f121bfe0dbf25a29fccdea8244a8279c5';

/// See also [eventRepository].
@ProviderFor(eventRepository)
final eventRepositoryProvider = AutoDisposeProvider<EventRepository>.internal(
  eventRepository,
  name: r'eventRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EventRepositoryRef = AutoDisposeProviderRef<EventRepository>;
String _$fetchEventsHash() => r'bad9ffeec2d7c288c568a9a3a8a9b532cec032ab';

/// See also [fetchEvents].
@ProviderFor(fetchEvents)
final fetchEventsProvider = AutoDisposeFutureProvider<List<Event>>.internal(
  fetchEvents,
  name: r'fetchEventsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchEventsRef = AutoDisposeFutureProviderRef<List<Event>>;
String _$likeEventHash() => r'e128c98f06dcaa5fdd7cbf8bf486832eaba31ac7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [likeEvent].
@ProviderFor(likeEvent)
const likeEventProvider = LikeEventFamily();

/// See also [likeEvent].
class LikeEventFamily extends Family<AsyncValue<bool>> {
  /// See also [likeEvent].
  const LikeEventFamily();

  /// See also [likeEvent].
  LikeEventProvider call(
    Event event, {
    required bool like,
  }) {
    return LikeEventProvider(
      event,
      like: like,
    );
  }

  @override
  LikeEventProvider getProviderOverride(
    covariant LikeEventProvider provider,
  ) {
    return call(
      provider.event,
      like: provider.like,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'likeEventProvider';
}

/// See also [likeEvent].
class LikeEventProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [likeEvent].
  LikeEventProvider(
    Event event, {
    required bool like,
  }) : this._internal(
          (ref) => likeEvent(
            ref as LikeEventRef,
            event,
            like: like,
          ),
          from: likeEventProvider,
          name: r'likeEventProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$likeEventHash,
          dependencies: LikeEventFamily._dependencies,
          allTransitiveDependencies: LikeEventFamily._allTransitiveDependencies,
          event: event,
          like: like,
        );

  LikeEventProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.event,
    required this.like,
  }) : super.internal();

  final Event event;
  final bool like;

  @override
  Override overrideWith(
    FutureOr<bool> Function(LikeEventRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LikeEventProvider._internal(
        (ref) => create(ref as LikeEventRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        event: event,
        like: like,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _LikeEventProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LikeEventProvider &&
        other.event == event &&
        other.like == like;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, event.hashCode);
    hash = _SystemHash.combine(hash, like.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LikeEventRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `event` of this provider.
  Event get event;

  /// The parameter `like` of this provider.
  bool get like;
}

class _LikeEventProviderElement extends AutoDisposeFutureProviderElement<bool>
    with LikeEventRef {
  _LikeEventProviderElement(super.provider);

  @override
  Event get event => (origin as LikeEventProvider).event;
  @override
  bool get like => (origin as LikeEventProvider).like;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

typedef LikeEventsRef = AutoDisposeProviderRef<List<Event>>;
