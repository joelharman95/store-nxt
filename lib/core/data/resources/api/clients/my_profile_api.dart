import 'package:injectable/injectable.dart';
import 'package:store_nxt/core/basics/abstract/api_resource.dart';
import 'package:store_nxt/core/data/resources/api/clients/rest_api.dart';
import 'package:store_nxt/core/data/resources/api/response/api_response.dart';

@singleton
class MyProfileApi extends ApiResource {
  static const GET_SEND_MY_PROFILE_ENDPOINT = "auth/get-my-profile";

  RestApi _restApi;

  MyProfileApi(RestApi restApi) : _restApi = restApi;


  Future<ApiResponse> getMyProfile() {
    return _restApi.post(
        this.getUrl(GET_SEND_MY_PROFILE_ENDPOINT), null);
  }

}
