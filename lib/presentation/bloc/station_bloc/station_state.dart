part of 'station_bloc.dart';

@freezed
class StationState with _$StationState {
  const factory StationState.loading() = StationStateLoading;
  const factory StationState.loaded() = StationStateLoaded;
  const factory StationState.update() = StationStateUpdate;
  const factory StationState.error({required String error}) = StationStateError;
}