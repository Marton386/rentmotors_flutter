// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StationEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StationEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StationEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationEventCopyWith<$Res> {
  factory $StationEventCopyWith(
          StationEvent value, $Res Function(StationEvent) then) =
      _$StationEventCopyWithImpl<$Res, StationEvent>;
}

/// @nodoc
class _$StationEventCopyWithImpl<$Res, $Val extends StationEvent>
    implements $StationEventCopyWith<$Res> {
  _$StationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StationEventFetchCopyWith<$Res> {
  factory _$$StationEventFetchCopyWith(
          _$StationEventFetch value, $Res Function(_$StationEventFetch) then) =
      __$$StationEventFetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StationEventFetchCopyWithImpl<$Res>
    extends _$StationEventCopyWithImpl<$Res, _$StationEventFetch>
    implements _$$StationEventFetchCopyWith<$Res> {
  __$$StationEventFetchCopyWithImpl(
      _$StationEventFetch _value, $Res Function(_$StationEventFetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StationEventFetch implements StationEventFetch {
  const _$StationEventFetch();

  @override
  String toString() {
    return 'StationEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StationEventFetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StationEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StationEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StationEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class StationEventFetch implements StationEvent {
  const factory StationEventFetch() = _$StationEventFetch;
}

/// @nodoc
mixin _$StationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() update,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? update,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? update,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StationStateLoading value) loading,
    required TResult Function(StationStateLoaded value) loaded,
    required TResult Function(StationStateUpdate value) update,
    required TResult Function(StationStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StationStateLoading value)? loading,
    TResult? Function(StationStateLoaded value)? loaded,
    TResult? Function(StationStateUpdate value)? update,
    TResult? Function(StationStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StationStateLoading value)? loading,
    TResult Function(StationStateLoaded value)? loaded,
    TResult Function(StationStateUpdate value)? update,
    TResult Function(StationStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationStateCopyWith<$Res> {
  factory $StationStateCopyWith(
          StationState value, $Res Function(StationState) then) =
      _$StationStateCopyWithImpl<$Res, StationState>;
}

/// @nodoc
class _$StationStateCopyWithImpl<$Res, $Val extends StationState>
    implements $StationStateCopyWith<$Res> {
  _$StationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StationStateLoadingCopyWith<$Res> {
  factory _$$StationStateLoadingCopyWith(_$StationStateLoading value,
          $Res Function(_$StationStateLoading) then) =
      __$$StationStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StationStateLoadingCopyWithImpl<$Res>
    extends _$StationStateCopyWithImpl<$Res, _$StationStateLoading>
    implements _$$StationStateLoadingCopyWith<$Res> {
  __$$StationStateLoadingCopyWithImpl(
      _$StationStateLoading _value, $Res Function(_$StationStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StationStateLoading implements StationStateLoading {
  const _$StationStateLoading();

  @override
  String toString() {
    return 'StationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StationStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() update,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? update,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? update,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StationStateLoading value) loading,
    required TResult Function(StationStateLoaded value) loaded,
    required TResult Function(StationStateUpdate value) update,
    required TResult Function(StationStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StationStateLoading value)? loading,
    TResult? Function(StationStateLoaded value)? loaded,
    TResult? Function(StationStateUpdate value)? update,
    TResult? Function(StationStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StationStateLoading value)? loading,
    TResult Function(StationStateLoaded value)? loaded,
    TResult Function(StationStateUpdate value)? update,
    TResult Function(StationStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class StationStateLoading implements StationState {
  const factory StationStateLoading() = _$StationStateLoading;
}

/// @nodoc
abstract class _$$StationStateLoadedCopyWith<$Res> {
  factory _$$StationStateLoadedCopyWith(_$StationStateLoaded value,
          $Res Function(_$StationStateLoaded) then) =
      __$$StationStateLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StationStateLoadedCopyWithImpl<$Res>
    extends _$StationStateCopyWithImpl<$Res, _$StationStateLoaded>
    implements _$$StationStateLoadedCopyWith<$Res> {
  __$$StationStateLoadedCopyWithImpl(
      _$StationStateLoaded _value, $Res Function(_$StationStateLoaded) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StationStateLoaded implements StationStateLoaded {
  const _$StationStateLoaded();

  @override
  String toString() {
    return 'StationState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StationStateLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() update,
    required TResult Function(String error) error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? update,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? update,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StationStateLoading value) loading,
    required TResult Function(StationStateLoaded value) loaded,
    required TResult Function(StationStateUpdate value) update,
    required TResult Function(StationStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StationStateLoading value)? loading,
    TResult? Function(StationStateLoaded value)? loaded,
    TResult? Function(StationStateUpdate value)? update,
    TResult? Function(StationStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StationStateLoading value)? loading,
    TResult Function(StationStateLoaded value)? loaded,
    TResult Function(StationStateUpdate value)? update,
    TResult Function(StationStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class StationStateLoaded implements StationState {
  const factory StationStateLoaded() = _$StationStateLoaded;
}

/// @nodoc
abstract class _$$StationStateUpdateCopyWith<$Res> {
  factory _$$StationStateUpdateCopyWith(_$StationStateUpdate value,
          $Res Function(_$StationStateUpdate) then) =
      __$$StationStateUpdateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StationStateUpdateCopyWithImpl<$Res>
    extends _$StationStateCopyWithImpl<$Res, _$StationStateUpdate>
    implements _$$StationStateUpdateCopyWith<$Res> {
  __$$StationStateUpdateCopyWithImpl(
      _$StationStateUpdate _value, $Res Function(_$StationStateUpdate) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StationStateUpdate implements StationStateUpdate {
  const _$StationStateUpdate();

  @override
  String toString() {
    return 'StationState.update()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StationStateUpdate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() update,
    required TResult Function(String error) error,
  }) {
    return update();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? update,
    TResult? Function(String error)? error,
  }) {
    return update?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? update,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StationStateLoading value) loading,
    required TResult Function(StationStateLoaded value) loaded,
    required TResult Function(StationStateUpdate value) update,
    required TResult Function(StationStateError value) error,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StationStateLoading value)? loading,
    TResult? Function(StationStateLoaded value)? loaded,
    TResult? Function(StationStateUpdate value)? update,
    TResult? Function(StationStateError value)? error,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StationStateLoading value)? loading,
    TResult Function(StationStateLoaded value)? loaded,
    TResult Function(StationStateUpdate value)? update,
    TResult Function(StationStateError value)? error,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class StationStateUpdate implements StationState {
  const factory StationStateUpdate() = _$StationStateUpdate;
}

/// @nodoc
abstract class _$$StationStateErrorCopyWith<$Res> {
  factory _$$StationStateErrorCopyWith(
          _$StationStateError value, $Res Function(_$StationStateError) then) =
      __$$StationStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$StationStateErrorCopyWithImpl<$Res>
    extends _$StationStateCopyWithImpl<$Res, _$StationStateError>
    implements _$$StationStateErrorCopyWith<$Res> {
  __$$StationStateErrorCopyWithImpl(
      _$StationStateError _value, $Res Function(_$StationStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$StationStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StationStateError implements StationStateError {
  const _$StationStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'StationState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StationStateErrorCopyWith<_$StationStateError> get copyWith =>
      __$$StationStateErrorCopyWithImpl<_$StationStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() update,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? update,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? update,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StationStateLoading value) loading,
    required TResult Function(StationStateLoaded value) loaded,
    required TResult Function(StationStateUpdate value) update,
    required TResult Function(StationStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StationStateLoading value)? loading,
    TResult? Function(StationStateLoaded value)? loaded,
    TResult? Function(StationStateUpdate value)? update,
    TResult? Function(StationStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StationStateLoading value)? loading,
    TResult Function(StationStateLoaded value)? loaded,
    TResult Function(StationStateUpdate value)? update,
    TResult Function(StationStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class StationStateError implements StationState {
  const factory StationStateError({required final String error}) =
      _$StationStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$StationStateErrorCopyWith<_$StationStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
