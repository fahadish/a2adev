import 'dart:io';

import 'package:a2aff/const/colors.dart';
import 'package:a2aff/controller/signup_controller.dart';
import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/view/auth/sign_up/signup_screen4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const/image_or_icon_path.dart';
import '../../../utils/button/custom_button.dart';
import 'package:get/get.dart';
import '../../../utils/custom_card/big_card.dart';
import '../../bottom_appbar/bottom_appbar.dart';

class SignupScreen5 extends StatefulWidget {
  const SignupScreen5({super.key});

  @override
  State<SignupScreen5> createState() => _SignupScreen5State();
}

class _SignupScreen5State extends State<SignupScreen5> {
  SignupController signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: signupController,
        builder: (controller) {
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
                          color: AppColors.k0xff3C1663,
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
                            text: "Add profile picture",
                            fontSize: 24..sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 45..h),
                          Center(
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (builder) => controller.myBottomSheet(context));
                              },
                              child: CustomCard(
                                height: 279..h,
                                width: 222..w,
                                color: const Color(0xFFD9D9D9),
                                child: controller.imageFile != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(4..r),
                                        child:
                                            Image.file(File(controller.imageFile!.path), fit: BoxFit.cover))
                                    : Container(
                                        margin: EdgeInsets.all(75..r),
                                        height: 74..h,
                                        width: 74..w,
                                        decoration: BoxDecoration(
                                            color: AppColors.k0xff9D9D9D, shape: BoxShape.circle),
                                        child: Icon(Icons.add, size: 35..r)),
                              ),
                            ),
                          ),
                          SizedBox(height: 104..h),
                          CustomButton(onTap: () => Get.offAll(CustomBottomAppBar()), label: 'Next')
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
        });
  }
}
