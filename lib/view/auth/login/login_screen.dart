import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const/image_or_icon_path.dart';
import '../../../controller/authController.dart';
import '../../../utils/button/custom_button.dart';
import 'package:get/get.dart';
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
      body: BackgroundColored(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:63.0..w
            ),
            child: Obx(() {
              if (_authController.isLoading.value) {
                return const CircularProgressIndicator();
              } else {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("$imagePath/logo1.png", height: 98..h, width: 84..w),
                SizedBox(height: 58..h),
                      CustomTextFieldWithIcon(
                        controller: _emailController,
                        hintText: "User name",
                        assetIcon: "$iconPath/user.png",
                      ),
                      SizedBox(height: 20..h),
                      CustomTextFieldWithIcon(
                        controller: _passwordController,
                        hintText: "********",
                        assetIcon: "$iconPath/lock.png",
                      ),
                      SizedBox(height: 36..h),
                      CustomButton(
                        onTap: () {
                          _authController.signInWithEmailAndPassword(
                            _emailController.text,
                            _passwordController.text,
                          );
                        },
                        label: 'Login',
                      ),
                      SizedBox(height: 20..h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("New member?  ", style: TextStyle(fontSize: 13..sp,color: Colors.white
                          )),
                          GestureDetector(
                            onTap: () => Get.off(() => const SignUpScreen()),
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                color: Colors.orange,fontSize: 13..sp,
                                decoration: TextDecoration.underline,
                                // decorationStyle: TextDecorationStyle.dashed,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}

