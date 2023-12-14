// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$peopleRepositoryHash() => r'd0e91e6cbf45120cbcd670b6cc99fe71a9d76429';

/// See also [peopleRepository].
@ProviderFor(peopleRepository)
final peopleRepositoryProvider = AutoDisposeProvider<PeopleRepository>.internal(
  peopleRepository,
  name: r'peopleRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$peopleRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PeopleRepositoryRef = AutoDisposeProviderRef<PeopleRepository>;
String _$fetchPeopleHash() => r'54515a223c9fa0e4b082b37cf022284a41b8575b';

/// See also [fetchPeople].
@ProviderFor(fetchPeople)
final fetchPeopleProvider = AutoDisposeFutureProvider<List<Person>>.internal(
  fetchPeople,
  name: r'fetchPeopleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchPeopleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchPeopleRef = AutoDisposeFutureProviderRef<List<Person>>;
String _$fetchPersonByIdHash() => r'ab1560261f3491819dc88719e855f1c9b973ed21';

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

/// See also [fetchPersonById].
@ProviderFor(fetchPersonById)
const fetchPersonByIdProvider = FetchPersonByIdFamily();

/// See also [fetchPersonById].
class FetchPersonByIdFamily extends Family<AsyncValue<Person>> {
  /// See also [fetchPersonById].
  const FetchPersonByIdFamily();

  /// See also [fetchPersonById].
  FetchPersonByIdProvider call(
    int id,
  ) {
    return FetchPersonByIdProvider(
      id,
    );
  }

  @override
  FetchPersonByIdProvider getProviderOverride(
    covariant FetchPersonByIdProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'fetchPersonByIdProvider';
}

/// See also [fetchPersonById].
class FetchPersonByIdProvider extends AutoDisposeFutureProvider<Person> {
  /// See also [fetchPersonById].
  FetchPersonByIdProvider(
    int id,
  ) : this._internal(
          (ref) => fetchPersonById(
            ref as FetchPersonByIdRef,
            id,
          ),
          from: fetchPersonByIdProvider,
          name: r'fetchPersonByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPersonByIdHash,
          dependencies: FetchPersonByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchPersonByIdFamily._allTransitiveDependencies,
          id: id,
        );

  FetchPersonByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Person> Function(FetchPersonByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPersonByIdProvider._internal(
        (ref) => create(ref as FetchPersonByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Person> createElement() {
    return _FetchPersonByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPersonByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchPersonByIdRef on AutoDisposeFutureProviderRef<Person> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchPersonByIdProviderElement
    extends AutoDisposeFutureProviderElement<Person> with FetchPersonByIdRef {
  _FetchPersonByIdProviderElement(super.provider);

  @override
  int get id => (origin as FetchPersonByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
