import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/view/auth/sign_up/signup_screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const/image_or_icon_path.dart';
import '../../../utils/button/custom_button.dart';
import 'package:get/get.dart';
import '../../../utils/custom_card/big_card.dart';

class SignupScreen2 extends StatefulWidget {
  const SignupScreen2({super.key});

  @override
  State<SignupScreen2> createState() => _SignupScreen2State();
}

class _SignupScreen2State extends State<SignupScreen2> {
  bool offPlan = false;
  bool secondary = false;
  bool rental = false;
  bool lands = false;
  bool buildings = false;

  Widget buildBottomSheetContent() {
    return Container(
      height: 300..h,
      decoration: BoxDecoration(
        color: AppColors.k0xff3C1663,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30..r),
          topRight: Radius.circular(30..r),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(
              width: 200..w,
              topPadding: 10..h,
              bottomPadding: 10..h,
              color: AppColors.k0xffFD7B01,
              borderRadius: 50..r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Upload file",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.k0xff3C1663,
                  ),
                  Icon(Icons.add, color: AppColors.k0xff3C1663)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundColored(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 78..h, left: 37..w),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => Get.back(),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 63..w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Your specialty",
                      fontSize: 24..sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    SizedBox(height: 45..h),
                    GestureDetector(
                      onTap: () => setState(() {
                        offPlan = !offPlan;
                      }),
                      child: Row(
                        children: [
                          offPlan == false
                              ? Image.asset(
                                  "$iconPath/box.png",
                                  height: 18..h,
                                  width: 18..w,
                                )
                              : Image.asset(
                                  "$iconPath/tick_box.png",
                                  height: 18..h,
                                  width: 18..w,
                                ),
                          SizedBox(width: 11..w),
                          CustomText(
                            text: "Off-Plan",
                            fontSize: 20..sp,
                            fontWeight: FontWeight.w400,
                            color: offPlan == false ? Colors.white : AppColors.k0xffFD7B01,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 34..h),
                    GestureDetector(
                      onTap: () => setState(() {
                        secondary = !secondary;
                      }),
                      child: Row(
                        children: [
                          secondary == false
                              ? Image.asset(
                                  "$iconPath/box.png",
                                  height: 18..h,
                                  width: 18..w,
                                )
                              : Image.asset(
                                  "$iconPath/tick_box.png",
                                  height: 18..h,
                                  width: 18..w,
                                ),
                          SizedBox(width: 11..w),
                          CustomText(
                            text: "Secondary",
                            fontSize: 20..sp,
                            fontWeight: FontWeight.w400,
                            color: secondary == false ? Colors.white : AppColors.k0xffFD7B01,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 34..h),
                    GestureDetector(
                      onTap: () => setState(() {
                        rental = !rental;
                      }),
                      child: Row(
                        children: [
                          rental == false
                              ? Image.asset(
                                  "$iconPath/box.png",
                                  height: 18..h,
                                  width: 18..w,
                                )
                              : Image.asset(
                                  "$iconPath/tick_box.png",
                                  height: 18..h,
                                  width: 18..w,
                                ),
                          SizedBox(width: 11..w),
                          CustomText(
                            text: "Rentals",
                            fontSize: 20..sp,
                            fontWeight: FontWeight.w400,
                            color: rental == false ? Colors.white : AppColors.k0xffFD7B01,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 34..h),
                    GestureDetector(
                      onTap: () => setState(() {
                        lands = !lands;
                      }),
                      child: Row(
                        children: [
                          lands == false
                              ? Image.asset(
                                  "$iconPath/box.png",
                                  height: 18..h,
                                  width: 18..w,
                                )
                              : Image.asset(
                                  "$iconPath/tick_box.png",
                                  height: 18..h,
                                  width: 18..w,
                                ),
                          SizedBox(width: 11..w),
                          CustomText(
                            text: "Lands",
                            fontSize: 20..sp,
                            fontWeight: FontWeight.w400,
                            color: lands == false ? Colors.white : AppColors.k0xffFD7B01,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 34..h),
                    GestureDetector(
                      onTap: () => setState(() {
                        buildings = !buildings;
                      }),
                      child: Row(
                        children: [
                          buildings == false
                              ? Image.asset(
                                  "$iconPath/box.png",
                                  height: 18..h,
                                  width: 18..w,
                                )
                              : Image.asset(
                                  "$iconPath/tick_box.png",
                                  height: 18..h,
                                  width: 18..w,
                                ),
                          SizedBox(width: 11..w),
                          CustomText(
                            text: "Buildings",
                            fontSize: 20..sp,
                            fontWeight: FontWeight.w400,
                            color: buildings == false ? Colors.white : AppColors.k0xffFD7B01,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 104..h),
                    offPlan || secondary || rental || buildings || lands == true
                        ? CustomButton(onTap: () => Get.to(() => SignupScreen3()), label: 'Next')
                        : Container(
                            width: 302..w,
                            height: 49..h,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.50..w, color: const Color(0xFFFD7B01)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                text: "Next",
                                fontSize: 15..sp,
                                fontWeight: FontWeight.w600,
                                color: offPlan || secondary || rental || buildings || lands == true
                                    ? Colors.black
                                    : const Color(0xFFFD7B01),
                              ),
                            ),
                          ),
                    SizedBox(height: 20..h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
