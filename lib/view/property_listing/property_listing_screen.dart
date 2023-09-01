import 'package:a2aff/const/image_or_icon_path.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const/colors.dart';
import '../../controller/home_controller.dart';
import '../../utils/custom_text_field/custom_text_field.dart';
import '../bottom_appbar/bottom_appbar_on_propery_detail.dart';

class PropertyListingScreen extends StatefulWidget {
  const PropertyListingScreen({super.key});

  @override
  State<PropertyListingScreen> createState() => _PropertyListingScreenState();
}

class _PropertyListingScreenState extends State<PropertyListingScreen> {
  PropertyListingController homeController =
      Get.put(PropertyListingController());
  int _currentIndex = 0;
  final List<String> _imageUrls = ["$imagePath/22.png", "$imagePath/11.png"];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PropertyListingController>(builder: (controller) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24..w),
          child: Column(
            children: [
              SizedBox(height: 75..h),
              Row(
                children: [
                  SizedBox(width: 13..w),
                  Image.asset(
                    "$iconPath/location.png",
                    height: 24..h,
                    width: 24..w,
                  ),
                  SizedBox(width: 7..w),
                  CustomText(
                    text: "Lahore, Pakistan",
                    fontSize: 15..sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: 6..w),
                  Icon(Icons.arrow_downward_sharp),
                  const Spacer(),
                  CircleAvatar(
                    radius: 21..r,
                    backgroundColor: AppColors.k0xff7B48B0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0..r),
                      child: Image.asset("$iconPath/bell.png"),
                    ),
                  ),
                  SizedBox(width: 8..w),
                  CircleAvatar(
                    radius: 21..r,
                    backgroundImage: AssetImage("$imagePath/Mask group.png"),
                  ),
                ],
              ),
              SizedBox(height: 44..h),
              CustomTextFieldRightIcon(hintText: "Search...."),
              SizedBox(height: 10..h),
              SizedBox(
                height: 53..h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(vertical: 10..h),
                  itemCount: 15,
                  separatorBuilder: (context, index) => SizedBox(width: 10..w),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.selectIndex(index);
                        Get.bottomSheet(buildBottomSheetContent());
                      },
                      child: CustomCard(
                        borderRadius: 50..r,
                        color: controller.selectedIndex != index
                            ? AppColors.k0xffF8F8F8
                            : AppColors.k0xffE1C4FF,
                        topPadding: 7..h,
                        bottomPadding: 7,
                        leftPadding: 15,
                        rightPadding: 15,
                        enableBorder: true,
                        borderColor: controller.selectedIndex != index
                            ? Colors.black
                            : AppColors.k0xff3C1663,
                        borderWidth: controller.selectedIndex == index ? 2 : 1,
                        child: Row(
                          children: [
                            CustomText(text: "House", fontSize: 12..sp),
                            Image.asset("$iconPath/down.png",
                                height: 20..h, width: 20..w)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  padding: EdgeInsets.only(bottom: 20..h),
                  separatorBuilder: (context, index) => SizedBox(height: 10..h),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.to(CustomBottomAppBar3());
                    },
                    child: CustomCard(
                      height: 305..h,
                      borderRadius: 25..r,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              "$imagePath/22.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Positioned(
                            bottom: 30..h,
                            left: 27..w,
                            right: 60..w,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    3,
                                    (index) => CustomCard(
                                      topPadding: 4..h,
                                      bottomPadding: 4..h,
                                      rightPadding: 15..w,
                                      leftPadding: 15..w,
                                      borderRadius: 50..r,
                                      color: Colors.black.withOpacity(0.6),
                                      child: CustomText(
                                          text: "24HB", color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14..h),
                                Row(
                                  children: [
                                    Image.asset(
                                      "$iconPath/location.png",
                                      height: 18..h,
                                      width: 18..w,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 160..w,
                                      child: CustomText(
                                          text:
                                              "Bahria town Apartments, Lahore, Pk",
                                          color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //     InkWell(
                  //   onTap: () {
                  //     Get.to(CustomBottomAppBar3());
                  //   },
                  //   child: CustomCard(
                  //     height: 305..h,
                  //     borderRadius: 25..r,
                  //     child: Stack(
                  //       fit: StackFit.expand,
                  //       children: [
                  //         Positioned.fill(
                  //           child: ClipRRect(
                  //             borderRadius: BorderRadius.circular(25..r),
                  //             child: CarouselSlider(
                  //               options: CarouselOptions(
                  //                 aspectRatio: 1..r,
                  //                 viewportFraction: 1,
                  //                 initialPage: 0,
                  //                 enableInfiniteScroll: true,
                  //                 onPageChanged: (index, reason) {
                  //                   setState(() {
                  //                     _currentIndex = index;
                  //                   });
                  //                 },
                  //               ),
                  //               items: _imageUrls.map((imageUrl) {
                  //                 return Image.asset(
                  //                   imageUrl,
                  //                   fit: BoxFit.fitHeight,
                  //                 );
                  //               }).toList(),
                  //             ),
                  //           ),
                  //         ),
                  //         Positioned(
                  //           top: 10,
                  //           left: 0,
                  //           right: 0,
                  //           child: Padding(
                  //             padding:
                  //                 const EdgeInsets.symmetric(horizontal: 8.0),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: _imageUrls.map((imageUrl) {
                  //                 int index = _imageUrls.indexOf(imageUrl);
                  //                 return Expanded(
                  //                   child: Container(
                  //                     height: 2.0,
                  //                     margin: EdgeInsets.symmetric(
                  //                         vertical: 10.0..h,
                  //                         horizontal: 1.0..w),
                  //                     decoration: BoxDecoration(
                  //                       borderRadius:
                  //                           BorderRadius.circular(50..r),
                  //                       color: _currentIndex == index
                  //                           ? Colors.white
                  //                           : AppColors.k0xffCCCCCC,
                  //                     ),
                  //                   ),
                  //                 );
                  //               }).toList(),
                  //             ),
                  //           ),
                  //         ),
                  //         Positioned(
                  //           bottom: 30..h,
                  //           left: 27..w,
                  //           right: 60..w,
                  //           child: Column(
                  //             children: [
                  //               Row(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceBetween,
                  //                 children: List.generate(
                  //                   3,
                  //                   (index) => CustomCard(
                  //                     topPadding: 4..h,
                  //                     bottomPadding: 4..h,
                  //                     rightPadding: 15..w,
                  //                     leftPadding: 15..w,
                  //                     borderRadius: 50..r,
                  //                     color: Colors.black.withOpacity(0.1),
                  //                     child: CustomText(
                  //                       text: "24HB",
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               SizedBox(height: 14..h),
                  //               Row(
                  //                 children: [
                  //                   Image.asset(
                  //                     "$iconPath/location.png",
                  //                     height: 18..h,
                  //                     width: 18..w,
                  //                     color: Colors.white,
                  //                   ),
                  //                   SizedBox(
                  //                     width: 160..w,
                  //                     child: CustomText(
                  //                       text:
                  //                           "Bahria town Apartments, Lahore, Pk",
                  //                       color: Colors.white,
                  //                     ),
                  //                   )
                  //                 ],
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildBottomSheetContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30..w, vertical: 38..h),
      decoration: BoxDecoration(
        color: AppColors.k0xff3C1663,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30..r),
          topRight: Radius.circular(30..r),
        ),
      ),
      child: Wrap(
        runAlignment: WrapAlignment.spaceBetween,
        spacing: 12..w,
        runSpacing: 16..h,
        children: List.generate(
            10,
            (index) => CustomCard(
                enableBorder: true,
                color: AppColors.k0xff3C1663,
                borderColor: Colors.white,
                topPadding: 8..h,
                bottomPadding: 8..h,
                rightPadding: 13..w,
                leftPadding: 13..w,
                borderRadius: 50,
                child: CustomText(
                  text: index.isEven ? "Appartments" : "House",
                  fontSize: 12..sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ))),
      ),
    );
  }
}
