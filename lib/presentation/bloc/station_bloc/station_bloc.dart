import 'dart:io';
import '../../../utils/result.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import '../../interactors/app_interactor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewModels/booking_view_model.dart';
import '../../viewModels/station_view_model.dart';
import '../../../res/generated/locale_keys.g.dart';
import '../../models/responses/presentation_app_ver.dart';
import '../../models/responses/presentation_station.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_bloc.freezed.dart';
part 'station_event.dart';
part 'station_state.dart';

class StationBloc extends Bloc<StationEvent, StationState> {
  final MethodChannel _channel = const MethodChannel('pkpass_util');
  var stationViewModel = GetIt.instance<StationViewModel>();
  var appInteractor = GetIt.instance<AppInteractor>();
  final BookingViewModel startBookViewModel =
  GetIt.instance<BookingViewModel>();

  StationBloc() : super(const StationState.loading()) {
    on<StationEventFetch>((event, emit) async {
      if (stationViewModel.stations.isEmpty) {
        emit(const StationState.loading());
        String version = await getAppVersion();
        try {
          Result<PresentationAppVer> resultApp = await appInteractor
              .getAppVer();
          if (resultApp is Success<PresentationAppVer>) {
            bool checker = true;
            if (Platform.isIOS) {
              checker = checkIOSVersion(version, resultApp.data.iosMinAppVer);
            } else {
              int verAndroid = int.parse(version);
              checker = (verAndroid >= resultApp.data.androidMinAppVer);
            }
            if (checker) {
              Result<List<PresentationStation>> result = await appInteractor
                  .getStations();
              if (result is Success<List<PresentationStation>>) {
                stationViewModel.setStations(result.data);
                startBookViewModel.setStations(result.data);
                emit(const StationState.loaded());
              } else if (result is Error<List<PresentationStation>>) {
                emit(StationState.error(error: result.errorCode));
              }
            } else {
              emit(const StationState.update());
            }
          } else if (resultApp is Error<PresentationAppVer>) {
            emit(StationState.error(error: resultApp.errorCode));
          }
        } catch (e) {
          emit(StationState.error(error: LocaleKeys.failure.tr()));
        }
      } else {
        emit(const StationState.loaded());
      }
    });
  }

  Future<String> getAppVersion() async {
    try {
      final version = await _channel.invokeMethod('getAppVersion');
      return version;
    } catch (e) {
      return "0.0";
    }
  }

  bool checkIOSVersion(String appVersion, String targetVersion) {
    List<int> appComponents = appVersion.split('.').map(int.parse).toList();
    List<int> targetComponents = targetVersion.split('.').map(int.parse).toList();

    while (appComponents.length < targetComponents.length) {
      appComponents.add(0);
    }
    while (targetComponents.length < appComponents.length) {
      targetComponents.add(0);
    }

    for (int i = 0; i < appComponents.length; i++) {
      if (appComponents[i] < targetComponents[i]) {
        return false;
      } else if (appComponents[i] > targetComponents[i]) {
        return true;
      }
    }
    return true;
  }
}