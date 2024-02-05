import 'package:hive_flutter/hive_flutter.dart';

import '../../module/app/bloc/app_bloc.dart';
import '../model/respone/user.dart';
import 'percise_date_time_adapter.dart';

abstract class HiveTypeId {
  static void init() {
    Hive.registerAdapter<DateTime>(PerciseDateTimeAdapter());
    Hive.registerAdapter<AppState>(AppStateAdapter());
    Hive.registerAdapter<User>(UserAdapter());
  }

  static const int dateTime = 0;

  static const int appState = 1;

  static const int user = 2;
}
