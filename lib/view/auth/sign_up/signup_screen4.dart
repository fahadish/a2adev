import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/view/auth/sign_up/signup_screen5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const/image_or_icon_path.dart';
import '../../../utils/button/custom_button.dart';
import 'package:get/get.dart';
import '../../../utils/custom_card/big_card.dart';
import '../../../utils/custom_text_field/custom_text_field.dart';

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
                      text:
                          "How many years of Real-\nEstate experience do you\nhave?",
                      fontSize: 24..sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    SizedBox(height: 45..h),
                    SizedBox(
                      height: 40..h,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        textAlignVertical: TextAlignVertical.bottom,

                        // controller: widget.controller,
                        decoration: InputDecoration(
                          hintText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4..r),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0..r),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0.5
                                ..w, // Change the border width to make it visible
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0..r),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5..w),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 104..h),

                    CustomButton(
                        onTap: () => Get.to(SignupScreen5()), label: 'Next'),
                    // Container(
                    //   width: 302..w,
                    //   height: 49..h,
                    //   decoration: ShapeDecoration(
                    //     shape: RoundedRectangleBorder(
                    //       side: BorderSide(
                    //           width: 0.50..w, color: const Color(0xFFFD7B01)),
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
