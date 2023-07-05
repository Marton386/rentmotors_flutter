import 'package:get_it/get_it.dart';
import 'package:rentmotors/utils/result.dart';
import '../models/responses/domain_app_ver.dart';
import '../repository/app_repository.dart';
import '../../res/generated/locale_keys.g.dart';
import '../models/responses/domain_station.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../presentation/interactors/app_interactor.dart';
import '../../data/models/responses/station/data_station.dart';
import '../../data/models/responses/app_versions/app_versions.dart';
import 'package:rentmotors/presentation/models/responses/presentation_app_ver.dart';
import 'package:rentmotors/presentation/models/responses/presentation_station.dart';

class AppInteractorImpl implements AppInteractor {
  var appRepository = GetIt.instance<AppRepository>();

  @override
  Future<Result<PresentationAppVer>> getAppVer() async {
    Result<DataAppVersions> result = await appRepository.getAppVer();
    if (result is Success<DataAppVersions>) {
      DomainAppVer data = DomainAppVer.fromData(result.data);
      return Success(data.toPress());
    } else if (result is Error<DataAppVersions>) {
      String error = result.errorCode;
      return Error(error);
    } else {
      return Error(LocaleKeys.failure.tr());
    }
  }

  @override
  Future<Result<List<PresentationStation>>> getStations() async {
    Result<List<DataStation>> result = await appRepository.getStations();
    if (result is Success<List<DataStation>>) {
      List<DomainStation> data = result.data.map((elem) => DomainStation
          .fromData(elem)).toList();
      List<PresentationStation> pressData = data.map((elem) => elem.toPress())
          .toList();
      return Success(pressData);
    } else if (result is Error<List<DataStation>>) {
      String error = result.errorCode;
      return Error(error);
    } else {
      return Error(LocaleKeys.failure.tr());
    }
  }
}