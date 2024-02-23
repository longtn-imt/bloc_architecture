import "package:bloc_concurrency/bloc_concurrency.dart" as concurrency;
import "package:flutter_bloc/flutter_bloc.dart";

import "../base_bloc.dart";

/// Common event transformer
mixin EventTransformerMixin<E, S> on BaseBlocDelegate<E, S> {
  /// Process events concurrently.
  EventTransformer<Event> concurrent<Event>() => concurrency.concurrent<Event>();

  /// Process events one at a time by maintaining a queue of added events and processing the events sequentially.
  EventTransformer<Event> sequential<Event>() => concurrency.sequential<Event>();

  /// Process only one event and ignore (drop) any new events until the current event is done.
  EventTransformer<Event> droppable<Event>() => concurrency.droppable<Event>();

  /// Process only one event by cancelling any pending events and processing the new event immediately.
  EventTransformer<Event> restartable<Event>() => concurrency.restartable<Event>();
}
