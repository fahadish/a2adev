import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const/image_or_icon_path.dart';
import '../../../utils/button/custom_button.dart';
import 'package:get/get.dart';
import '../../../utils/custom_card/big_card.dart';

class SignupScreen4 extends StatefulWidget {
  const SignupScreen4({super.key});

  @override
  State<SignupScreen4> createState() => _SignupScreen4State();
}

class _SignupScreen4State extends State<SignupScreen4> {
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

                    SizedBox(height: 104..h),

                    // ? CustomButton(onTap: () => Get.bottomSheet(buildBottomSheetContent()), label: 'Next')
                    Container(
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
                          color: const Color(0xFFFD7B01),
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
