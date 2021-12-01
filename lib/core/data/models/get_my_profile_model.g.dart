// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyProfileModel _$MyProfileModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('MyProfileModel', json, () {
    final val = MyProfileModel();
    $checkedConvert(json, 'id', (v) => val.customerId = v as int);
    $checkedConvert(json, 'owner_id', (v) => val.ownerId = v as int);
    $checkedConvert(json, 'first_name', (v) => val.firstName = v as String);
    $checkedConvert(json, 'last_name', (v) => val.lastName = v as String);
    $checkedConvert(json, 'mobile', (v) => val.mobile = v as String);
    $checkedConvert(json, 'email', (v) => val.email = v as String);
    $checkedConvert(
        json, 'is_mobile_verified', (v) => val.isMobileVerified = v as int);
    $checkedConvert(
        json, 'is_email_verified', (v) => val.isEmailVerified = v as int);
    $checkedConvert(json, 'address', (v) => val.address = v as String);
    $checkedConvert(json, 'description', (v) => val.description = v as String);
    $checkedConvert(
        json, 'profile_image', (v) => val.profileImage = v as String);
    $checkedConvert(
        json, 'latitude', (v) => val.latitude = (v as num)?.toDouble());
    $checkedConvert(
        json, 'longitude', (v) => val.longitude = (v as num)?.toDouble());
    $checkedConvert(json, 'country_id', (v) => val.countryId = v as int);
    $checkedConvert(json, 'state_id', (v) => val.stateId = v as int);
    $checkedConvert(json, 'city_id', (v) => val.cityId = v as int);
    $checkedConvert(json, 'postal_code', (v) => val.postalCode = v as int);
    $checkedConvert(json, 'anniversary', (v) => val.anniversary = v as String);
    $checkedConvert(json, 'dob', (v) => val.dob = v as String);
    $checkedConvert(
        json, 'account_number', (v) => val.accountNumber = v as int);
    $checkedConvert(json, 'taxable', (v) => val.taxable = v as int);
    $checkedConvert(json, 'created_at', (v) => val.createdAt = v as String);
    $checkedConvert(json, 'updated_at', (v) => val.updatedAt = v as String);
    $checkedConvert(json, 'deleted_at', (v) => val.deletedAt = v as String);
    $checkedConvert(json, 'is_hashed', (v) => val.isHashed = v as int);
    $checkedConvert(
        json, 'is_kyc_verified', (v) => val.isKycVerified = v as int);
    $checkedConvert(json, 'kyc_id', (v) => val.kycId = v as int);
    $checkedConvert(
        json,
        'owner',
        (v) => val.owner =
            v == null ? null : OwnerModel.fromJson(v as Map<String, dynamic>));
    $checkedConvert(
        json,
        'addresses',
        (v) => val.addresses = (v as List)
            ?.map((e) => e == null
                ? null
                : AddressModel.fromJson(e as Map<String, dynamic>))
            ?.toList());
    $checkedConvert(json, 'country', (v) => val.country = v as String);
    $checkedConvert(json, 'state', (v) => val.state = v as String);
    $checkedConvert(json, 'city', (v) => val.city = v as String);
    return val;
  }, fieldKeyMap: const {
    'customerId': 'id',
    'ownerId': 'owner_id',
    'firstName': 'first_name',
    'lastName': 'last_name',
    'isMobileVerified': 'is_mobile_verified',
    'isEmailVerified': 'is_email_verified',
    'profileImage': 'profile_image',
    'countryId': 'country_id',
    'stateId': 'state_id',
    'cityId': 'city_id',
    'postalCode': 'postal_code',
    'accountNumber': 'account_number',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
    'deletedAt': 'deleted_at',
    'isHashed': 'is_hashed',
    'isKycVerified': 'is_kyc_verified',
    'kycId': 'kyc_id'
  });
}

Map<String, dynamic> _$MyProfileModelToJson(MyProfileModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.customerId);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('mobile', instance.mobile);
  writeNotNull('email', instance.email);
  writeNotNull('is_mobile_verified', instance.isMobileVerified);
  writeNotNull('is_email_verified', instance.isEmailVerified);
  writeNotNull('address', instance.address);
  writeNotNull('description', instance.description);
  writeNotNull('profile_image', instance.profileImage);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('country_id', instance.countryId);
  writeNotNull('state_id', instance.stateId);
  writeNotNull('city_id', instance.cityId);
  writeNotNull('postal_code', instance.postalCode);
  writeNotNull('anniversary', instance.anniversary);
  writeNotNull('dob', instance.dob);
  writeNotNull('account_number', instance.accountNumber);
  writeNotNull('taxable', instance.taxable);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  writeNotNull('deleted_at', instance.deletedAt);
  writeNotNull('is_hashed', instance.isHashed);
  writeNotNull('is_kyc_verified', instance.isKycVerified);
  writeNotNull('kyc_id', instance.kycId);
  writeNotNull('owner', instance.owner?.toJson());
  writeNotNull(
      'addresses', instance.addresses?.map((e) => e?.toJson())?.toList());
  writeNotNull('country', instance.country);
  writeNotNull('state', instance.state);
  writeNotNull('city', instance.city);
  return val;
}

