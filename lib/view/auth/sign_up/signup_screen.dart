import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/utils/custom_text_field/custom_text_field.dart';
import 'package:a2aff/view/auth/login/login_screen.dart';
import 'package:a2aff/view/auth/sign_up/signup_screen1.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/authController.dart';
import '../../../utils/button/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthController authController = Get.put(AuthController());
  FocusNode focusNode = FocusNode();
  bool isTapped = false;
  String selectedOption = 'Client';
  List<String> dropdownOptions = [
    "Agent",
    "Client",
  ];

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        body: BackgroundWhite(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 63..w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 136..h),
                  CustomText(
                      text: "Create an Account",
                      fontWeight: FontWeight.w600,
                      fontSize: 24..sp),
                  SizedBox(height: 59..h),
                  TextFieldWithLabel(label: "Name"),
                  TextFieldWithLabel(label: "Email"),
                  TextFieldWithLabel(label: "Password"),
                  Row(
                    children: [
                      CustomText(
                        text: "Phone Number",
                        color: focusNode.hasFocus
                            ? AppColors.k0xff352049
                            : AppColors.k0xff9D9D9D,
                      ),
                      CustomText(text: "*", color: AppColors.k0xffDA0404),
                    ],
                  ),
                  SizedBox(height: 5..h),
                  SizedBox(
                    height: 41..h,
                    child: Row(
                      children: [
                        CustomCard(
                          enableBorder: true,
                          borderColor: AppColors.k0xff9D9D9D,
                          width: 100..w,
                          child: CountryCodePicker(
                            padding: EdgeInsets.zero,
                            flagWidth: 25,
                            textStyle: const TextStyle(color: Colors.black),
                            onChanged: (value) =>
                                controller.changeCountry(value),
                            initialSelection: "US",
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: true,
                          ),
                        ),
                        SizedBox(width: 10..w),
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            focusNode: focusNode,
                            textAlignVertical: TextAlignVertical.top,
                            onTap: () {
                              setState(() {
                                isTapped = true;
                              });
                            },
                            onChanged: (text) {
                              setState(() {
                                isTapped = false;
                              });
                            },
                            // controller: widget.controller,
                            decoration: InputDecoration(
                              // hintText: widget.hintText ?? '',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4..r),
                                borderSide: BorderSide(
                                  color: AppColors.k0xff9D9D9D,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0..r),
                                borderSide: BorderSide(
                                  color: AppColors.k0xff352049,
                                  width: 2
                                    ..w, // Change the border width to make it visible
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18..h),
                  Row(
                    children: [
                      CustomText(
                        text: "Sign up as",
                        color: AppColors.k0xff9D9D9D,
                      ),
                      CustomText(
                        text: "*",
                        color: AppColors.k0xffDA0404,
                      ),
                    ],
                  ),
                  SizedBox(height: 5..h),
                  Container(
                    height: 40..h,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 16.0..w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: DropdownButton<String>(
                            underline: const SizedBox(),
                            icon: const SizedBox(),
                            value: selectedOption,
                            onChanged: (newValue) {
                              setState(() {
                                selectedOption = newValue!;
                              });
                            },
                            items: dropdownOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
                  ),
                  SizedBox(height: 18..h),
                  TextFieldWithLabel(label: "Company name", isOptional: true),
                  SizedBox(height: 50..h),
                  CustomButton(
                      onTap: () => Get.to(SignupScreen1()), label: 'Next'),
                  SizedBox(height: 20..h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: "Already have an account  ", fontSize: 13..sp),
                      GestureDetector(
                        onTap: () => Get.off(() => LoginScreen()),
                        child: CustomText(
                            text: "SignIn",
                            color: AppColors.k0xffFD7B01,
                            fontWeight: FontWeight.bold),
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
    });
  }
}
