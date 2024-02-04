import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../core/base/base.dart';
import '../../../data/database/hive_type_id.dart';

part 'app_bloc.freezed.dart';
part 'app_bloc.g.dart';
part 'app_event.dart';
part 'app_state.dart';

/// [AppBloc] is using to manage states and events of [App]
/// Please go to [BaseBloc] to see more information about runBlocCatching
@singleton
class AppBloc extends BaseBloc<AppEvent, AppState> {
  /// Crate [AppBloc] form with data save of local
  @factoryMethod
  factory AppBloc(Box<AppState> box) {
    final AppState state = box.get(0) ?? AppState();

    return AppBloc._(state, box);
  }

  AppBloc._(super.initialState, this._box) {
    on<_ChangeThemMode>(_onAppChangeThemMode, transformer: sequential());
    on<_ChangeLocale>(_onAppChangeLocale, transformer: sequential());
  }

  final Box<AppState> _box;

  /// Change theme and save local storage
  FutureOr<void> _onAppChangeThemMode(_ChangeThemMode event, Emitter<AppState> emit) {
    emit.call(state.copyWith(themeModeIndex: event.themeMode.index));

    return _box.put(0, state);
  }

  /// Change language and save local storage
  FutureOr<void> _onAppChangeLocale(_ChangeLocale event, Emitter<AppState> emit) {
    emit.call(state.copyWith(languageCode: event.locale.languageCode));

    return _box.put(0, state);
  }
}
