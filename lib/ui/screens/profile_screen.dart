import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:store_nxt/core/data/viewmodel/profile_viewmodel.dart';
import 'package:store_nxt/ui/styles/colors.dart';
import 'package:store_nxt/ui/styles/text_button_styles.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (ProfileViewModel model) {
        model.getMyProfileApi(context);
      },
      builder: (context, ProfileViewModel model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          iconTheme: IconThemeData(
            color: Colors.grey, //change your color here
          ),
          title: Text(
            'Account',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children:<Widget> [
                  Container(
                      height: 130,
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 2,
                              offset: Offset(0, 2),
                              spreadRadius: 2),
                        ],
                      ),
                      child: Column(
                        children:<Widget> [
                          Row (
                            children: <Widget>[
                              Icon(Icons.person,
                                color: AppColors.primaryColor,
                                size: 22.0,),
                              SizedBox(width: 15.0,),
                              Text(model.myProfileDetail?.firstName ?? "",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Row (
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Icon(Icons.edit,
                                      color: Colors.black,
                                      size: 16.0,),])
                            ],
                          ),
                          SizedBox(height: 20.0,),
                          Row (
                            children: <Widget>[
                              Icon(Icons.email,
                                color: AppColors.primaryColor,
                                size: 22.0,),
                              SizedBox(width: 15.0,),
                              Text(model.myProfileDetail?.email ?? "",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0,),
                          Row (
                            children: <Widget>[
                              Icon(Icons.phone,
                                color: AppColors.primaryColor,
                                size: 22.0,),
                              SizedBox(width: 15.0,),
                              Text(model.myProfileDetail?.mobile ?? "",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )

                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    child: Column(
                      children:<Widget> [
                        Text('No Delivery Address',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Icon(Icons.add_circle,
                          color: AppColors.primaryColor,
                          size: 40.0,),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 2,
                            offset: Offset(0, 2),
                            spreadRadius: 2),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(Icons.reorder,
                          color: AppColors.primaryColor,
                          size: 22.0,),
                        SizedBox(width: 15.0,),
                        Text('Go to Order History',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.chevron_right, color: AppColors.primaryColor),
                          ],
                        )

                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 2,
                            offset: Offset(0, 2),
                            spreadRadius: 2),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(Icons.favorite,
                          color: AppColors.primaryColor,
                          size: 22.0,),
                        SizedBox(width: 15.0,),
                        Text('Wishlist',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.chevron_right, color: AppColors.primaryColor),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 100),
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 40,
                    child: TextButton(
                        child: Text(
                          "Invite Your Friends",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 40,
                    child: TextButton(
                        style: TextButtonStyles.getTextButtonStyle(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          "Help & FAQs",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 50,
                    child: TextButton(
                      onPressed: (){
                        model.signOutApi(context);
                      },
                      style: TextButtonStyles.getTextButtonStyle(
                        color: Colors.black,
                        padding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text(
                        "Sign Out",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
            Visibility(
              visible: model.isBusy,
                child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primaryColor),
              ),
            ) )
          ],
        )

      ),
      viewModelBuilder: () => ProfileViewModel(),
      disposeViewModel: false,
    );
  }
}
