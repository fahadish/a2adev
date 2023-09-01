import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/image_or_icon_path.dart';
import '../../../utils/custom_text/heading1/heading1_text.dart';
import '../../notifications/notifications_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.k0xff3C1663,
      body: Column(
        children: [
          SizedBox(height: 70..h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0..w),
            child: Row(
              children: [
                SizedBox(width: 13..w),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                SizedBox(width: 7..w),
                const Spacer(),
                InkWell(
                  child: CircleAvatar(
                    radius: 21..r,
                    backgroundColor: AppColors.k0xff7B48B0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0..r),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8..w),
                InkWell(
                  onTap: () => Get.to(NotificationsScreen()),
                  child: CircleAvatar(
                    radius: 21..r,
                    backgroundColor: AppColors.k0xff7B48B0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0..r),
                      child: Image.asset("$iconPath/bell.png"),
                    ),
                  ),
                ),
                SizedBox(width: 8..w),
                InkWell(
                  onTap: () {
                    // Get.to(ProfileScreen(userData: userData)); // Pass userData
                  },
                  child: CircleAvatar(
                    radius: 21..r,
                    backgroundImage: AssetImage("$imagePath/Mask group.png"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30..h),
          Padding(
            padding: EdgeInsets.only(left: 25.0..w),
            child: Row(
              children: [
                CustomText(
                  text: "Welcome back, ",
                  fontSize: 20..sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
                CustomText(
                  text: "Agent",
                  fontSize: 20..sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.only(top: 25..h, right: 30..w, left: 30..w),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
