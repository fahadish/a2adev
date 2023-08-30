import 'package:a2aff/const/colors.dart';
import 'package:a2aff/const/image_or_icon_path.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../controller/authController.dart';
import '../../userModel.dart';
import '../profile_edit/edit_profile_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
                  text: "Notifications",
                  fontSize: 24..sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(width: 10..w)
              ],
            ),
          ),
          SizedBox(height: 64..h),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.0..w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Show all",
                        fontSize: 12..sp,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        text: "Mark all as read",
                        fontSize: 12..sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                        horizontal: 35.0..w, vertical: 20..h),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 15,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 20..h),
                    itemBuilder: (context, index) => Slidable(
                      endActionPane: ActionPane(
                        extentRatio: 0.20,
                        motion: Container(
                            // height: 60..h,
                            decoration: BoxDecoration(
                              color: AppColors.k0xff7B48B0,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "$iconPath/tick_box.png",
                                  height: 15..h,
                                  width: 15..w,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 5..h),
                                CustomText(
                                  text: "Read",
                                  fontSize: 10..sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            )),
                        children: [],
                      ),
                      child: CustomCard(
                        height: 60..h,
                        width: double.maxFinite,
                        shadowColor: Colors.black45,
                        borderRadius: 8,
                        blurRadius: 5,
                        child: Row(
                          children: [
                            SizedBox(width: 17..w),
                            CircleAvatar(
                              radius: 21..r,
                              backgroundImage: AssetImage("$imagePath/aaa.png"),
                            ),
                            SizedBox(width: 15..w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      text: "Name",
                                      fontSize: 12..sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(width: 5..w),
                                    SizedBox(
                                      width: 180..w,
                                      child: CustomText(
                                        text: "sent you a text message.",
                                        fontSize: 12..sp,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5..h),
                                CustomText(
                                  text: "17 mins ago",
                                  fontSize: 8..sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
