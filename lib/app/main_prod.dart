import 'package:store_nxt/app/app_config.dart';
import 'package:store_nxt/app/main.dart';
import 'package:store_nxt/app/parameters/prod_parameters.dart';

main() async {
  mainCommon(() {
    AppConfig.init(ProdParameter());
  });
}
