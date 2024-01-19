import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api.dart';
import '../../../exceptions/api_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../../utils/logger.dart';
import '../domain/menu.dart';

part 'menu_repository.g.dart';

class MenuRepository {
  MenuRepository({required this.dio});
  final Dio dio;

  String _getUrl({int? id}) {
    final url =
        Uri(scheme: Api.schema, host: Api.host, path: Api.menuPath).toString();
    if (id != null) {
      return '$url$id';
    } else {
      return url;
    }
  }

  Future<List<Category>> getMenu() async {
    logger.d('menu_repository.getMenu');
    final url = _getUrl();
    final response = await dio.get<List<dynamic>>(url);
    if (response.statusCode == 200 && response.data != null) {
      final dataList = response.data!;
      return dataList
          .map(
            (menuJson) => Category.fromJson(menuJson as Map<String, Object?>),
          )
          .toList();
    } else {
      throw ApiException(
        response.statusCode ?? -1,
        'getMenu ${response.statusCode}, data=${response.data}',
      );
    }
  }
}

@riverpod
MenuRepository menuRepository(MenuRepositoryRef ref) =>
    MenuRepository(dio: ref.read(dioProvider));

@riverpod
Future<List<Category>> fetchMenu(FetchMenuRef ref) async {
  logger.d('menu_repository.menuEvents');
  final repo = ref.read(menuRepositoryProvider);
  return repo.getMenu();
}
