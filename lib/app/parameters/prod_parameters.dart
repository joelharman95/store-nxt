import 'package:store_nxt/app/parameters/base_parameters.dart';

class ProdParameter extends BaseParameter {
  // TODO set correct configuration
  const ProdParameter()
      : super(
            appName: "Claas",
            clientId: "",
            clientSecret: "",
            gmapWebKey: "AIzaSyC0_qlfTtQXCqDJkM7prmZXljV78aZ-UZY",
            baseUrl: "https://d1.storenxt.in/api/customer/");

  @override
  Flavor get flavor => Flavor.production;
}
