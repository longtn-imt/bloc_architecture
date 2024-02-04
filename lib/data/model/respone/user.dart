import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../database/hive_type_id.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @HiveType(typeId: HiveTypeId.user, adapterName: 'UserAdapter')
  const factory User({
    @HiveField(0) int? id,
    @HiveField(1) String? name,
    @HiveField(2) String? phone,
    @HiveField(3) String? email,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
