import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const/colors.dart';
import '../../const/image_or_icon_path.dart';
import '../auth/sign_up/signup_screen.dart';
import '../home/home_screen.dart';
import '../my_properties/my_properties_screen.dart';
import '../property_listing/property_listing_screen.dart';

class CustomBottomAppBar2 extends StatefulWidget {
  const CustomBottomAppBar2({super.key});

  @override
  State<CustomBottomAppBar2> createState() => _CustomBottomAppBar2State();
}

class _CustomBottomAppBar2State extends State<CustomBottomAppBar2> {
  int selectedIndex = 0;
  final List<Widget> screens = [MyPropertiesScreen()];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      Get.back();
    });
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
      body: MyPropertiesScreen(),
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
          buildNavItem("$iconPath/back.png", 0),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
