import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:store_nxt/core/data/viewmodel/home_viewmodel.dart';
import 'package:store_nxt/ui/screens/product_list_screen.dart';
import 'package:store_nxt/ui/styles/colors.dart';

class HomeDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (HomeViewModel model) {},
      builder: (context, HomeViewModel model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          elevation: 1,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Flexible(
              child: Text(
                "K.SIDDAH GOWDER & CO",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.shopping_bag_outlined,
                          color: AppColors.primaryColor),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.search, color: AppColors.primaryColor),
                      onPressed: () {}),
                ],
              ),
            ),
          ]),
        ),
        body: _HomeDetailView(),
      ),
      viewModelBuilder: () => HomeViewModel(),
      disposeViewModel: false,
    );
  }
}

class _HomeDetailView extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      children: [
        SizedBox(height: 5),
        _PageViewImageSlider(),
        SizedBox(height: 10),
        _WishlistAndMyCountView(),
        SizedBox(height: 10),
        Container(color: Colors.grey.withOpacity(0.4), height: 3),
        SizedBox(height: 10),
        _SimilarPrdouctView()
      ],
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
              return Container(
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
                      "Certified organic 100% Gaurantee",
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
                        size: Size(9, 9),
                        activeSize: Size(9, 9),
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

class _WishlistAndMyCountView extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: (MediaQuery.of(context).size.width / 2 - 20),
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  primary: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 4,
                  side: BorderSide(
                      color: Colors.grey.withOpacity(0.3), width: 0.7),
                ),
                child: Row(children: [
                  Icon(Icons.favorite, color: AppColors.primaryColor),
                  SizedBox(width: 10),
                  Text(
                    "Wishlist",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  )
                ])),
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 2 - 20),
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  primary: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 4,
                  side: BorderSide(
                      color: Colors.grey.withOpacity(0.3), width: 0.7),
                ),
                child: Row(children: [
                  Icon(Icons.person_rounded, color: AppColors.primaryColor),
                  SizedBox(width: 10),
                  Text(
                    "My Account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  )
                ])),
          ),
        ],
      ),
    );
  }
}

class _SimilarPrdouctView extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      height: 150,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 8, top: 5, bottom: 5),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductListScreen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: 8),
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: Offset.zero,
                          blurRadius: 1.3,
                          spreadRadius: 2.3),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 3),
                        height: 80,
                        width: 80,
                        child: Image.network(
                          viewModel.productUrl[index],
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Herbal and Nilgri Oil",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ));
          }),
    );
  }
}
