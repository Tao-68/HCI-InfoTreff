import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api.dart';
import '../../../exceptions/api_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../../utils/logger.dart';
import '../domain/feedback.dart';

part 'feedback_repository.g.dart';

class FeedbackRepository {
  FeedbackRepository ({required this.dio});
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

  Future<Feedback> saveFeedback({required Feedback feedback}) async {
    logger.d('feedbackRepository.saveFeedback');
    final url = _getUrl();
    final response = await dio.post<String>(url, data: feedback.toJson());

    if (response.statusCode == 201 && response.data != null) {
      final newFeedback =
          Feedback.fromJson
            (json.decode(response.data!)as Map<String, Object?>);
      return newFeedback;
    } else {
      throw ApiException(
        response.statusCode ?? -1,
        'saveFeedback ${response.statusCode}, data=${response.data}',
      );
    }
  }

  Future<bool> deleteFeedback(int id) async {
    logger.d('feedbackRepository.deleteFeedback');
    final url = _getUrl(id: id);
    final response = await dio.delete<String>(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ApiException(
        response.statusCode ?? -1,
        'deleteFeedback ${response.statusCode}, data=${response.data}',
      );
    }
  }
}

@riverpod
FeedbackRepository feedbackRepository (FeedbackRepositoryRef ref) {
  return FeedbackRepository(dio: ref.read(dioProvider));
}
