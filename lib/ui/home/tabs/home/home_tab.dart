import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../components/custom_search_bar.dart';
import '../../../../model/new_arraival_DM.dart';
import '../../../../utilities/app_colors.dart';
import '../../../new_arrival_details/new_arrival_details_screen.dart';

class HomeTab extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  List<String> chooseBrandImagePath = [
    'assets/Images/adidas_choose_brand_icon.svg',
    'assets/Images/nike_choose_brand_icon.svg',
    'assets/Images/fila_choose_brand_icon.svg',
    'assets/Images/puma_choose_brand_icon.svg'
  ];
  List<String> chooseBrandName = ['Adidas', 'Nike', 'Fila', 'Puma'];

  List<String> newArraivalImagePath = [
    'assets/Images/new_arraival_1.png',
    'assets/Images/new_arraival_2.png',
    'assets/Images/new_arraival_3.png',
    'assets/Images/new_arraival_4.png'
  ];
  List<String> newArraivalDescription = [
    'Nike Sportswear Club Fleece',
    'Trail Running Jacket Nike Wind runner',
    'Training Top  Nike port Clash',
    'Trail Running Jacket Nike Wind runner'
  ];

  List<NewArrivalDM> listOfNewArraival = [
    NewArrivalDM(
        imagePath: 'assets/Images/new_arraival_1.png',
        name: 'Nike Sportswear Club Fleece',
        category: 'Nike Club Fleece',
        description:
            "The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with",
        listOfSize: ['S', 'M', 'L', 'XL', '2XL'],
        price: 99,
        subCategory: "Men's Printed Pullover Hoodie",
        listOfImages: [
          'assets/Images/new_arraival_image_1.png',
          'assets/Images/new_arraival_image_2.png',
          'assets/Images/new_arraival_image_3.png',
          'assets/Images/new_arraival_image_4.png'
        ]),
    NewArrivalDM(
        imagePath: 'assets/Images/new_arraival_2.png',
        name: 'Trail Running Jacket Nike Wind runner',
        category: 'Nike Club Fleece',
        description:
            "The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with",
        listOfSize: ['S', 'M', 'L', 'XL', '2XL'],
        price: 99,
        subCategory: "Men's Printed Pullover Hoodie",
        listOfImages: [
          'assets/Images/new_arraival_image_1.png',
          'assets/Images/new_arraival_image_2.png',
          'assets/Images/new_arraival_image_3.png',
          'assets/Images/new_arraival_image_4.png'
        ]),
    NewArrivalDM(
        imagePath: 'assets/Images/new_arraival_3.png',
        name: 'Training Top  Nike port Clash',
        category: 'Nike Club Fleece',
        description:
            "The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with",
        listOfSize: ['S', 'M', 'L', 'XL', '2XL'],
        price: 99,
        subCategory: "Men's Printed Pullover Hoodie",
        listOfImages: [
          'assets/Images/new_arraival_image_1.png',
          'assets/Images/new_arraival_image_2.png',
          'assets/Images/new_arraival_image_3.png',
          'assets/Images/new_arraival_image_4.png'
        ]),
    NewArrivalDM(
        imagePath: 'assets/Images/new_arraival_4.png',
        name: 'Trail Running Jacket Nike Wind runner',
        category: 'Nike Club Fleece',
        description:
            "The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with",
        listOfSize: ['S', 'M', 'L', 'XL', '2XL'],
        price: 99,
        subCategory: "Men's Printed Pullover Hoodie",
        listOfImages: [
          'assets/Images/new_arraival_image_1.png',
          'assets/Images/new_arraival_image_2.png',
          'assets/Images/new_arraival_image_3.png',
          'assets/Images/new_arraival_image_4.png'
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Text(
              "Hello",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter-VariableFont',
                  color: Theme.of(context).secondaryHeaderColor),
            ),
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: const Text(
              "Welcome to Goo",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter-VariableFont',
                  color: AppColors.labelColor),
            ),
          ),
          SizedBox(height: height * 0.025),
          Row(
            children: [
              SizedBox(width: width * 0.03),
              Expanded(
                  flex: 9,
                  child: CustomSearchBar(searchController: searchController)),
              SizedBox(width: width * 0.03),
              Expanded(
                flex: 2,
                child: Container(
                  height: height * 0.072,
                  decoration: BoxDecoration(
                      color: const Color(0xff9775FA),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset("assets/Images/mic_icon.svg"),
                  ),
                ),
              ),
              SizedBox(width: width * 0.04),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.025),
                child: Text(
                  "Choose Brand",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: const Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.labelColor),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: chooseBrandImagePath.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SizedBox(width: width * 0.03),
                              Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .bottomNavigationBarTheme
                                        .backgroundColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.016,
                                      vertical: height * 0.01),
                                  child: SvgPicture.asset(
                                      chooseBrandImagePath[index],
                                      width: width * 0.15,
                                      colorFilter: ColorFilter.mode(
                                          Theme.of(context).hintColor,
                                          BlendMode.srcIn)),
                                ),
                              ),
                              SizedBox(width: width * 0.03),
                              Text(
                                chooseBrandName[index],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Inter-VariableFont',
                                    color: Theme.of(context).hintColor),
                              ),
                              SizedBox(width: width * 0.03),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(width: width * 0.05);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text(
                  "New Arraival",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: const Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.labelColor),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.015),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.3,
                crossAxisSpacing: 10),
            itemCount: listOfNewArraival.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, NewArrivalDetailsScreen.routeName,
                      arguments: listOfNewArraival[index]);
                },
                child: Padding(
                  padding: index % 2 == 0
                      ? EdgeInsets.only(left: width * 0.035)
                      : EdgeInsets.only(right: width * 0.035),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            listOfNewArraival[index].imagePath!,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: height * 0.008),
                          Text(listOfNewArraival[index].name!,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).hintColor),
                              textAlign: TextAlign.start),
                          SizedBox(height: height * 0.006),
                          Text(
                              r"$" +
                                  "${listOfNewArraival[index].price!.toStringAsFixed(0)}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).hintColor),
                              textAlign: TextAlign.start),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.035, vertical: height * 0.02),
                        child: Align(
                          alignment: Alignment.topRight,
                          child:
                              SvgPicture.asset("assets/Images/heart_icon.svg"),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
