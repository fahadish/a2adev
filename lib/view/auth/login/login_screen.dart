import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/utils/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const/image_or_icon_path.dart';
import '../../../controller/authController.dart';
import '../../../utils/button/custom_button.dart';
import 'package:get/get.dart';

import '../../bottom_appbar/bottom_appbar.dart';
import '../sign_up/signup_screen.dart';

// class LoginScreen extends StatefulWidget {
//   final AuthController _authController = Get.find<AuthController>();
//
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BackgroundColored(
//         child: Center(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 63..w),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset("$imagePath/logo1.png", height: 98..h, width: 84..w),
//                 SizedBox(height: 58..h),
//                 CustomTextFieldWithIcon(hintText: "User name", assetIcon: "$iconPath/user.png"),
//                 SizedBox(height: 20..h),
//                 CustomTextFieldWithIcon(hintText: "********", assetIcon: "$iconPath/lock.png"),
//                 SizedBox(height: 36..h),
//                 CustomButton(onTap: () => Get.off(const CustomBottomAppBar()), label: 'Login'),
//                 SizedBox(height: 20..h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CustomText(text: "Don't have account?  ", fontSize: 13..sp),
//                     GestureDetector(
//                       onTap: () => Get.off(() => const SignUpScreen()),
//                       child: CustomText(
//                           text: "SignUp", color: AppColors.k0xffFD7B01, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ... other imports ...

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(() {
            if (_authController.isLoading.value) {
              return CircularProgressIndicator();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFieldWithIcon(
                    controller: _emailController,
                    hintText: "User name",
                    assetIcon: "iconPath/user.png",
                  ),
                  SizedBox(height: 20),
                  CustomTextFieldWithIcon(
                    controller: _passwordController,
                    hintText: "********",
                    assetIcon: "iconPath/lock.png",
                  ),
                  SizedBox(height: 36),
                  CustomButton(
                    onTap: () {
                      _authController.signInWithEmailAndPassword(
                        _emailController.text,
                        _passwordController.text,
                      );
                    },
                    label: 'Login',
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?  ", style: TextStyle(fontSize: 13)),
                      GestureDetector(
                        onTap: () => Get.off(() => const SignUpScreen()),
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}

