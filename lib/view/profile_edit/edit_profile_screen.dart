import 'package:a2aff/const/colors.dart';
import 'package:a2aff/const/image_or_icon_path.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/authController.dart';
import '../../utils/custom_text_field/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  AuthController authController = Get.put(AuthController());
  String selectedOption = "User";
  List<String> dropdownOptions = [
    "Developer",
    "Agent",
    "User",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 63..h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0..w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back_ios),
                ),
                CustomText(
                  text: "Edit Profile",
                  fontSize: 24..sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(width: 20..w)
              ],
            ),
          ),
          SizedBox(height: 40..h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0..w),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 140..h,
                      width: 140..w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.k0xff352049),
                      ),
                      child: Image.asset("assets/images/12.png"),
                    ),
                    Positioned(
                      bottom: 10..h,
                      right: 7..w,
                      child: Image.asset(
                        "assets/icons/camera.png",
                        height: 24..h,
                        width: 26.6..w,
                      ),
                    )
                  ],
                ),
                TextFieldWithLabel(
                  label: "Name",
                  hintText: "Enter your name",
                  labelSize: 16..sp,
                  borderColor: const Color(0xff544C4C24),
                  labelColor: Colors.black,
                ),
                TextFieldWithLabel(
                  label: "Email",
                  hintText: "Enter your email",
                  labelSize: 16..sp,
                  borderColor: Color(0xff544C4C24),
                  labelColor: Colors.black,
                ),
                TextFieldWithLabel(
                  label: "Password",
                  hintText: "Enter your password",
                  labelSize: 16..sp,
                  borderColor: Color(0xff544C4C24),
                  labelColor: Colors.black,
                ),
                TextFieldWithLabel(
                  label: "Phone number",
                  hintText: "Enter phone number",
                  labelSize: 16..sp,
                  borderColor: Color(0xff544C4C24),
                  labelColor: Colors.black,
                ),
                TextFieldWithLabel(
                  label: "WhatsApp",
                  hintText: "Pakistin",
                  labelSize: 16..sp,
                  borderColor: Color(0xff544C4C24),
                  labelColor: Colors.black,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Company name*",
                    style: TextStyle(
                      fontSize: 16..sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
