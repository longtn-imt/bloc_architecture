import 'package:hive_flutter/hive_flutter.dart';

import 'hive_type_id.dart';

/// Increase precision of datetime adapte
/// With comment: https://github.com/isar/hive/issues/474#issuecomment-730562545
///
/// Using adapte:
/// ```dart
/// Hive.initFlutter();
/// Hive.registerAdapter(PerciseDateTimeAdapter(), override: true, internal: true);
/// ```
class PerciseDateTimeAdapter extends TypeAdapter<DateTime> {
  @override
  final int typeId = HiveTypeId.dateTime;

  @override
  DateTime read(BinaryReader reader) {
    final int micros = reader.readInt();
    final bool isUtc = reader.readBool();

    return DateTime.fromMicrosecondsSinceEpoch(micros, isUtc: isUtc);
  }

  @override
  void write(BinaryWriter writer, DateTime obj) {
    writer.writeInt(obj.microsecondsSinceEpoch);
    writer.writeBool(obj.isUtc);
  }
}
