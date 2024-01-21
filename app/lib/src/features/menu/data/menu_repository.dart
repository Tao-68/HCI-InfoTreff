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
    final url = Uri(scheme: Api.schema, host: Api.host, path: Api.menuPath)
        .toString();
    if (id != null) {
      return '$url$id';
    } else {
      return url;
    }
  }

  Future<Menu> getMenu() async {
    logger.d('menu_repository.getMenu');
    final url = _getUrl();
    final response = await dio.get<List<dynamic>>(url);
    if (response.statusCode == 200 && response.data != null) {
      return Menu.fromJson(response.data!);
    } else {
      throw ApiException(
        response.statusCode ?? -1,
        'getMenu ${response.statusCode}, data=${response.data}',
      );
    }
  }

  Future<void> changeMenuLike({
      required Item item,
      required bool like,
    }) async {
      logger.d('menu_repository.changeMenuLike');

      // final url = _getUrl(id: item.id);
      // final response = await dio.get<String>(url);
      // if (response.statusCode == 200 && response.data != null) {
      //   final itemServer =
      //       Item.fromJson(json.decode(response.data!) as Map<String, Object?>);

      //   int likeVal = itemServer.likes;
      //   if (like) {
      //     likeVal++;
      //   } else {
      //     likeVal--;
      //   }
      //   final responsePatch =
      //       await dio.patch<String>(url, data: json.encode({'likes': likeVal}));
      //   if (responsePatch.statusCode == 200 && response.data != null) {
      //     final eventUpdated =
      //         Item.fromJson(json.decode(response.data!) as Map<String, Object?>);
      //     return true;
      //   } else {
      //     throw ApiException(
      //       responsePatch.statusCode ?? -1,
      //       'likeEvent ${responsePatch.statusCode}, data=${response.data}',
      //     );
      //   }
      // } else {
      //   throw ApiException(
      //     response.statusCode ?? -1,
      //     'getEvent ${response.statusCode}, data=${response.data}',
      //   );
      // }
    }
}


@riverpod
MenuRepository menuRepository(MenuRepositoryRef ref) =>
    MenuRepository(
      dio: ref.read(dioProvider), 
    );

@riverpod
Future<Menu> fetchMenu(FetchMenuRef ref) async {
  logger.d('menu_repository.menuEvents');
  final repo = ref.read(menuRepositoryProvider);
  return repo.getMenu();
}
