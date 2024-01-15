import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api.dart';
import '../../../exceptions/api_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../../utils/logger.dart';
import '../domain/event.dart';

part 'event_repository.g.dart';

class EventRepository {
  EventRepository({required this.dio});
  final Dio dio;

  String _getUrl({int? id}) {
    final url =
        Uri(scheme: Api.schema, host: Api.host, path: Api.path).toString();
    if (id != null) {
      return '$url$id';
    } else {
      return url;
    }
  }

  Future<List<Event>> getEvents() async {
    logger.d('event_repository.getEvent');
    final url = _getUrl();
    final response = await dio.get<List<dynamic>>(url);
    if (response.statusCode == 200 && response.data != null) {
      final dataList = response.data!;
      return dataList
          .map(
            (eventJson) => Event.fromJson(eventJson as Map<String, Object?>),
          )
          .toList();
    } else {
      throw ApiException(
        response.statusCode ?? -1,
        'getEvent ${response.statusCode}, data=${response.data}',
      );
    }
  }
}

@riverpod
EventRepository eventRepository(EventRepositoryRef ref) =>
    EventRepository(dio: ref.read(dioProvider));

@riverpod
Future<List<Event>> fetchEvents(FetchEventsRef ref) async {
  logger.d('event_repository.fetchEvents');
  final repo = ref.read(eventRepositoryProvider);
  return repo.getEvents();
}
