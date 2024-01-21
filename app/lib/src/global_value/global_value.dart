import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final likeViewProvider = StateNotifierProvider<likeViewNotifier, bool?> (
  (ref) => likeViewNotifier(),
  );

class likeViewNotifier extends StateNotifier<bool?> {
  likeViewNotifier() : super(false);

  void changeValue (bool? value) {
    state = value;
  }
}

final hideParticipantProvider = StateNotifierProvider<hideParticipantNotifier, bool?> 
  ((ref) => hideParticipantNotifier());

class hideParticipantNotifier extends StateNotifier<bool?> {
  hideParticipantNotifier() : super(false);

  void changeValue(bool? value) {
    state = value;
  }
}
