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
          SizedBox(height: 30..h),
          SizedBox(
            height: 72..h,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 25.0..w, right: 25.0..w),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (context, index) => SizedBox(width: 10..w),
              itemBuilder: (context, index) => Container(
                height: 69..h,
                width: 69..w,
                padding: EdgeInsets.all(3..r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.k0xffFD7B01),
                ),
                child: index == 0
                    ? Container(
                        padding: EdgeInsets.all(17..r),
                        height: 60..h,
                        width: 60..w,
                        decoration: BoxDecoration(
                          color: AppColors.k0xffFD7B01,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: AppColors.k0xffFD7B01,
                            ),
                          ),
                        ),
                      )
                    : CircleAvatar(
                        radius: 21..r,
                        backgroundImage: AssetImage("$imagePath/aaa.png"),
                      ),
              ),
            ),
          ),
          const Spacer(),
          Container(
              height: 500..h,
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 25..h, right: 30..w, left: 30..w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20..r),
                  topRight: Radius.circular(20..r),
                ),
              ),
              child: ListView.separated(
                itemCount: 10,
                padding: EdgeInsets.only(bottom: 30..h),
                separatorBuilder: (context, index) => Divider(height: 30..h),
                itemBuilder: (context, index) => Row(
                  children: [
                    CircleAvatar(
                      radius: 29..r,
                      backgroundImage: AssetImage("$imagePath/aaa.png"),
                    ),
                    SizedBox(width: 15..w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Client 01",
                          fontSize: 15..sp,
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText(
                          text: "okay sure!!",
                          fontSize: 14..sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.k0xff8A91A8,
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                          text: "12:25 PM",
                          fontSize: 12..sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.k0xff8A91A8,
                        ),
                        Icon(
                          Icons.done_all,
                          color: AppColors.k0xff8A91A8,
                          size: 16..r,
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
