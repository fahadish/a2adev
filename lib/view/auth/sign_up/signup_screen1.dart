import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/view/auth/sign_up/signup_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const/image_or_icon_path.dart';
import '../../../utils/button/custom_button.dart';
import 'package:get/get.dart';

import '../../../utils/custom_card/big_card.dart';

class SignupScreen1 extends StatefulWidget {
  const SignupScreen1({super.key});

  @override
  State<SignupScreen1> createState() => _SignupScreen1State();
}

class _SignupScreen1State extends State<SignupScreen1> {
  bool yes = false;
  bool no = false;

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
                    Image.asset("$imagePath/logo1.png", height: 98..h, width: 84..w),
                    SizedBox(height: 111..h),
                    CustomText(
                      text: "Are you RERA certified?",
                      fontSize: 24..sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    SizedBox(height: 45..h),
                    GestureDetector(
                      onTap: () => setState(() {
                        yes == false ? yes = true : yes = false;
                        no = false;
                      }),
                      child: Row(
                        children: [
                          yes == false
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
                            text: "Yes",
                            fontSize: 20..sp,
                            fontWeight: FontWeight.w400,
                            color: yes == false ? Colors.white : AppColors.k0xffFD7B01,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 34..h),
                    GestureDetector(
                      onTap: () => setState(() {
                        no == false ? no = true : no = false;
                        yes = false;
                      }),
                      child: Row(
                        children: [
                          no == false
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
                            text: "No",
                            fontSize: 20..sp,
                            fontWeight: FontWeight.w400,
                            color: no == false ? Colors.white : AppColors.k0xffFD7B01,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 122..h),
                    yes || no == true
                        // ? CustomButton(onTap: () => Get.bottomSheet(buildBottomSheetContent()), label: 'Next')
                        ? CustomButton(onTap: () => Get.to(SignupScreen2()), label: 'Next')
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
                                color: yes || no == true ? Colors.black : const Color(0xFFFD7B01),
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
