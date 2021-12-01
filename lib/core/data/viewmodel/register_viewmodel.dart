import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:store_nxt/app/locator.dart';
import 'package:store_nxt/app/routes/routes.dart';
import 'package:store_nxt/core/basics/abstract/storage_service_interface.dart';
import 'package:store_nxt/core/data/models/send_otp_login_register_model.dart';
import 'package:store_nxt/core/data/resources/api/clients/send_otp_login_register_api.dart';
import 'package:store_nxt/core/data/resources/api/response/api_response.dart';
import 'package:store_nxt/core/data/resources/storage/storage_keys.dart';
import 'package:store_nxt/core/service/dialog.service.dart';
import 'package:store_nxt/ui/screens/home_screen.dart';
import 'package:store_nxt/ui/styles/constants.dart';

class RegisterViewModel extends BaseViewModel {
  TextEditingController nameTextEditingcontroller = TextEditingController();
  TextEditingController emailTextEditingcontroller = TextEditingController();
  TextEditingController mobileTextEditingcontroller = TextEditingController();
  TextEditingController otpTextEditingcontroller = TextEditingController();
  bool isOtp = false;
  FocusNode mobileFocus = FocusNode();
  FocusNode otpFocus = FocusNode();
  bool isCheckBox = false;
  SendOtpForRegisterAndLoginModel sendOtpLoginRegisterDetail;


  RegisterViewModel({this.isOtp});
  bool isValidEmail(String text) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(text);
  }

  registerValidation(BuildContext context) async {
    String message = "";

    if(isOtp) {
      if(isCheckBox) {
        if (otpTextEditingcontroller.text.isNotEmpty &&
            otpTextEditingcontroller.text.length == 6) {
          otpFocus.unfocus();
          await sendOtpRegisterApi(
              mobileTextEditingcontroller.text, emailTextEditingcontroller.text,
              nameTextEditingcontroller.text, context: context,
              otp: otpTextEditingcontroller.text);
        } else if (otpTextEditingcontroller.text.isEmpty) {
          message = "Enter OTP";
        } else {
          message = "The entered OTP is invalid.";
        }
      } else {
        message = "Please accept the Terms of Services & Privacy Policies";
      }
    } else {
        if (nameTextEditingcontroller.text.isEmpty) {
          message = "Please provide valid name";
        } else if (emailTextEditingcontroller.text.isEmpty || !(isValidEmail(emailTextEditingcontroller.text))) {
          message = "Please provide valid Email ID";
        }  else if (AppConstants.validateMobile(mobileTextEditingcontroller.text) !=
            null) {
          message = "Please enter a valid mobile number";
        } else if(!isCheckBox) {
          message = "Please accept the Terms of Services & Privacy Policies";
        }
        else {
          await sendOtpRegisterApi(mobileTextEditingcontroller.text, emailTextEditingcontroller.text, nameTextEditingcontroller.text, context: context);
      }
    }
    if(message.isNotEmpty)
      DialogService.of(context).showError(message);

    notifyListeners();
  }


  sendOtpRegisterApi(String mobileNumber, String email, String firstName, {String otp, BuildContext context}) async {
    setBusy(true);
    try {
      ApiResponse response = await locator<SendOtpLoginRegisterApi>()
          .sendOtpRegister(mobileNumber, otp, firstName, email);
      if (response.succeed) {
        Map<String, dynamic> data = response.json['data'];
        sendOtpLoginRegisterDetail =
            SendOtpForRegisterAndLoginModel.fromJson(data);
        isOtp = true;
        otpFocus.requestFocus();
        if (otp != null) {
          StorageServiceInterface storageServiceInterface =
          locator<StorageServiceInterface>();
          storageServiceInterface.save(
              StorageKey.token, sendOtpLoginRegisterDetail.token);
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.home, (Route<dynamic> route) => false);

        }
      } else {
        final message = response?.errorMessage;
        print(message);
        DialogService.of(context).showError(message);

      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    setBusy(false);
  }

  resendOtpRegisterApi(String mobileNumber, {String referOtp, BuildContext context}) async {
    setBusy(true);
    try {
      ApiResponse response = await locator<SendOtpLoginRegisterApi>()
          .resendOtpLoginAndRegister(mobileNumber, referOtp);
      if (response.succeed) {
        Map<String, dynamic> data = response.json['data'];
        sendOtpLoginRegisterDetail =
            SendOtpForRegisterAndLoginModel.fromJson(data);
      }else {
        final message = response?.errorMessage;
        print(message);
        DialogService.of(context).showError(message);

      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    setBusy(false);
  }

  checkBoxUpdate(bool value) {
    isCheckBox = value;
    notifyListeners();
  }
}
