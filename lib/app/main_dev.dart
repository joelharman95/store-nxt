import 'package:store_nxt/app/app_config.dart';
import 'package:store_nxt/app/parameters/dev_parameters.dart';

import 'main.dart';

main() async {
  mainCommon(() {
    AppConfig.init(DevParameter());
  });
}
