// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_versions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataAppVersions _$DataAppVersionsFromJson(Map<String, dynamic> json) {
  return _DataAppVersions.fromJson(json);
}

/// @nodoc
mixin _$DataAppVersions {
// ignore: non_constant_identifier_names
  int get rm_android_app_min_ver =>
      throw _privateConstructorUsedError; // ignore: non_constant_identifier_names
  String get rm_ios_app_min_ver => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataAppVersionsCopyWith<DataAppVersions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataAppVersionsCopyWith<$Res> {
  factory $DataAppVersionsCopyWith(
          DataAppVersions value, $Res Function(DataAppVersions) then) =
      _$DataAppVersionsCopyWithImpl<$Res, DataAppVersions>;
  @useResult
  $Res call({int rm_android_app_min_ver, String rm_ios_app_min_ver});
}

/// @nodoc
class _$DataAppVersionsCopyWithImpl<$Res, $Val extends DataAppVersions>
    implements $DataAppVersionsCopyWith<$Res> {
  _$DataAppVersionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rm_android_app_min_ver = null,
    Object? rm_ios_app_min_ver = null,
  }) {
    return _then(_value.copyWith(
      rm_android_app_min_ver: null == rm_android_app_min_ver
          ? _value.rm_android_app_min_ver
          : rm_android_app_min_ver // ignore: cast_nullable_to_non_nullable
              as int,
      rm_ios_app_min_ver: null == rm_ios_app_min_ver
          ? _value.rm_ios_app_min_ver
          : rm_ios_app_min_ver // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataAppVersionsCopyWith<$Res>
    implements $DataAppVersionsCopyWith<$Res> {
  factory _$$_DataAppVersionsCopyWith(
          _$_DataAppVersions value, $Res Function(_$_DataAppVersions) then) =
      __$$_DataAppVersionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int rm_android_app_min_ver, String rm_ios_app_min_ver});
}

/// @nodoc
class __$$_DataAppVersionsCopyWithImpl<$Res>
    extends _$DataAppVersionsCopyWithImpl<$Res, _$_DataAppVersions>
    implements _$$_DataAppVersionsCopyWith<$Res> {
  __$$_DataAppVersionsCopyWithImpl(
      _$_DataAppVersions _value, $Res Function(_$_DataAppVersions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rm_android_app_min_ver = null,
    Object? rm_ios_app_min_ver = null,
  }) {
    return _then(_$_DataAppVersions(
      rm_android_app_min_ver: null == rm_android_app_min_ver
          ? _value.rm_android_app_min_ver
          : rm_android_app_min_ver // ignore: cast_nullable_to_non_nullable
              as int,
      rm_ios_app_min_ver: null == rm_ios_app_min_ver
          ? _value.rm_ios_app_min_ver
          : rm_ios_app_min_ver // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataAppVersions implements _DataAppVersions {
  const _$_DataAppVersions(
      {required this.rm_android_app_min_ver, required this.rm_ios_app_min_ver});

  factory _$_DataAppVersions.fromJson(Map<String, dynamic> json) =>
      _$$_DataAppVersionsFromJson(json);

// ignore: non_constant_identifier_names
  @override
  final int rm_android_app_min_ver;
// ignore: non_constant_identifier_names
  @override
  final String rm_ios_app_min_ver;

  @override
  String toString() {
    return 'DataAppVersions(rm_android_app_min_ver: $rm_android_app_min_ver, rm_ios_app_min_ver: $rm_ios_app_min_ver)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataAppVersions &&
            (identical(other.rm_android_app_min_ver, rm_android_app_min_ver) ||
                other.rm_android_app_min_ver == rm_android_app_min_ver) &&
            (identical(other.rm_ios_app_min_ver, rm_ios_app_min_ver) ||
                other.rm_ios_app_min_ver == rm_ios_app_min_ver));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rm_android_app_min_ver, rm_ios_app_min_ver);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataAppVersionsCopyWith<_$_DataAppVersions> get copyWith =>
      __$$_DataAppVersionsCopyWithImpl<_$_DataAppVersions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataAppVersionsToJson(
      this,
    );
  }
}

abstract class _DataAppVersions implements DataAppVersions {
  const factory _DataAppVersions(
      {required final int rm_android_app_min_ver,
      required final String rm_ios_app_min_ver}) = _$_DataAppVersions;

  factory _DataAppVersions.fromJson(Map<String, dynamic> json) =
      _$_DataAppVersions.fromJson;

  @override // ignore: non_constant_identifier_names
  int get rm_android_app_min_ver;
  @override // ignore: non_constant_identifier_names
  String get rm_ios_app_min_ver;
  @override
  @JsonKey(ignore: true)
  _$$_DataAppVersionsCopyWith<_$_DataAppVersions> get copyWith =>
      throw _privateConstructorUsedError;
}
