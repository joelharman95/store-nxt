import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:store_nxt/app/locator.dart';
import 'package:store_nxt/app/routes/routes.dart';
import 'package:store_nxt/core/basics/abstract/storage_service_interface.dart';
import 'package:store_nxt/core/data/resources/storage/storage_keys.dart';

class TutorialViewModel extends BaseViewModel {
  int _currentIndex = 0;
  List<TutorialModel> slides = [];

  int get currentIndex => _currentIndex;
  PageController pageController = PageController(initialPage: 0);
  StorageServiceInterface storageServiceInterface =
      locator<StorageServiceInterface>();

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  TutorialViewModel() {
    slides = [
      TutorialModel(
          image: "assets/images/tut_page_1.png",
          title: "Neighbourhood Stores & Offerings",
          subTitle: "StoreNXT enables you to explore nearby stores and their products at your fingertips"),
      TutorialModel(
          image: "assets/images/tut_page_2.png",
          title: "Mark as Favorite for Ordering swiftly and Reorder again.",
          subTitle: "StoreNXT offers you a Quick, Easy and Simple way to get your Orders delivered at your doorstep"),
      TutorialModel(
          image: "assets/images/tut_page_3.png",
          title: "Secured Payment Process & Organized Backend Process",
          subTitle: "With all the Best Offers nearby, StoreNXT provides a secure payment channel and realtime order status tracking."),
      TutorialModel(
          image: "assets/images/tut_page_4.png",
          title: "Happy Shopping!",
          subTitle: "Explore nearby Stores & Products. Start Ordering and Support your Local Stores")
    ];
  }

  nextPage(BuildContext context) {
    if (currentIndex == slides.length - 1) {
      storageServiceInterface.save(StorageKey.isTutorial, "true");
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.login, (Route<dynamic> route) => false);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
    } else {
      pageController.animateToPage(currentIndex + 1,
          duration: Duration(milliseconds: 400), curve: Curves.linear);
    }
  }

  skipPage(BuildContext context) {
    storageServiceInterface.save(StorageKey.isTutorial, "true");
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
  }
}

class TutorialModel {
  String image;
  String title;
  String subTitle;

  TutorialModel({this.image, this.title, this.subTitle});
}
