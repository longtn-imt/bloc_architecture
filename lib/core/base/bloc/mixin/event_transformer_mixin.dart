import 'package:bloc_concurrency/bloc_concurrency.dart' as concurrency;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base_bloc.dart';

mixin EventTransformerMixin<E, S> on BaseBlocDelegate<E, S> {
  /// process events concurrently
  EventTransformer<Event> concurrent<Event>() => concurrency.concurrent<Event>();

  /// process events sequentially
  EventTransformer<Event> sequential<Event>() => concurrency.sequential<Event>();

  /// ignore any events added while an event is processing
  EventTransformer<Event> droppable<Event>() => concurrency.droppable<Event>();

  /// process only the latest event and cancel previous event handlers
  EventTransformer<Event> restartable<Event>() => concurrency.restartable<Event>();
}
