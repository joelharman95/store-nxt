import 'package:injectable/injectable.dart';
import 'package:store_nxt/core/basics/abstract/api_resource.dart';
import 'package:store_nxt/core/data/resources/api/clients/rest_api.dart';
import 'package:store_nxt/core/data/resources/api/response/api_response.dart';

@singleton
class LogoutApi extends ApiResource {
  static const GET_LOGOUT_ENDPOINT = "auth/logout";

  RestApi _restApi;

  LogoutApi(RestApi restApi) : _restApi = restApi;

  Future<ApiResponse> postLogout() {
    return _restApi.delete(this.getUrl(GET_LOGOUT_ENDPOINT));
  }
}
