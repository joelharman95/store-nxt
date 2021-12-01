import 'package:flutter/cupertino.dart';
import 'package:store_nxt/app/parameters/base_parameters.dart';
import 'package:store_nxt/app/routes/router.dart';

AppConfig get appConfig => _appConfig;
AppConfig _appConfig;

class AppConfig {
  final BaseParameter parameters;
  final AppRouter router;
  final GlobalKey<NavigatorState> mainNavigatorKey =
      GlobalKey<NavigatorState>();
  AppConfig._init({this.parameters, this.router});

  static init(BaseParameter parameters) async {
    _appConfig ??= AppConfig._init(parameters: parameters, router: AppRouter());
  }

  Future<void> checkInstallationId() async {}
}
