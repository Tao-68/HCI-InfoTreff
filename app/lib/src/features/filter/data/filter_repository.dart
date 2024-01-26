import 'package:riverpod_annotation/riverpod_annotation.dart';

//import '../../../utils/logger.dart';
import '../domain/filter.dart';

part 'filter_repository.g.dart';

@riverpod
class FilterRepository extends _$FilterRepository {
  @override
  Filter build() => Filter();
}
