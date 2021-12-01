import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:store_nxt/core/data/viewmodel/register_viewmodel.dart';
import 'package:store_nxt/ui/styles/colors.dart';
import 'package:store_nxt/ui/styles/text_button_styles.dart';

class RegisterScreen extends StatelessWidget {
  final bool isOtp;
  final String mobileNumber;
  RegisterScreen({this.isOtp, this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (RegisterViewModel model) {
        if(mobileNumber != null)
        model.mobileTextEditingcontroller.text = mobileNumber;
      },
      builder: (context, RegisterViewModel model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: _RegisterView(),
      ),
      viewModelBuilder: () => RegisterViewModel(isOtp: isOtp != null ? isOtp : false),
      disposeViewModel: false,
    );
  }
}

class _RegisterView extends ViewModelWidget<RegisterViewModel> {
  @override
  Widget build(BuildContext context, RegisterViewModel viewModel) {
    return Center(
        child: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [ SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/ic_launcher_foreground.png",
                fit: BoxFit.fill,
                width: 200,
                height: 200,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: viewModel.nameTextEditingcontroller,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: "Name"),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: viewModel.emailTextEditingcontroller,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: "Email ID"),
                ),
              ),
              SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      controller: viewModel.mobileTextEditingcontroller,
                      focusNode: viewModel.mobileFocus,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 90),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: "Mobile number"),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(10)
                      ],
                    ),
                  ),
                  Positioned(
                      left: 10,
                      top: 2,
                      bottom: 2,
                      child: Container(
                          color: Colors.grey.withOpacity(0.5),
                          height: 45,
                          width: 80,
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Image.asset(
                                "assets/images/ic_indian_flag.png",
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(width: 6),
                              Text("+91")
                            ],
                          )))
                ],
              ),
              SizedBox(height: viewModel.isOtp ? 10 : 0),
              viewModel.isOtp
                  ? Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            controller: viewModel.otpTextEditingcontroller,
                            focusNode: viewModel.otpFocus,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                hintText: "Enter OTP"),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              LengthLimitingTextInputFormatter(6)
                            ],
                          ),
                        ),
                        Positioned(
                            right: 15,
                            top: 2,
                            bottom: 2,
                            child: TextButton(
                                onPressed: () {
                                  viewModel.resendOtpRegisterApi(viewModel.mobileTextEditingcontroller.text, referOtp: viewModel.sendOtpLoginRegisterDetail.otpId.toString(), context: context);
                                },
                                style: TextButtonStyles.getTextButtonStyle(
                                  color: Colors.white,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: Text(
                                  "Resend OTP",
                                  style:
                                      TextStyle(color: Colors.grey, fontSize: 18),
                                )))
                      ],
                    )
                  : Container(),
              SizedBox(height: 30),
              CheckboxListTile(
                title: RichText(
                    text: TextSpan(
                        text: 'I accept the',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: <TextSpan>[
                      TextSpan(
                        text: ' Terms Of Service',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                            decoration: TextDecoration.underline),
                      )
                    ])), //    <-- label
                value: viewModel.isCheckBox,
                onChanged: (newValue) {
                  viewModel.checkBoxUpdate(newValue);
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      viewModel.registerValidation(context);
                    },
                    style: TextButtonStyles.getTextButtonStyle(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
              ),
              SizedBox(height: 30),
              Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 50,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButtonStyles.getTextButtonStyle(
                        color: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text(
                        "Already Registered User?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ))),
              SizedBox(height: 30),
            ],
          ),
        ),
          Visibility(
              visible: viewModel.isBusy,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primaryColor),
                ),
              )),
        ],
      ),
    ));
  }
}
