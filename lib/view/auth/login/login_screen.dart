import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../const/image_or_icon_path.dart';
import '../../../controller/authController.dart';
import '../../../utils/button/custom_button.dart';
import 'package:get/get.dart';
import '../sign_up/signup_screen.dart';



class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isEmailValid(String email) {
    // You can implement your email validation logic here
    // For example, using a regular expression
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[a-zA-Z]{2,})+$');
    return emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    // You can implement your password validation logic here
    // For example, checking the password length
    return password.length >= 6;
  }

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
                return Lottie.asset('assets/icons/animation_llr5v0pn.json');
              } else {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("$imagePath/logo1.png", height: 98..h, width: 84..w),
                SizedBox(height: 58..h),
                      CustomTextFieldWithIcon(
                        controller: _emailController,
                        hintText: "Email Address",
                        assetIcon: "$iconPath/user.png",
                      ),
                      SizedBox(height: 20..h),
                      CustomTextFieldWithIconObsecure(
                        controller: _passwordController,
                        hintText: "********",
                        assetIcon: "$iconPath/lock.png",
                      ),
                      SizedBox(height: 36..h),
                      CustomButton(
                        onTap: () {

                          final email = _emailController.text.trim();
                          final password = _passwordController.text;

                          if (!_isEmailValid(email)) {
                            EasyLoading.showToast('Please provide a valid email');
                            return;
                          }

                          if (!_isPasswordValid(password)) {
                            EasyLoading.showToast('Please provide a valid password (at least 6 characters)');
                            return;
                          }

                          // Continue with the login process if both email and password are valid
                          _authController.signInWithEmailAndPassword(email, password);}
                          // _authController.signInWithEmailAndPassword(
                          //   _emailController.text,
                          //   _passwordController.text,
                          // );
                     ,   label: 'Login',
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

