// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;

import '../errors/network_info.dart' as _i5;
import '../navigators/navigation_service.dart' as _i4;
import '../utils/third_party_mode_env.dart' as _i6;
import 'register_module.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i4.NavigationService>(() => _i4.NavigationService());
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i5.NetworkInfoImpl(get<_i3.InternetConnectionChecker>()));
  gh.singleton<_i6.ThirdPartyModeEnv>(_i6.ThirdPartyModeEnv());
  return get;
}

class _$RegisterModule extends _i7.RegisterModule {}
