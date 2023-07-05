import 'package:get_it/get_it.dart';
import 'package:rentmotors/data/models/responses/app_versions/app_versions.dart';
import '../storage/network_storage.dart';
import 'package:rentmotors/utils/result.dart';
import '../../domain/repository/app_repository.dart';
import 'package:rentmotors/data/models/responses/station/data_station.dart';

class AppRepositoryImpl implements AppRepository {
  var networkStore = GetIt.instance<NetworkStorage>();

  @override
  Future<Result<DataAppVersions>> getAppVer() {
    return networkStore.checkAppVer();
  }

  @override
  Future<Result<List<DataStation>>> getStations() async {
    return networkStore.getStations();
  }
}