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

class MyPropertiesScreen extends StatefulWidget {
  const MyPropertiesScreen({super.key});

  @override
  State<MyPropertiesScreen> createState() => _MyPropertiesScreenState();
}

class _MyPropertiesScreenState extends State<MyPropertiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24..w),
        child: Column(
          children: [
            SizedBox(height: 75..h),
            CustomText(
              text: "My Properties",
              fontSize: 24..sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 40..h),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
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
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30..r),
                            child: Image.asset(
                              "$imagePath/22.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0..w),
                            child: Container(
                              height: 30.0..h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5..r),
                                color: AppColors.k0xff7B48B0,
                              ),
                              child: Icon(
                                Icons.delete_outline_outlined,
                                color: Colors.white,
                                size: 25..r,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10..h,
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
                                    color: Colors.black.withOpacity(0.5),
                                    child: CustomText(
                                      text: "24HB",
                                      color: Colors.white,
                                    ),
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
                                      color: Colors.white,
                                    ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
