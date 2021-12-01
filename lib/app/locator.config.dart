// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../core/basics/abstract/storage_service_interface.dart' as _i5;
import '../core/data/resources/api/api_interceptor.dart' as _i3;
import '../core/data/resources/api/clients/logout_api.dart' as _i8;
import '../core/data/resources/api/clients/my_profile_api.dart' as _i9;
import '../core/data/resources/api/clients/rest_api.dart' as _i6;
import '../core/data/resources/api/clients/send_otp_login_register_api.dart' as _i7;
import '../core/data/resources/storage/shared_preferences_storage_service.dart' as _i11;
import '../core/data/resources/storage/storage_services.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get, {String environment, _i2.EnvironmentFilter environmentFilter}) async {
  final getHelper = _i2.GetItHelper(get, environment, environmentFilter);
  final storageServices = _$StorageServices();
  getHelper.factory<_i3.ApiInterceptor>(() => _i3.ApiInterceptor());
  await getHelper.factoryAsync<_i4.SharedPreferences>(() => storageServices.sharedPreferences, preResolve: true);
  getHelper.factory<_i5.StorageServiceInterface>(() => storageServices.sharedPreferencesStorageService);
  getHelper.singleton<_i6.RestApi>(_i6.RestApi(get<_i3.ApiInterceptor>()));
  getHelper.singleton<_i7.SendOtpLoginRegisterApi>(_i7.SendOtpLoginRegisterApi(get<_i6.RestApi>()));
  getHelper.singleton<_i8.LogoutApi>(_i8.LogoutApi(get<_i6.RestApi>()));
  getHelper.singleton<_i9.MyProfileApi>(_i9.MyProfileApi(get<_i6.RestApi>()));
  return get;
}

class _$StorageServices extends _i10.StorageServices {
  @override
  _i11.SharedPreferencesStorageService get sharedPreferencesStorageService => _i11.SharedPreferencesStorageService();
}
