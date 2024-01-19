
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback.freezed.dart';
part 'feedback.g.dart';

@freezed
class Feedback with _$Feedback {
  const factory Feedback({
    required String text,
  }) = _Feedback;



  factory Feedback.fromJson(Map<String, Object?> json) => _$FeedbackFromJson(json);
}
