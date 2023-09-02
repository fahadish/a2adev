import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/view/auth/sign_up/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const/colors.dart';
import '../../const/image_or_icon_path.dart';
import '../../controller/authController.dart';
import '../../controller/property controllerr.dart';
import '../../model/userModel.dart';
import '../../view/home/home_screen.dart';
import '../post_property/post_property_screen.dart';
import 'bottom_appbar1.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({super.key});

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  bool isUserDataLoading =
      true; // Track whether user data is currently being fetched
  UserModel? userData;
  AuthController authController = Get.find<AuthController>();
  PropertyController propertyController = Get.find<PropertyController>();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      EasyLoading.show(status: 'Featching Data');

      // Assuming your AuthController's fetchUserData takes a user ID
      String? userId = authController.getCurrentUserUid(); // Re
      if (userId != null) {
        userData = await authController.fetchUserData(userId);
        print('Fetched user data: $userData'); // Print the fetched user data
        EasyLoading.dismiss(); // Set loading to false after data is fetched
      } else {
        // Handle the case where userId is null
        print("User ID is null");

        EasyLoading.dismiss(); // Set loading to false after data is fetched
      }

      print('Fetched user data: $userData'); // Print the fetched user data
      print(
          'user picture${userData!.profileImage}'); // Print the fetched user data

      setState(() {
        isUserDataLoading = false; //
        EasyLoading.dismiss(); // Set loading to false after data is fetched
      });

      EasyLoading.dismiss();
    } catch (error) {
      setState(() {
        isUserDataLoading =
            false; // Ensure loading is set to false even if an error occurs
      });
      print('Error fetching user data: $error');
      EasyLoading.dismiss(); // Set loading to false after data is fetched
    }
  }

  int selectedIndex = 0;
  final List<Widget> screens = [
    HomeScreenArchitecture(),
    HomeScreenArchitecture(),
    Center(
        child: CustomText24(
      text: "Under Development",
      color: Colors.black,
    )),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (selectedIndex == 0) {
      Get.to(CustomBottomAppBar1());
    } else if (selectedIndex == 1) {
      Get.bottomSheet(buildBottomSheetContent());
    } else if (selectedIndex == 2) {
      Get.to(
          HomeScreenArchitecture()); // Pass userData to the HomeScreenArchitecture widget
    }
  }


  Widget buildBottomSheetContent() {
    final propertyController = Get.find<PropertyController>(); // Get the PropertyController

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
            InkWell(
              onTap: () => Get.to(PostPropertyAllScreens()),
              child: CustomCard(
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
            ),
            SizedBox(height: 14..h),
            InkWell(
              onTap: () {
                EasyLoading.showToast('Under Development');
              },
              child: CustomCard(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(String image, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Image.asset(
        image,
        height: index == 2 ? 51.h : 66
          ..h,
        width: index == 2 ? 51.w : 66
          ..w,
      ),
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
          buildNavItem("$iconPath/chat1.png", 2),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
