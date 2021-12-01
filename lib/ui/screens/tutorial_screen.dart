import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:store_nxt/core/data/viewmodel/tutorial_viewmodel.dart';
import 'package:store_nxt/ui/screens/login_screen.dart';
import 'package:store_nxt/ui/styles/colors.dart';

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (TutorialViewModel model) {},
      builder: (context, TutorialViewModel model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: _TutorialPageView(),
          bottomSheet: Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      model.currentIndex == model.slides.length - 1 ? Container(width: 65) : GestureDetector(
                        onTap: () {
                          model.skipPage(context);
                        },
                        child: Text("SKIP", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 20)),
                      ),
                      DotsIndicator(
                        dotsCount: model.slides.length ?? 0,
                        position: model.currentIndex.toDouble(),
                        decorator: DotsDecorator(
                            size: Size(15, 15),
                            activeSize: Size(15, 15),
                            spacing: EdgeInsets.only(right: 12),
                            color: Colors.black,
                            activeColor: AppColors.primaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          model.nextPage(context);
                        },
                        child:  model.currentIndex != model.slides.length - 1 ? Icon(Icons.play_arrow_outlined, color: Colors.grey.withOpacity(0.6), size: 35,) : Text("DONE", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 20))  ,
                      )
                    ],
                  ),
                )
/*
          InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: AppColors.primaryColor,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text("GET STARTED NOW",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                )
*/
      ),
      viewModelBuilder: () => TutorialViewModel(),
      disposeViewModel: false,
    );
  }
}

class _TutorialPageView extends ViewModelWidget<TutorialViewModel> {
  @override
  Widget build(BuildContext context, TutorialViewModel viewModel) {
    return PageView.builder(
        controller: viewModel.pageController,
        itemCount: viewModel.slides.length,
        onPageChanged: (value) {
          viewModel.currentIndex = value;
        },
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                viewModel.slides[index].image,
                fit: BoxFit.fill,
                width: 200,
                height: 200,
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(viewModel.slides[index].title, style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w700, fontSize: 25), textAlign: TextAlign.center)),
              SizedBox(height: 40),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(viewModel.slides[index].subTitle, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 20), textAlign: TextAlign.center))
            ],
          );
        });
  }
}
