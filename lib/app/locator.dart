import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:store_nxt/app/locator.config.dart';

final locator = GetIt.instance;

@injectableInit
setupLocator() => $initGetIt(locator);
