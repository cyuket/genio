import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class RegisterModule {
  // Dio get dio => Dio();
  // // InAppReview get inAppReview => InAppReview.instance;
  // Connectivity get connectivity => Connectivity();
  // RemoteConfig get remoteConfig => RemoteConfig.instance;

  // Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
}
