import 'package:json_annotation/json_annotation.dart';

part 'get_my_profile_model.g.dart';

@JsonSerializable(
    checked: true,
    explicitToJson: true,
    fieldRename: FieldRename.snake,
    includeIfNull: false)
class MyProfileModel {
  MyProfileModel();

  @JsonKey(name: 'id')
  int customerId;
  @JsonKey(name: 'owner_id')
  int ownerId;
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  @JsonKey(name: 'mobile')
  String mobile;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'is_mobile_verified')
  int isMobileVerified;
  @JsonKey(name: 'is_email_verified')
  int isEmailVerified;
  @JsonKey(name: 'address')
  String address;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'profile_image')
  String profileImage;
  @JsonKey(name: 'latitude')
  double latitude;
  @JsonKey(name: 'longitude')
  double longitude;
  @JsonKey(name: 'country_id')
  int countryId;
  @JsonKey(name: 'state_id')
  int stateId;
  @JsonKey(name: 'city_id')
  int cityId;
  @JsonKey(name: 'postal_code')
  int postalCode;
  @JsonKey(name: 'anniversary')
  String anniversary;
  @JsonKey(name: 'dob')
  String dob;
  @JsonKey(name: 'account_number')
  int accountNumber;
  @JsonKey(name: 'taxable')
  int taxable;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'deleted_at')
  String deletedAt;
  @JsonKey(name: 'is_hashed')
  int isHashed;
  @JsonKey(name: 'is_kyc_verified')
  int isKycVerified;
  @JsonKey(name: 'kyc_id')
  int kycId;
  @JsonKey(name: 'owner')
  OwnerModel owner;
  @JsonKey(name: 'addresses')
  List <AddressModel> addresses;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'state')
  String state;
  @JsonKey(name: 'city')
  String city;

  @override
  List<Object> get props => [
    customerId,
    ownerId,
    firstName,
    lastName,
    mobile,
    email,
    isMobileVerified,
    isEmailVerified,
    address,
    description,
    profileImage,
    latitude,
    longitude,
    countryId,
    stateId,
    cityId,
    postalCode,
    anniversary,
    dob,
    accountNumber,
    taxable,
    createdAt,
    updatedAt,
    deletedAt,
    isHashed,
    isKycVerified,
    kycId,
    owner,
    addresses,
    country,
    state,
    city
  ];

  factory MyProfileModel.fromJson(Map<String, dynamic> json) =>
      _$MyProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyProfileModelToJson(this);
}

@JsonSerializable(
    checked: true,
    explicitToJson: true,
    fieldRename: FieldRename.snake,
    includeIfNull: false)
class OwnerModel {
  OwnerModel();

  @JsonKey(name: 'id')
  int ownerId;
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  @JsonKey(name: 'business_name')
  String businessName;
  @JsonKey(name: 'mobile')
  String mobile;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'is_mobile_verified')
  int isMobileVerified;
  @JsonKey(name: 'is_email_verified')
  int isEmailVerified;
  @JsonKey(name: 'address')
  String address;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'sms_suffix')
  String smsSuffix;
  @JsonKey(name: 'profile_image')
  String profileImage;
  @JsonKey(name: 'country_id')
  int countryId;
  @JsonKey(name: 'sms_provider_id')
  int smsProviderId;
  @JsonKey(name: 'vendor_key')
  String vendorKey;
  @JsonKey(name: 'sms_auth_token')
  String smsAuthToken;
  @JsonKey(name: 'google_sms_otp_token')
  String googleSmsOtpToken;
  @JsonKey(name: 'android_app_link')
  String androidAppLink;
  @JsonKey(name: 'ios_app_link')
  String iosAppLink;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'deleted_at')
  String deletedAt;

  @override
  List<Object> get props => [
    ownerId,
    firstName,
    lastName,
    businessName,
    mobile,
    email,
    isMobileVerified,
    isEmailVerified,
    address,
    smsSuffix,
    description,
    profileImage,
    countryId,
    smsProviderId,
    vendorKey,
    smsAuthToken,
    googleSmsOtpToken,
    androidAppLink,
    iosAppLink,
    createdAt,
    updatedAt,
    deletedAt,
  ];

  factory OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerModelToJson(this);
}

@JsonSerializable(
    checked: true,
    explicitToJson: true,
    fieldRename: FieldRename.snake,
    includeIfNull: false)
class AddressModel {
  AddressModel();
  @JsonKey(name: 'latitude')
  double latitude;
  @JsonKey(name: 'longitude')
  double longitude;

  @override
  List<Object> get props => [
    latitude,
    longitude
  ];

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
