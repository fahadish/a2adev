import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/button/custom_button.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const/image_or_icon_path.dart';

class PropertyDetailScreen extends StatefulWidget {
  const PropertyDetailScreen({super.key});

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "$imagePath/11.png",
              fit: BoxFit.fill,
              height: 330,
            ),
          ),
          Positioned(
            top: 80..h,
            left: 37..w,
            right: 27..w,
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
          Positioned(
            top: 200.h,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20..r),
                  topRight: Radius.circular(20..r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23..w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 22..h),
                          CustomCard(
                            rightPadding: 10..w,
                            leftPadding: 10..w,
                            topPadding: 2..h,
                            bottomPadding: 2..h,
                            color: AppColors.k0xffBB88EF,
                            child: CustomText(
                              text: "Townhouse",
                              fontSize: 15..sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 9..h),
                          CustomText(
                            text: "190,000 AED",
                            fontSize: 28..sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 5..h),
                          CustomText(
                            text: "Bahria town Apartments. ",
                            fontSize: 18..sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 5..h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: AppColors.k0xffB0ADAD,
                              ),
                              SizedBox(
                                width: 330..w,
                                child: CustomText(
                                  text:
                                      "Indigo Ville 8, Indigo Ville, Jumeirah Village Circle (JVC)",
                                  fontSize: 15..sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.k0xffB0ADAD,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 13..h),
                    Container(
                      height: 1..h,
                      width: double.maxFinite,
                      color: AppColors.k0xffB0ADAD.withOpacity(0.5),
                    ),
                    SizedBox(height: 16..h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23..w),
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
                                    height: 25..h,
                                    width: 25..w,
                                  ),
                                  SizedBox(width: 10..w),
                                  CustomText(
                                    text: "5 Bedrooms",
                                    fontSize: 17..sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                children: [
                                  Image.asset(
                                    "$iconPath/grid.png",
                                    height: 25..h,
                                    width: 25..w,
                                  ),
                                  SizedBox(width: 10..w),
                                  CustomText(
                                    text: "1764",
                                    fontSize: 17..sp,
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
                                    height: 25..h,
                                    width: 25..w,
                                  ),
                                  SizedBox(width: 10..w),
                                  CustomText(
                                    text: "5 Bathrooms",
                                    fontSize: 17..sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                children: [
                                  Image.asset(
                                    "$iconPath/cc.png",
                                    height: 25..h,
                                    width: 25..w,
                                  ),
                                  SizedBox(width: 10..w),
                                  CustomText(
                                    text: "Any",
                                    fontSize: 17..sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20..h),
                    Container(
                      height: 6.h,
                      width: double.maxFinite,
                      color: AppColors.k0xffB0ADAD.withOpacity(0.2),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23..w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 33..h),
                          CustomText(
                            text: "Agent’s info:",
                            fontSize: 24..sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 33..h),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 23..r,
                                backgroundImage:
                                    AssetImage("$imagePath/Mask group.png"),
                              ),
                              SizedBox(width: 9..w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Agent 101",
                                    fontSize: 14..sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    text: "AL FIROUZ REAL ESTATE BROKER",
                                    fontSize: 15..sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.k0xffB0ADAD,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 9..h),
                          Center(
                            child: Container(
                              height: 1..h,
                              width: 270..w,
                              color: AppColors.k0xffB0ADAD.withOpacity(0.5),
                            ),
                          ),
                          SizedBox(height: 8..h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    text: "BRN:",
                                    fontSize: 15..sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.k0xffB0ADAD,
                                  ),
                                  CustomText(
                                    text: "-",
                                    fontSize: 16..sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: "ORN:",
                                    fontSize: 15..sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.k0xffB0ADAD,
                                  ),
                                  CustomText(
                                    text: "25623",
                                    fontSize: 16..sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: "License:",
                                    fontSize: 15..sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.k0xffB0ADAD,
                                  ),
                                  CustomText(
                                    text: "924470",
                                    fontSize: 16..sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12..h),
                          CustomButton(
                              onTap: () {}, label: "Initiate A2A Contract"),
                          SizedBox(height: 20..h),
                        ],
                      ),
                    ),
                    Container(
                      height: 5..h,
                      width: double.maxFinite,
                      color: AppColors.k0xffB0ADAD.withOpacity(0.2),
                    ),
                    SizedBox(height: 16..h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23..w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Description",
                            fontSize: 24..sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                height: 140..h,
                                width: double.maxFinite,
                                child: CustomText(
                                  overflow: TextOverflow.fade,
                                  text:
                                      "Charming & inviting space, perfect for those who are seeking warm and comfortable living environment. Charming & inviting space, perfect for those who are seeking warm and comfortable living environment. Charming & inviting space, perfect for those who are seeking warm and comfortable living environment."
                                      "Charming & inviting space, perfect for those who are seeking warm and comfortable living environment. Charming & inviting space, perfect for those who are seeking warm and comfortable living environment. Charming & inviting space, perfect for those who are seeking warm and comfortable living environment.",
                                  fontSize: 18..sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.k0xff545454,
                                ),
                              ),
                              // Positioned(
                              //   bottom: 0..h,
                              //   left: 0,
                              //   right: 0,
                              //   child: Center(
                              //     child: CustomText(
                              //       text: "Show more",
                              //       fontSize: 21..sp,
                              //       fontWeight: FontWeight.w500,
                              //       color: AppColors.k0xff7B48B0,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20..h),
                    Container(
                      height: 8..h,
                      width: double.maxFinite,
                      color: AppColors.k0xffB0ADAD.withOpacity(0.2),
                    ),
                    SizedBox(height: 20..h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Amenities",
                          fontSize: 24..sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 18..h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0..w),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: List.generate(
                              10,
                              (index) => CustomCard(
                                topPadding: 5,
                                bottomPadding: 5,
                                leftPadding: 5..w,
                                rightPadding: 11..w,
                                borderRadius: 20..r,
                                color: AppColors.k0xffB586E7,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 9..r,
                                      backgroundColor: AppColors.k0xff7B48B0,
                                      child: Icon(Icons.done, size: 12..r),
                                    ),
                                    SizedBox(width: 4..w),
                                    CustomText(
                                      text: "Wi-Fi",
                                      fontSize: 12..sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20..h),
                    Container(
                      height: 8..h,
                      width: double.maxFinite,
                      color: AppColors.k0xffB0ADAD.withOpacity(0.2),
                    ),
                    SizedBox(height: 20..h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23..w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Other info",
                            fontSize: 18..sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 28..h),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Listed:",
                                    fontSize: 18..sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.k0xff8E8F96,
                                  ),
                                  SizedBox(height: 15..h),
                                  CustomText(
                                    text: "Reference:",
                                    fontSize: 18..sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.k0xff8E8F96,
                                  ),
                                  SizedBox(height: 15..h),
                                  CustomText(
                                    text: "Permit No.:",
                                    fontSize: 18..sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.k0xff8E8F96,
                                  ),
                                ],
                              ),
                              SizedBox(width: 46..w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "28/08/2023 07:29 PM",
                                    fontSize: 18..sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(height: 15..h),
                                  CustomText(
                                    text: "firouz-5845995",
                                    fontSize: 18..sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(height: 15..h),
                                  CustomText(
                                    text: "69149021470",
                                    fontSize: 18..sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:a2aff/const/colors.dart';
// import 'package:a2aff/utils/custom_card/big_card.dart';
// import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../const/image_or_icon_path.dart';
//
// class PropertyDetailScreen extends StatefulWidget {
//   const PropertyDetailScreen({super.key});
//
//   @override
//   State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
// }
//
// class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Image.asset(
//               "$imagePath/11.png",
//               fit: BoxFit.cover,
//               height: 700,
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: AppColors.k0xffF7F7F7,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25),
//                   topRight: Radius.circular(25),
//                 ),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0..w),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 25..h),
//                         CustomText(
//                           text: "Bahria town Apartments. ",
//                           fontSize: 18..sp,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         SizedBox(height: 11..h),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.location_on_outlined,
//                               color: AppColors.k0xffB0ADAD,
//                               size: 16..r,
//                             ),
//                             CustomText(
//                               text: "Bahria town Apartments. ",
//                               fontSize: 12..sp,
//                               fontWeight: FontWeight.w500,
//                               color: AppColors.k0xffB0ADAD,
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 15..h),
//                         CustomText(
//                           text:
//                               "Charming & inviting space, perfect for those who are seeking warm and comfortable living environment.",
//                           fontSize: 12..sp,
//                           fontWeight: FontWeight.w500,
//                           color: AppColors.k0xffB0ADAD,
//                         ),
//                         SizedBox(height: 11..h),
//                         CustomText(
//                           text: "Facilities:",
//                           fontSize: 18..sp,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         SizedBox(height: 11..h),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: List.generate(
//                             5,
//                             (index) => CustomCard(
//                               topPadding: 4..h,
//                               bottomPadding: 4..h,
//                               leftPadding: 15..w,
//                               rightPadding: 15..w,
//                               borderRadius: 15,
//                               color: Colors.black.withOpacity(0.7),
//                               child: CustomText(
//                                 text: "38HK",
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20..h),
//                         CustomText(
//                           text: "Agent’s info:",
//                           fontSize: 18..sp,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         SizedBox(height: 15..h),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 15..w, vertical: 7..h),
//                     color: Colors.white.withOpacity(1),
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 21..r,
//                           backgroundImage: AssetImage("$imagePath/aaa.png"),
//                         ),
//                         SizedBox(width: 8..w),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CustomText(
//                               text: "Agent 101:",
//                               fontSize: 15..sp,
//                               fontWeight: FontWeight.w500,
//                             ),
//                             SizedBox(height: 5..h),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.location_on_outlined,
//                                   color: AppColors.k0xffB0ADAD,
//                                   size: 16..r,
//                                 ),
//                                 CustomText(
//                                   text: "Faisalabad Punjab Pakistan",
//                                   fontSize: 12..sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: AppColors.k0xffB0ADAD,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Spacer(),
//                         Image.asset(
//                           "$iconPath/chat1.png",
//                           height: 35..h,
//                           width: 35..w,
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20..h),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0..w),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CustomText(
//                           text: "\$60,000/-",
//                           fontSize: 15..sp,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         CustomCard(
//                           color: AppColors.k0xffFD7B01,
//                           leftPadding: 15..w,
//                           rightPadding: 15..w,
//                           topPadding: 5..h,
//                           bottomPadding: 5..h,
//                           borderRadius: 15..r,
//                           child: CustomText(
//                             text: "Buy now",
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15..sp,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20..h)
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
