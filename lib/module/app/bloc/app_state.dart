part of 'app_bloc.dart';

@freezed
class AppState extends HiveObject with _$AppState {
  @HiveType(typeId: HiveTypeId.appState, adapterName: 'AppStateAdapter')
  factory AppState({
    @Default(1) @HiveField(0, defaultValue: 1) int themeModeIndex,
    @Default('ko') @HiveField(1, defaultValue: 'ko') String languageCode,
  }) = _AppState;

  AppState._();

  ThemeMode get themeMode => ThemeMode.values.elementAt(themeModeIndex);

  Locale get locale => Locale(languageCode);
}
