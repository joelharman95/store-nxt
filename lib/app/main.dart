import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_nxt/app/app.dart';
import 'package:store_nxt/app/app_config.dart';
import 'package:store_nxt/app/locator.dart';
import 'package:store_nxt/app/routes/routes.dart';
import 'package:store_nxt/core/basics/abstract/storage_service_interface.dart';
import 'package:store_nxt/core/data/resources/storage/storage_keys.dart';
import 'package:store_nxt/ui/styles/colors.dart';

void mainCommon(Function() initializeEnvironmentVariables) {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() async {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor));
    // Initializing Firebase
    // Configuring environment variables
    await initializeEnvironmentVariables();
    // Initializing dependencies
    await setupLocator(); // Pass all uncaught errors from the framework to Crashlytics.

    await appConfig.checkInstallationId();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // Running app
    String initialRoute = await getInitialRoute();
    runApp(StoreNxtApp(
      initialRoute: initialRoute,
    ));
  }, (error, stack) {});

  Isolate.current.addErrorListener(RawReceivePort((pair) async {
    final List<dynamic> errorAndStacktrace = pair;
  }).sendPort);
}

Future<String> getInitialRoute() async {
  // final StorageInterface preference = locator<StorageInterface>();
  StorageServiceInterface storageServiceInterface =   locator<StorageServiceInterface>();
  String token = await storageServiceInterface.get(StorageKey.token);
  String isTutorial = await storageServiceInterface.get(StorageKey.isTutorial);
  String initialRoute;
  if (token == null) {
    if (isTutorial == null) {
      initialRoute = Routes.tutorial;
    } else {
      initialRoute = Routes.login;
    }
  } else {
    initialRoute = Routes.home;
  }
  return initialRoute;
}
