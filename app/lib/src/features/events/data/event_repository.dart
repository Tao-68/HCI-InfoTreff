import 'dart:convert';

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
    final url = Uri(scheme: Api.schema, host: Api.host, path: Api.eventsPath)
        .toString();
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

  //Könnte sein das das nicht funktioniert, jedenfalls nicht so wie gewollt
  Future<bool> changeEventLike(
      {required Event event, required bool like}) async {
    logger.d('event_repository.changeEventLike');
    final url = _getUrl(id: event.id);
    final response = await dio.get<String>(url);
    if (response.statusCode == 200 && response.data != null) {
      final eventServer =
          Event.fromJson(json.decode(response.data!) as Map<String, Object?>);

      int likeVal = eventServer.likes;
      if (like) {
        likeVal++;
      } else {
        likeVal--;
      }
      final responsePatch =
          await dio.patch<String>(url, data: json.encode({'likes': likeVal}));
      if (responsePatch.statusCode == 200 && response.data != null) {
        final eventUpdated =
            Event.fromJson(json.decode(response.data!) as Map<String, Object?>);
        return true;
      } else {
        throw ApiException(
          responsePatch.statusCode ?? -1,
          'likeEvent ${responsePatch.statusCode}, data=${response.data}',
        );
      }
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

@riverpod
Future<bool> likeEvent(LikeEventRef ref, Event event,
    {required bool like}) async {
  logger.d('event_repository.likeEvent');
  final repo = ref.read(eventRepositoryProvider);
  return repo.changeEventLike(event: event, like: like);
}
