import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/utils/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const/image_or_icon_path.dart';
import '../../../utils/button/custom_button.dart';
import 'package:get/get.dart';

import '../../bottom_appbar/bottom_appbar.dart';
import '../sign_up/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundColored(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 63..w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("$imagePath/logo1.png", height: 98..h, width: 84..w),
                SizedBox(height: 58..h),
                CustomTextFieldWithIcon(hintText: "User name", assetIcon: "$iconPath/user.png"),
                SizedBox(height: 20..h),
                CustomTextFieldWithIcon(hintText: "********", assetIcon: "$iconPath/lock.png"),
                SizedBox(height: 36..h),
                CustomButton(onTap: () => Get.off(const CustomBottomAppBar()), label: 'Login'),
                SizedBox(height: 20..h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: "Don't have account?  ", fontSize: 13..sp),
                    GestureDetector(
                      onTap: () => Get.off(() => const SignUpScreen()),
                      child: CustomText(
                          text: "SignUp", color: AppColors.k0xffFD7B01, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
