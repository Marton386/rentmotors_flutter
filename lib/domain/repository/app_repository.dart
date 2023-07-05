import '../../utils/result.dart';
import '../../data/models/responses/station/data_station.dart';
import '../../data/models/responses/app_versions/app_versions.dart';

abstract class AppRepository {
  Future<Result<DataAppVersions>> getAppVer();
  Future<Result<List<DataStation>>> getStations();
}