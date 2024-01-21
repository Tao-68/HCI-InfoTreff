// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$menuRepositoryHash() => r'1f1a6c08b4584ecddb51c683e484414f99f8b9ca';

/// See also [menuRepository].
@ProviderFor(menuRepository)
final menuRepositoryProvider = AutoDisposeProvider<MenuRepository>.internal(
  menuRepository,
  name: r'menuRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$menuRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MenuRepositoryRef = AutoDisposeProviderRef<MenuRepository>;
String _$fetchMenuHash() => r'123e155318003b8c53c1bf70e2b2ae7ec60f32f4';

/// See also [fetchMenu].
@ProviderFor(fetchMenu)
final fetchMenuProvider = AutoDisposeFutureProvider<Menu>.internal(
  fetchMenu,
  name: r'fetchMenuProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchMenuHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchMenuRef = AutoDisposeFutureProviderRef<Menu>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
