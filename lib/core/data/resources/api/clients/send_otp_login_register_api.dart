

import 'package:injectable/injectable.dart';
import 'package:store_nxt/core/basics/abstract/api_resource.dart';
import 'package:store_nxt/core/data/models/send_otp_login_register_model.dart';
import 'package:store_nxt/core/data/resources/api/clients/rest_api.dart';
import 'package:store_nxt/core/data/resources/api/response/api_paginated_model_response.dart';
import 'package:store_nxt/core/data/resources/api/response/api_response.dart';

@singleton
class SendOtpLoginRegisterApi extends ApiResource {
  static const GET_SEND_LOGIN_REGISTER_ENDPOINT = "auth/send-otp";
  static const GET_SEND_LOGIN_WITH_OTP_ENDPOINT = "auth/login-with-otp";
  static const GET_RESEND_LOGIN_WITH_OTP_ENDPOINT = "auth/resend-otp";
  static const GET_SEND_REGISTER_WITH_OTP_ENDPOINT = "auth/register-with-otp";

  RestApi _restApi;
  SendOtpLoginRegisterApi(RestApi restApi) : _restApi = restApi;

  Future<ApiResponse> sendOtpLogin(String mobileNumber, String otp) {
    Map<String, dynamic> data;
    if(otp != null) {
      data = {
        "mobile": mobileNumber,
        "mobile_otp": otp,
        "owner_id": 8
      };
    } else {
      data = {
        "mobile": mobileNumber,
        "owner_id": 8
      };
    }
    return _restApi.post(
        this.getUrl(otp != null ? GET_SEND_LOGIN_WITH_OTP_ENDPOINT : GET_SEND_LOGIN_REGISTER_ENDPOINT),null,queryParameters: data);
  }

  Future<ApiResponse> resendOtpLoginAndRegister(String mobileNumber, String referOtp) {
    Map<String, dynamic>  data = {
        "mobile": mobileNumber,
        "otp_ref_id": referOtp
      };
    return _restApi.post(
        this.getUrl(GET_RESEND_LOGIN_WITH_OTP_ENDPOINT),null,queryParameters: data);
  }

  Future<ApiResponse> sendOtpRegister(String mobileNumber, String otp, String firstName, String email, {String lastName}) {

    Map<String, dynamic>  data;
    if(otp != null) {
      data = {
        "owner_id": 8,
        "mobile": mobileNumber,
        "mobile_otp": otp,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "address": "",
        "description": "",
        "latitude": "",
        "longitude": ""
      };
    } else {
      data = {
        "mobile": mobileNumber,
        "owner_id": 8
      };
    };
    return _restApi.post(
        this.getUrl(otp != null ? GET_SEND_REGISTER_WITH_OTP_ENDPOINT : GET_SEND_LOGIN_REGISTER_ENDPOINT),null,queryParameters: data);
  }
}