OwnerModel _$OwnerModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('OwnerModel', json, () {
    final val = OwnerModel();
    $checkedConvert(json, 'id', (v) => val.ownerId = v as int);
    $checkedConvert(json, 'first_name', (v) => val.firstName = v as String);
    $checkedConvert(json, 'last_name', (v) => val.lastName = v as String);
    $checkedConvert(
        json, 'business_name', (v) => val.businessName = v as String);
    $checkedConvert(json, 'mobile', (v) => val.mobile = v as String);
    $checkedConvert(json, 'email', (v) => val.email = v as String);
    $checkedConvert(
        json, 'is_mobile_verified', (v) => val.isMobileVerified = v as int);
    $checkedConvert(
        json, 'is_email_verified', (v) => val.isEmailVerified = v as int);
    $checkedConvert(json, 'address', (v) => val.address = v as String);
    $checkedConvert(json, 'description', (v) => val.description = v as String);
    $checkedConvert(json, 'sms_suffix', (v) => val.smsSuffix = v as String);
    $checkedConvert(
        json, 'profile_image', (v) => val.profileImage = v as String);
    $checkedConvert(json, 'country_id', (v) => val.countryId = v as int);
    $checkedConvert(
        json, 'sms_provider_id', (v) => val.smsProviderId = v as int);
    $checkedConvert(json, 'vendor_key', (v) => val.vendorKey = v as String);
    $checkedConvert(
        json, 'sms_auth_token', (v) => val.smsAuthToken = v as String);
    $checkedConvert(json, 'google_sms_otp_token',
        (v) => val.googleSmsOtpToken = v as String);
    $checkedConvert(
        json, 'android_app_link', (v) => val.androidAppLink = v as String);
    $checkedConvert(json, 'ios_app_link', (v) => val.iosAppLink = v as String);
    $checkedConvert(json, 'created_at', (v) => val.createdAt = v as String);
    $checkedConvert(json, 'updated_at', (v) => val.updatedAt = v as String);
    $checkedConvert(json, 'deleted_at', (v) => val.deletedAt = v as String);
    return val;
  }, fieldKeyMap: const {
    'ownerId': 'id',
    'firstName': 'first_name',
    'lastName': 'last_name',
    'businessName': 'business_name',
    'isMobileVerified': 'is_mobile_verified',
    'isEmailVerified': 'is_email_verified',
    'smsSuffix': 'sms_suffix',
    'profileImage': 'profile_image',
    'countryId': 'country_id',
    'smsProviderId': 'sms_provider_id',
    'vendorKey': 'vendor_key',
    'smsAuthToken': 'sms_auth_token',
    'googleSmsOtpToken': 'google_sms_otp_token',
    'androidAppLink': 'android_app_link',
    'iosAppLink': 'ios_app_link',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
    'deletedAt': 'deleted_at'
  });
}

Map<String, dynamic> _$OwnerModelToJson(OwnerModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.ownerId);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('business_name', instance.businessName);
  writeNotNull('mobile', instance.mobile);
  writeNotNull('email', instance.email);
  writeNotNull('is_mobile_verified', instance.isMobileVerified);
  writeNotNull('is_email_verified', instance.isEmailVerified);
  writeNotNull('address', instance.address);
  writeNotNull('description', instance.description);
  writeNotNull('sms_suffix', instance.smsSuffix);
  writeNotNull('profile_image', instance.profileImage);
  writeNotNull('country_id', instance.countryId);
  writeNotNull('sms_provider_id', instance.smsProviderId);
  writeNotNull('vendor_key', instance.vendorKey);
  writeNotNull('sms_auth_token', instance.smsAuthToken);
  writeNotNull('google_sms_otp_token', instance.googleSmsOtpToken);
  writeNotNull('android_app_link', instance.androidAppLink);
  writeNotNull('ios_app_link', instance.iosAppLink);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  writeNotNull('deleted_at', instance.deletedAt);
  return val;
}

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('AddressModel', json, () {
    final val = AddressModel();
    $checkedConvert(
        json, 'latitude', (v) => val.latitude = (v as num)?.toDouble());
    $checkedConvert(
        json, 'longitude', (v) => val.longitude = (v as num)?.toDouble());
    return val;
  });
}

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  return val;
}
