import '../../utils/result.dart';
import '../models/responses/presentation_app_ver.dart';
import 'package:rentmotors/presentation/models/responses/presentation_station.dart';

abstract class AppInteractor {
  Future<Result<PresentationAppVer>> getAppVer();
  Future<Result<List<PresentationStation>>> getStations();
}