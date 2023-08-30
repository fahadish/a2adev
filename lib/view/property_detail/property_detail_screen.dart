import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              fit: BoxFit.cover,
              height: 700,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.k0xffF7F7F7,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0..w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 25..h),
                        CustomText(
                          text: "Bahria town Apartments. ",
                          fontSize: 18..sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 11..h),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.k0xffB0ADAD,
                              size: 16..r,
                            ),
                            CustomText(
                              text: "Bahria town Apartments. ",
                              fontSize: 12..sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.k0xffB0ADAD,
                            ),
                          ],
                        ),
                        SizedBox(height: 15..h),
                        CustomText(
                          text:
                              "Charming & inviting space, perfect for those who are seeking warm and comfortable living environment.",
                          fontSize: 12..sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.k0xffB0ADAD,
                        ),
                        SizedBox(height: 11..h),
                        CustomText(
                          text: "Facilities:",
                          fontSize: 18..sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 11..h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            5,
                            (index) => CustomCard(
                              topPadding: 4..h,
                              bottomPadding: 4..h,
                              leftPadding: 15..w,
                              rightPadding: 15..w,
                              borderRadius: 15,
                              color: Colors.black.withOpacity(0.7),
                              child: CustomText(
                                text: "38HK",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20..h),
                        CustomText(
                          text: "Agent’s info:",
                          fontSize: 18..sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 15..h),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15..w, vertical: 7..h),
                    color: Colors.white.withOpacity(1),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 21..r,
                          backgroundImage: AssetImage("$imagePath/aaa.png"),
                        ),
                        SizedBox(width: 8..w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Agent 101:",
                              fontSize: 15..sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 5..h),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.k0xffB0ADAD,
                                  size: 16..r,
                                ),
                                CustomText(
                                  text: "Faisalabad Punjab Pakistan",
                                  fontSize: 12..sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.k0xffB0ADAD,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Image.asset(
                          "$iconPath/chat1.png",
                          height: 35..h,
                          width: 35..w,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20..h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0..w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "\$60,000/-",
                          fontSize: 15..sp,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomCard(
                          color: AppColors.k0xffFD7B01,
                          leftPadding: 15..w,
                          rightPadding: 15..w,
                          topPadding: 5..h,
                          bottomPadding: 5..h,
                          borderRadius: 15..r,
                          child: CustomText(
                            text: "Buy now",
                            fontWeight: FontWeight.w500,
                            fontSize: 15..sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20..h)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
