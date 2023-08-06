import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/utils/custom_text_field/custom_text_field.dart';
import 'package:a2aff/view/auth/login/login_screen.dart';
import 'package:a2aff/view/auth/sign_up/signup_screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/button/custom_button.dart';
import '../../bottom_appbar/bottom_appbar.dart';
import '../../home/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWhite(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 63..w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 156..h),
                CustomText(text: "Create an Account", fontWeight: FontWeight.w600, fontSize: 24..sp),
                SizedBox(height: 59..h),
                TextFieldWithLabel(label: "Name"),
                TextFieldWithLabel(label: "Email"),
                TextFieldWithLabel(label: "Password"),
                TextFieldWithLabel(label: "Phone number"),
                TextFieldWithLabel(label: "Company name", isOptional: true),
                SizedBox(height: 50..h),
                CustomButton(onTap: () => Get.to(SignupScreen1()), label: 'Next'),
                SizedBox(height: 20..h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: "Already have an account  ", fontSize: 13..sp),
                    GestureDetector(
                      onTap: () => Get.off(() => LoginScreen()),
                      child: CustomText(
                          text: "SignIn", color: AppColors.k0xffFD7B01, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20..h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
