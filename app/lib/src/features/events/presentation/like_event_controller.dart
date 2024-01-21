import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/logger.dart';
import '../data/event_repository.dart';
import '../domain/event.dart';

part 'like_event_controller.g.dart';

// in some cases it might be good to store the current selected item in a
// separate provider
// final currentPersonProvider = StateProvider<Person?>((ref) {
//   return null;
// });

@riverpod
class LikeEventController extends _$LikeEventController {
  @override
  FutureOr<Event?> build() {
    ref.onDispose(
      () => logger.i('LikeEventController ----- dispose controller -----'),
    );
    state = const AsyncData(null);
    return state.value;
  }

  Future<void> like({required Event event, required bool like}) async {
    state = const AsyncLoading<Event?>();
    try {
      final repo = ref.read(eventRepositoryProvider);
      await repo.changeEventLike(event: event, like: like);
      ref.invalidate(fetchEventsProvider);
      state = const AsyncData(null);
    } catch (error) {
      state = AsyncError<Event?>(error, StackTrace.current);
    }
  }
}
