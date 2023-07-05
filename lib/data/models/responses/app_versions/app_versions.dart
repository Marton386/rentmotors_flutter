import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_versions.freezed.dart';
part 'app_versions.g.dart';

@freezed
class DataAppVersions with _$DataAppVersions {
  const factory DataAppVersions({
    // ignore: non_constant_identifier_names
    required int rm_android_app_min_ver,
    // ignore: non_constant_identifier_names
    required String rm_ios_app_min_ver,
  }) = _DataAppVersions;

  factory DataAppVersions.fromJson(Map<String, dynamic> json) => _$DataAppVersionsFromJson(json);
}