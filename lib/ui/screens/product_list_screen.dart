import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:store_nxt/core/data/viewmodel/product_list_viewmodel.dart';
import 'package:store_nxt/ui/helper/gridview_custom_height_delegate.dart';
import 'package:store_nxt/ui/styles/colors.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (ProductListViewModel model) {},
      builder: (context, ProductListViewModel model, child) => Scaffold(
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
        body: _ProductDetailView(),
      ),
      viewModelBuilder: () => ProductListViewModel(),
      disposeViewModel: false,
    );
  }
}

class _ProductDetailView extends ViewModelWidget<ProductListViewModel> {
  @override
  Widget build(BuildContext context, ProductListViewModel viewModel) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            height: 270,
            mainAxisSpacing: 15),
        itemCount: viewModel.productUrl.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 4),
                        spreadRadius: 1),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.grey.withOpacity(0.2))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 6),
                      child: Image.network(
                        viewModel.productUrl[index],
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                    child: Text(
                      "RS 90.00",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                    child: Text(
                      "Eucalyptus Oil",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.withOpacity(0.4)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Eucalyptus Oil 30 ml",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 7, right: 10, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.favorite_border,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.add_circle_rounded,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        });

    /*GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: viewModel.productUrl.length / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30),
        itemCount: viewModel.productUrl.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(right: 8),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: Colors.red,
                      padding: EdgeInsets.only(top: 3),
                      height: 80,
                      child: Image.network(
                        viewModel.productUrl[index],
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Herbal and Nilgri Oil",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });*/
  }
}
