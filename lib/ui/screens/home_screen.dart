import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:store_nxt/core/data/viewmodel/home_viewmodel.dart';
import 'package:store_nxt/ui/screens/home_detail_screen.dart';
import 'package:store_nxt/ui/styles/colors.dart';
import 'package:store_nxt/ui/styles/text_button_styles.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (HomeViewModel model) {},
      builder: (context, HomeViewModel model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 1,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "StoreNXT",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.person_rounded,
                          color: AppColors.primaryColor),
                      onPressed: () {
                        model.navigateToProfileView(context);
                      }),
                  IconButton(
                      icon: Icon(Icons.shopping_bag_outlined,
                          color: AppColors.primaryColor),
                      onPressed: () {}),
                ],
              ),
            ),
          ]),
        ),
        body: _HomeView(),
      ),
      viewModelBuilder: () => HomeViewModel(),
      disposeViewModel: false,
    );
  }
}

class _HomeView extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: 40,
                padding: EdgeInsets.only(left: 5, right: 5),
                child: TextField(
                  textAlign: TextAlign.center,
                  focusNode: viewModel.focusNode,
                  keyboardType: TextInputType.name,
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
                      hintText: viewModel.focusNode.hasFocus
                          ? ""
                          : "Search for Products / Services",
                      hintStyle: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              Positioned(
                  top: 2,
                  bottom: 2,
                  right: 20,
                  child: Icon(
                    Icons.search,
                    color: AppColors.primaryColor,
                  ))
            ],
          ),
          SizedBox(height: 5),
          _PageViewImageSlider(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            color: AppColors.primaryColor,
            child: Center(
              child: Text(
                "Nearby Stores",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          _SearchProducts(),
          SizedBox(height: 70),
          _NoPrdouctView(),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}

class _PageViewImageSlider extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: viewModel.pageController,
            onPageChanged: (pos) {
              viewModel.currentIndex = pos.toDouble();
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeDetailScreen()),
                  );
                },
                child: Container(
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withOpacity(0.9)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.2, 0.7, 1],
                    ),
                  ),
                  child: Image.network(
                    viewModel.productUrl[index],
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: viewModel.productUrl.length ?? 0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10, left: 5),
                  child: Text(
                    "K.SIDDAH GOWDER & CO",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 5),
                    child: Text(
                      "Free Shipping abive Rs.1000",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 17),
                  child: DotsIndicator(
                    dotsCount: viewModel.productUrl.length ?? 0,
                    position: viewModel.currentIndex,
                    decorator: DotsDecorator(
                        size: Size(6, 6),
                        activeSize: Size(6, 6),
                        spacing: EdgeInsets.only(right: 12),
                        color: Colors.white.withOpacity(0.51),
                        activeColor: Colors.white),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _SearchProducts extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.grey.withOpacity(0.01),
            Colors.grey.withOpacity(0.2)
          ],
        ),
      ),
      // color: Colors.grey.withOpacity(.3),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      hintText: "Enter your prefered location here",
                      hintStyle:
                          TextStyle(color: Colors.grey.withOpacity(0.6))),
                ),
              ),
              Positioned(
                  top: 2,
                  bottom: 2,
                  right: 20,
                  child: Icon(
                    Icons.edit,
                  ))
            ],
          ),
          Text("OR",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center),
          TextButton(
              onPressed: () {},
              style: TextButtonStyles.getTextButtonStyle(
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                "Use My Current Location",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}

class _NoPrdouctView extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Text(
          "Sorry, there are no nearby stores to serve you at the moment, please choose different, location to locate store",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      SizedBox(height: 15),
      TextButton(
          onPressed: () {},
          style: TextButtonStyles.getTextButtonStyle(
            color: AppColors.primaryColor,
            // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Text(
            "Change Location",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          ))
    ]);
  }
}
