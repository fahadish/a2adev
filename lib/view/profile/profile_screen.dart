import 'package:a2aff/const/colors.dart';
import 'package:a2aff/const/image_or_icon_path.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/authController.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthController authController = Get.put(AuthController());

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
                  text: "Profile",
                  fontSize: 24..sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(width: 10..w)
              ],
            ),
          ),
          SizedBox(height: 64..h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0..w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Account",
                  fontWeight: FontWeight.w600,
                  fontSize: 16..sp,
                ),
                SizedBox(height: 13..h),
                CustomCard(
                  topPadding: 10..h,
                  bottomPadding: 10..h,
                  color: Colors.black.withOpacity(0.05),
                  child: Row(
                    children: [
                      SizedBox(width: 16..w),
                      Image.asset(
                        "$iconPath/person.png",
                        height: 30..h,
                        width: 30..w,
                      ),
                      SizedBox(width: 36..w),
                      CustomText(
                        text: "Edit profile",
                        fontWeight: FontWeight.w600,
                        fontSize: 16..sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20..h),
                CustomCard(
                  topPadding: 10..h,
                  bottomPadding: 10..h,
                  color: Colors.black.withOpacity(0.05),
                  child: Row(
                    children: [
                      SizedBox(width: 16..w),
                      Image.asset(
                        "$iconPath/person.png",
                        height: 30..h,
                        width: 30..w,
                      ),
                      SizedBox(width: 36..w),
                      CustomText(
                        text: "My Properties",
                        fontWeight: FontWeight.w600,
                        fontSize: 16..sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30..h),
                CustomText(
                  text: "Verify user card",
                  fontWeight: FontWeight.w600,
                  fontSize: 16..sp,
                ),
                SizedBox(height: 11..h),
                InkWell(
                  onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 30..h),
                              Image.asset(
                                "$iconPath/ch.png",
                                height: 64..h,
                                width: 64..w,
                              ),
                              Text(
                                "Your verification request has been sent successfully to the administration department.",
                                style: TextStyle(fontSize: 20),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Close"))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  child: CustomCard(
                    topPadding: 13..h,
                    bottomPadding: 13..h,
                    color: AppColors.k0xffE1C4FF,
                    child: Center(
                      child: CustomText(
                        text: "Verify",
                        fontWeight: FontWeight.w600,
                        color: AppColors.k0xff3C1663,
                        fontSize: 16..sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28..h),
                CustomText(
                  text: "Support & About",
                  fontWeight: FontWeight.w600,
                  fontSize: 16..sp,
                ),
                SizedBox(height: 10..h),
                CustomCard(
                  topPadding: 15..h,
                  bottomPadding: 15..h,
                  color: Colors.black.withOpacity(0.05),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 16..w),
                          Image.asset(
                            "$iconPath/terms.png",
                            height: 30..h,
                            width: 30..w,
                          ),
                          SizedBox(width: 36..w),
                          CustomText(
                            text: "Help & Support",
                            fontWeight: FontWeight.w600,
                            fontSize: 16..sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 15..h),
                      Row(
                        children: [
                          SizedBox(width: 16..w),
                          Image.asset(
                            "$iconPath/terms.png",
                            height: 30..h,
                            width: 30..w,
                          ),
                          SizedBox(width: 36..w),
                          CustomText(
                            text: "Terms and Policies",
                            fontWeight: FontWeight.w600,
                            fontSize: 16..sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28..h),
                CustomText(
                  text: "Actions",
                  fontWeight: FontWeight.w600,
                  fontSize: 16..sp,
                ),
                SizedBox(height: 10..h),
                CustomCard(
                  topPadding: 15..h,
                  bottomPadding: 15..h,
                  color: Colors.black.withOpacity(0.05),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 16..w),
                          Image.asset(
                            "$iconPath/problem.png",
                            height: 30..h,
                            width: 30..w,
                          ),
                          SizedBox(width: 36..w),
                          CustomText(
                            text: "Report a problem",
                            fontWeight: FontWeight.w600,
                            fontSize: 16..sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 15..h),
                      Row(
                        children: [
                          SizedBox(width: 16..w),
                          Image.asset(
                            "$iconPath/account.png",
                            height: 30..h,
                            width: 30..w,
                          ),
                          SizedBox(width: 36..w),
                          CustomText(
                            text: "Add account",
                            fontWeight: FontWeight.w600,
                            fontSize: 16..sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 15..h),
                      InkWell(
                        onTap: ()async{
                         await authController.signOut();

                        },
                        child: Row(
                          children: [
                            SizedBox(width: 16..w),
                            Image.asset(
                              "$iconPath/logout.png",
                              height: 20..h,
                              width: 30..w,
                            ),
                            SizedBox(width: 36..w),
                            CustomText(
                              text: "Logout",
                              fontWeight: FontWeight.w600,
                              fontSize: 16..sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
