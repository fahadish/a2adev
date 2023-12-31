import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/view/auth/sign_up/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const/colors.dart';
import '../../const/image_or_icon_path.dart';
import '../../view/home/home_screen.dart';
import 'bottom_appbar1.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({super.key});

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int selectedIndex = 0;
  final List<Widget> screens = [
    HomeScreenArchitecture(),
    HomeScreenArchitecture(),
    Container(height: 100, width: 100, color: Colors.red),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    selectedIndex == 0
        ? Get.to(CustomBottomAppBar1())
        : selectedIndex == 1
            ? Get.bottomSheet(buildBottomSheetContent())
            : Get.to(SignUpScreen());
  }

  Widget buildBottomSheetContent() {
    return Container(
      height: 300..h,
      decoration: BoxDecoration(
        color: AppColors.k0xff3C1663,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30..r),
          topRight: Radius.circular(30..r),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(
              width: 200..w,
              topPadding: 10..h,
              bottomPadding: 10..h,
              color: AppColors.k0xffFD7B01,
              borderRadius: 50..r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Post a Property",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.k0xff3C1663,
                  ),
                  Icon(Icons.add, color: AppColors.k0xff3C1663)
                ],
              ),
            ),
            SizedBox(height: 14..h),
            CustomCard(
              width: 200..w,
              topPadding: 10..h,
              bottomPadding: 10..h,
              color: AppColors.k0xffFD7B01,
              borderRadius: 50..r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Post a Request",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.k0xff3C1663,
                  ),
                  Icon(Icons.add, color: AppColors.k0xff3C1663)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(String image, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Image.asset(image, height: 66..h, width: 66..w),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0..r)),
        child: Container(
          height: 60.0..h,
          color: AppColors.k0xff3C1663,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildNavItem("$iconPath/home.png", 0),
          SizedBox(width: 18..w),
          buildNavItem("$iconPath/add.png", 1),
          SizedBox(width: 18..w),
          buildNavItem("$iconPath/chat.png", 2),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
