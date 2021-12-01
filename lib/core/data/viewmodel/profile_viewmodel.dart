
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:store_nxt/app/locator.dart';
import 'package:store_nxt/app/routes/routes.dart';
import 'package:store_nxt/core/basics/abstract/storage_service_interface.dart';
import 'package:store_nxt/core/data/models/get_my_profile_model.dart';
import 'package:store_nxt/core/data/resources/api/clients/logout_api.dart';
import 'package:store_nxt/core/data/resources/api/clients/my_profile_api.dart';
import 'package:store_nxt/core/data/resources/api/response/api_response.dart';
import 'package:store_nxt/core/data/resources/storage/storage_keys.dart';
import 'package:store_nxt/core/service/dialog.service.dart';

class ProfileViewModel extends BaseViewModel {
  MyProfileModel myProfileDetail;

  getMyProfileApi(BuildContext context) async {
    setBusy(true);
    try {
      ApiResponse response = await locator<MyProfileApi>()
          .getMyProfile();
      if (response.succeed) {
        Map<String, dynamic> data = response.json['data'];
        myProfileDetail =
            MyProfileModel.fromJson(data);
      } else {
        final message = response?.errorMessage;
        DialogService.of(context).showError(message);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    setBusy(false);
  }

  signOutApi(BuildContext context) async {
    setBusy(true);
    try {
      ApiResponse response = await locator<LogoutApi>()
          .postLogout();
      if (response.succeed) {
        StorageServiceInterface storageServiceInterface =
        locator<StorageServiceInterface>();
        await storageServiceInterface.delete(StorageKey.token);
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
      } else {
        final message = response?.errorMessage;
        DialogService.of(context).showError(message);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    setBusy(false);
  }
}
