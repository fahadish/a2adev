import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/button/custom_button.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const/image_or_icon_path.dart';
import '../../controller/property controllerr.dart';
import '../full_image_screen/full_image_screen.dart';

class PropertyDetailScreen extends StatefulWidget {
  const PropertyDetailScreen({super.key});

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  final propertyController = Get.find<PropertyController>();

  bool showMore = false; // Track whether to show more text.

  // List<String>? imagesList = [
  //   "$imagePath/11.png",
  // ];


  @override
  Widget build(BuildContext context) {
    final propertyData = propertyController.property.value;
    final List<String>? imagesList = propertyData!.propertyImages;

    return Scaffold(
      body:
      Obx(
        ()
    {
      final propertyController = Get.find<PropertyController>();
      final propertyData = propertyController.property.value;

     return Stack(
        children: [

        Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: CarouselSlider(
          items: imagesList!
              .map(
                (item) =>
                InkWell(
                  onTap: () => Get.to(FullImageScreen(images: imagesList)),
                  child: Image.network(
                    item.toString(),
                    height: 330 ..h,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
          )
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1.2 ..r,
            height: 320 ..h,
            autoPlay: true,
          ),
        ),

      ),
      Positioned(
        top: 80
          ..h,
        left: 37
          ..w,
        right: 27
          ..w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: CircleAvatar(
                backgroundColor: AppColors.k0xff7B48B0.withOpacity(0.6),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            InkWell(
              onTap: () => Get.back(),
              child: CircleAvatar(
                backgroundColor: AppColors.k0xff7B48B0,
                child: Icon(Icons.favorite_border),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 250
          ..h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20
              ..r),
            topRight: Radius.circular(20
              ..r),
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20
            ..h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23
                  ..w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 22..h),
                    CustomCard(
                      rightPadding: 10
                        ..w,
                      leftPadding: 10
                        ..w,
                      topPadding: 2
                        ..h,
                      bottomPadding: 2
                        ..h,
                      color: AppColors.k0xffBB88EF,
                      child: CustomText(
                        text:
propertyData!.propertyTitle.toString(),
                        // "Townhouse",
                        fontSize: 15
                          ..sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 9
                      ..h),
                    CustomText(
                      text:
                      // "190,000 AED",
                      propertyData.sp.toString(),

                      fontSize: 28
                        ..sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 5
                      ..h),
                    CustomText(
                      text:                       propertyData.building.toString(),

                      // "Bahria town Apartments. ",
                      fontSize: 18
                        ..sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 5
                      ..h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: AppColors.k0xffB0ADAD,
                        ),
                        SizedBox(
                          width: 330
                            ..w,
                          child: CustomText(
                            text:
                            // "Indigo Ville 8, Indigo Ville, Jumeirah Village Circle (JVC)",
                            propertyData.areaCommunity.toString(),

                            fontSize: 15
                              ..sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.k0xffB0ADAD,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13
                ..h),
              Container(
                height: 1
                  ..h,
                width: double.maxFinite,
                color: AppColors.k0xffB0ADAD.withOpacity(0.5),
              ),
              SizedBox(height: 16
                ..h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23
                  ..w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "$iconPath/bed.png",
                              height: 25
                                ..h,
                              width: 25
                                ..w,
                            ),
                            SizedBox(width: 10
                              ..w),
                            CustomText(
                              text: "${propertyData.bedrooms} Bedrooms",
                              fontSize: 17
                                ..sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Image.asset(
                              "$iconPath/grid.png",
                              height: 25
                                ..h,
                              width: 25
                                ..w,
                            ),
                            SizedBox(width: 10
                              ..w),
                            CustomText(
                              text:                       propertyData.areaSize.toString(),

                              // "1764",
                              fontSize: 17
                                ..sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "$iconPath/bath.png",
                              height: 25
                                ..h,
                              width: 25
                                ..w,
                            ),
                            SizedBox(width: 10
                              ..w),
                            CustomText(
                              text: "${propertyData.bathrooms} Bathrooms",
                              fontSize: 17
                                ..sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Image.asset(
                              "$iconPath/cc.png",
                              height: 25
                                ..h,
                              width: 25
                                ..w,
                            ),
                            SizedBox(width: 10
                              ..w),
                            CustomText(
                              text: "Any",
                              fontSize: 17
                                ..sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20
                ..h),
              Container(
                height: 8.h,
                width: double.maxFinite,
                color: AppColors.k0xffB0ADAD.withOpacity(0.2),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23
                  ..w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 33
                      ..h),
                    CustomText(
                      text: "Agent’s info:",
                      fontSize: 24
                        ..sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 33
                      ..h),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 23
                            ..r,
                          backgroundImage:
                          AssetImage("$imagePath/Mask group.png"),
                        ),
                        SizedBox(width: 9
                          ..w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Agent 101",
                              fontSize: 14
                                ..sp,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              text: "AL FIROUZ REAL ESTATE BROKER",
                              fontSize: 15
                                ..sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.k0xffB0ADAD,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 9
                      ..h),
                    Center(
                      child: Container(
                        height: 1
                          ..h,
                        width: 270
                          ..w,
                        color: AppColors.k0xffB0ADAD.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(height: 8
                      ..h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: "BRN:",
                              fontSize: 15
                                ..sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.k0xffB0ADAD,
                            ),
                            CustomText(
                              text: "-",
                              fontSize: 16
                                ..sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: "ORN:",
                              fontSize: 15
                                ..sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.k0xffB0ADAD,
                            ),
                            CustomText(
                              text: "25623",
                              fontSize: 16
                                ..sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: "License:",
                              fontSize: 15
                                ..sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.k0xffB0ADAD,
                            ),
                            CustomText(
                              text: "924470",
                              fontSize: 16
                                ..sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12
                      ..h),
                    CustomButton(
                        onTap: () {
                          EasyLoading.showToast('Under Development');

                        }, label: "Initiate A2A Contract"),
                    SizedBox(height: 20
                      ..h),
                  ],
                ),
              ),
              Container(
                height: 8
                  ..h,
                width: double.maxFinite,
                color: AppColors.k0xffB0ADAD.withOpacity(0.2),
              ),
              // SizedBox(height: 16..h),
              // Theme(
              //   data:
              //   ThemeData().copyWith(dividerColor: Colors.transparent),
              //   child:
              //   ExpansionTile(
              //     childrenPadding: EdgeInsets.only(left: 23
              //       ..w, right: 23
              //       ..w, bottom: 20
              //       ..h),
              //     title: CustomText(
              //       text: "Description",
              //       fontSize: 24
              //         ..sp,
              //       fontWeight: FontWeight.w500,
              //     ),
              //     children: [
              //       Column(
              //         children: [
              //           SizedBox(
              //             // height: 140..h,
              //             width: double.maxFinite,
              //             child: CustomText(
              //               overflow: showMore
              //                   ? TextOverflow.visible
              //                   : TextOverflow.ellipsis,
              //               text:
              //               propertyData.propertyDescription.toString(),
              //
              //
              //               // "Charming & inviting space, perfect for those who are seeking warm and comfortable living environment. Charming & inviting space, perfect for those who are seeking warm and comfortable living environment. Charming & inviting space, perfect for those who are seeking warm and comfortable living environment."
              //               //     "Charming & inviting space, perfect for those who are seeking warm and comfortable living environment. Charming & inviting space, perfect for those who are seeking warm and comfortable living environment. Charming & inviting space, perfect for those who are seeking warm and comfortable living environment.",
              //               maxLines: showMore ? null : 2,
              //               // Display only 2 lines initially.
              //               fontSize: 18
              //                 ..sp,
              //               fontWeight: FontWeight.w500,
              //               color: AppColors.k0xff545454,
              //             ),
              //           ),
              //           if (!showMore)
              //             Positioned(
              //               bottom: 0,
              //               right: 0,
              //               child: GestureDetector(
              //                 onTap: () {
              //                   setState(() {
              //                     showMore = true; // Show the full text.
              //                   });
              //                 },
              //                 child: Container(
              //                   color: Colors.transparent,
              //                   padding: EdgeInsets.all(8),
              //                   child: CustomText(
              //                     text: "Show More",
              //                     fontSize: 16
              //                       ..sp,
              //                     fontWeight: FontWeight.w500,
              //                     color: AppColors.k0xff7B48B0,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //         ],
              //       ),
              //     ],
              //   ),
              //
              // ),

              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  childrenPadding: EdgeInsets.only(
                      left: 23 ..w, right: 23 ..w, bottom: 20 ..h),
                  title: CustomText(
                    text: "Description",
                    fontSize: 24 ..sp,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            overflow: showMore ? TextOverflow.visible : TextOverflow.ellipsis,
                            text: propertyData.propertyDescription.toString(),
                            maxLines: showMore ? null : 2,
                            fontSize: 18 ..sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.k0xff545454,
                          ),
                          if (!showMore)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showMore = true; // Show the full text.
                                });
                              },
                              child: Container(
                                color: Colors.transparent,
                                padding: EdgeInsets.all(8),
                                child: CustomText(
                                  text: "Show More",
                                  fontSize: 16 ..sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.k0xff7B48B0,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // SizedBox(height: 20..h),
              Container(
                height: 8
                  ..h,
                width: double.maxFinite,
                color: AppColors.k0xffB0ADAD.withOpacity(0.2),
              ),
              Theme(
                data:
                ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  childrenPadding: EdgeInsets.only(
                      left: 20
                        ..w, right: 20
                    ..w, bottom: 20
                    ..h),
                  tilePadding: EdgeInsets.symmetric(horizontal: 20.0
                    ..w),
                  title: CustomText(
                    text: "Amenities",
                    fontSize: 24
                      ..sp,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    SizedBox(height: 18
                      ..h),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(
                        10,
                            (index) =>
                            CustomCard(
                              topPadding: 5,
                              bottomPadding: 5,
                              leftPadding: 5
                                ..w,
                              rightPadding: 11
                                ..w,
                              borderRadius: 20
                                ..r,
                              color: AppColors.k0xffB586E7,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 9
                                      ..r,
                                    backgroundColor: AppColors.k0xff7B48B0,
                                    child: Icon(Icons.done, size: 12
                                      ..r),
                                  ),
                                  SizedBox(width: 4
                                    ..w),
                                  CustomText(
                                    text: "Wi-Fi",
                                    fontSize: 12
                                      ..sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 8
                  ..h,
                width: double.maxFinite,
                color: AppColors.k0xffB0ADAD.withOpacity(0.2),
              ),
              // SizedBox(height: 20..h),
              Theme(
                data:
                ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  childrenPadding: EdgeInsets.only(
                      left: 23
                        ..w, right: 23
                    ..w, bottom: 20
                    ..h),
                  tilePadding: EdgeInsets.symmetric(horizontal: 20
                    ..w),
                  title: CustomText(
                    text: "Other info",
                    fontSize: 24
                      ..sp,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Listed:",
                              fontSize: 18
                                ..sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.k0xff8E8F96,
                            ),
                            SizedBox(height: 15
                              ..h),
                            CustomText(
                              text: "Reference:",
                              fontSize: 18
                                ..sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.k0xff8E8F96,
                            ),
                            SizedBox(height: 15
                              ..h),
                            CustomText(
                              text: "Permit No.:",
                              fontSize: 18
                                ..sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.k0xff8E8F96,
                            ),
                          ],
                        ),
                        SizedBox(width: 46
                          ..w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text:
                              propertyData.handoverDate.toString(),

                              // "28/08/2023 07:29 PM",
                              fontSize: 18
                                ..sp,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 15
                              ..h),
                            CustomText(
                              text: "firouz-5845995",
                              fontSize: 18
                                ..sp,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 15
                              ..h),
                            CustomText(
                              text: "69149021470",
                              fontSize: 18
                                ..sp,
                              fontWeight: FontWeight.w400,
                            ),
                            // SizedBox(height: 60..h)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50
                ..h)
            ],
          ),
        ),
      )






        ],

      );})
    );
  }
}

