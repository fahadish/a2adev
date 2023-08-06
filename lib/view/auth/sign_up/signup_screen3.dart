import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/view/auth/sign_up/signup_screen4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const/image_or_icon_path.dart';
import '../../../utils/button/custom_button.dart';
import 'package:get/get.dart';
import '../../../utils/custom_card/big_card.dart';

class SignupScreen3 extends StatefulWidget {
  const SignupScreen3({super.key});

  @override
  State<SignupScreen3> createState() => _SignupScreen3State();
}

class _SignupScreen3State extends State<SignupScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWhite(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 78..h, left: 37..w),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "What areas locations \nare you expert at?",
                      fontSize: 24..sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 45..h),
                    CustomText(
                      text: "Write it down:",
                      fontSize: 24..sp,
                      fontWeight: FontWeight.w600,
                    ),

                    Container(
                      height: 174..h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.black)),
                      child: TextField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 15..w, bottom: 11..h, top: 11..h, right: 15..w)),
                      ),
                    ),

                    SizedBox(height: 104..h),

                    CustomButton(onTap: () => Get.to(SignupScreen4()), label: 'Next')
                    // Container(
                    //   width: 302..w,
                    //   height: 49..h,
                    //   decoration: ShapeDecoration(
                    //     shape: RoundedRectangleBorder(
                    //       side: BorderSide(width: 0.50..w, color: const Color(0xFFFD7B01)),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    //   child: Center(
                    //     child: CustomText(
                    //       text: "Next",
                    //       fontSize: 15..sp,
                    //       fontWeight: FontWeight.w600,
                    //       color: const Color(0xFFFD7B01),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 20..h),
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
