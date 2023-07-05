import '../../../data/models/responses/app_versions/app_versions.dart';
import '../../../presentation/models/responses/presentation_app_ver.dart';

class DomainAppVer {
  final int androidMinAppVer;
  final String iosMinAppVer;

  DomainAppVer ({
    required this.androidMinAppVer,
    required this.iosMinAppVer,
  });

  factory DomainAppVer.fromData(DataAppVersions data) {
    return DomainAppVer(
      androidMinAppVer: data.rm_android_app_min_ver,
      iosMinAppVer: data.rm_ios_app_min_ver,
    );
  }

  PresentationAppVer toPress() {
    return PresentationAppVer(
      androidMinAppVer: androidMinAppVer,
      iosMinAppVer: iosMinAppVer,
    );
  }
}