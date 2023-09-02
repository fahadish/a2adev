import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const/colors.dart';
import '../../const/image_or_icon_path.dart';
import '../property_detail/property_detail_screen.dart';

class CustomBottomAppBar3 extends StatefulWidget {
  const CustomBottomAppBar3({super.key});

  @override
  State<CustomBottomAppBar3> createState() => _CustomBottomAppBar3State();
}

class _CustomBottomAppBar3State extends State<CustomBottomAppBar3> {
  int selectedIndex = 0;

  // final List<Widget> screens = [MyPropertiesScreen()]

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      Get.back();
    });
  }

  Widget buildNavItem(String image, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: CircleAvatar(
          radius: 33..r,
          backgroundColor: AppColors.k0xff7B48B0,
          child: Image.asset(
            image,
            height: 31..h,
            width: 31..w,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PropertyDetailScreen(),
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
          buildNavItem("$iconPath/call.png", 0),
          SizedBox(width: 28..w),
          buildNavItem("$iconPath/w_a.png", 1),
          SizedBox(width: 28..w),
          buildNavItem("$iconPath/_chat.png", 2),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
