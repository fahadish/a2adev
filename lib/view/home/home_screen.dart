import 'package:a2aff/const/image_or_icon_path.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/view/bottom_appbar/bottom_appbar_on_propery_detail.dart';
import 'package:a2aff/view/favorites/favorites_screen.dart';
import 'package:a2aff/view/notifications/notifications_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const/colors.dart';
import '../../controller/authController.dart';
import '../../controller/property controllerr.dart';
import '../../model/userModel.dart';
import '../../utils/custom_text_field/custom_text_field.dart';
import '../bottom_appbar/bottom_appbar_on_favorites.dart';
import '../profile/profile_screen.dart';

class HomeScreenArchitecture extends StatefulWidget {
  const HomeScreenArchitecture({super.key});

  @override
  State<HomeScreenArchitecture> createState() => _HomeScreenArchitectureState();
}

class _HomeScreenArchitectureState extends State<HomeScreenArchitecture> {
  UserModel? userData;
  AuthController authController = Get.find<AuthController>();
  PropertyController propertyController = Get.find<PropertyController>(); // Initialize PropertyController


  Future<void> fetchUserData() async {
    try {
      EasyLoading.show(status: 'Fetching Data');

      String? userId = authController.getCurrentUserUid();
      if (userId != null) {
        setState(() {
          userData = null; // Clear previous data
        });

        UserModel? fetchedUserData = await authController.fetchUserData(userId);
        setState(() {
          userData = fetchedUserData;
        });

        print('Fetched user data: $userData');
      } else {
        print("User ID is null");
      }
    } catch (error) {
      print('Error fetching user data: $error');
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void handleSwipeLeft() async {
    if (propertyController.propertyList.isNotEmpty) {
      // Show a toast for rejection
      EasyLoading.showToast('Rejected');

      // Fetch the next property if available
      await propertyController.fetchPropertyData();

      if (propertyController.propertyData != null) {
        // Show loading while fetching new data
        EasyLoading.show(status: 'Fetching New Data');

        // Simulate a delay to show loading (you can replace this with your actual fetching logic)
        await Future.delayed(Duration(seconds: 2));

        // Hide loading
        EasyLoading.dismiss();
      }
    }
  }

  void handleSwipeRight() async {
    if (propertyController.propertyList.isNotEmpty) {
      // Show a toast for acceptance
      EasyLoading.showToast('Accepted');

      // Fetch the next property if available
      await propertyController.fetchPropertyData();

      if (propertyController.propertyData != null) {
        // Show loading while fetching new data
        EasyLoading.show(status: 'Fetching New Data');

        // Simulate a delay to show loading (you can replace this with your actual fetching logic)
        await Future.delayed(Duration(seconds: 2));

        // Hide loading
        EasyLoading.dismiss();
      }
    }
  }


  int _currentIndex = 0;
  final List<String> _imageUrls = ["$imagePath/22.png", "$imagePath/11.png"];
  @override
  Widget build(BuildContext context) {
    final propertyController = Get.find<PropertyController>(); // Get the PropertyController


    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24..w),
        child: Column(
          children: [
            SizedBox(height: 70..h),
            Row(
              children: [
                SizedBox(width: 13..w),
                Image.asset(
                  "$iconPath/location.png",
                  height: 24..h,
                  width: 24..w,
                ),
                SizedBox(width: 7..w),
                CustomText(
                  text: "Lahore, Pakistan",
                  fontSize: 15..sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(width: 6..w),
                Icon(Icons.arrow_downward_sharp),
                const Spacer(),
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
                  onTap: () => Get.to(CustomBottomAppBar4()),
                  child: CircleAvatar(
                    radius: 21..r,
                    backgroundColor: AppColors.k0xff7B48B0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0..r),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8..w),
                InkWell(
                  onTap: () {
                    Get.to(ProfileScreen(userData: userData)); // Pass userData
                  },
                  child: CircleAvatar(
                    radius: 21..r,
                    backgroundImage: userData?.profileImage != null &&
                            userData!.profileImage.isNotEmpty
                        ? NetworkImage(userData!.profileImage!)
                            as ImageProvider<Object>?
                        : AssetImage("$imagePath/Mask group.png"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40..h),
            CustomTextFieldRightIcon(hintText: "Search....."),
            SizedBox(height: 25..h),

    GestureDetector(
    // Wrap the CustomCard in a GestureDetector for swipe gestures
    onHorizontalDragEnd: (details) {
    if (details.primaryVelocity! > 0) {
    // Swiped right
    handleSwipeRight();
    } else if (details.primaryVelocity! < 0) {
    // Swiped left
    handleSwipeLeft();
    }
    },
    child: Container(

      height: 500,
      child: PageView.builder(
      itemCount: 2, // Number of cards you want to display
      itemBuilder: (context, index) {
      // Replace with your actual card widget here
      return CustomCard(
      height: 500,
      borderRadius: 25,
      child: Stack(
      fit: StackFit.expand,
      children: [
      ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
      propertyController.propertyData!.propertyImages!.first,
      fit: BoxFit.fitHeight,
      ),
      ),
      Positioned(
      bottom: 30,
      left: 27,
      right: 60,
      child: Column(
      children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      CustomCard(
      topPadding: 4,
      bottomPadding: 4,
      rightPadding: 15,
      leftPadding: 15,
      borderRadius: 50,
      color: Colors.black.withOpacity(0.6),
      child: CustomText(
      text: propertyController.propertyData!.occupancy.toString(),
      color: Colors.white,
      ),
      ),
      CustomCard(
      topPadding: 4,
      bottomPadding: 4,
      rightPadding: 15,
      leftPadding: 15,
      borderRadius: 50,
      color: Colors.black.withOpacity(0.6),
      child: CustomText(
      text: propertyController.propertyData!.areaSize.toString(),
      color: Colors.white,
      ),
      ),
      CustomCard(
      topPadding: 4,
      bottomPadding: 4,
      rightPadding: 15,
      leftPadding: 15,
      borderRadius: 50,
      color: Colors.black.withOpacity(0.6),
      child: CustomText(
      text: '${propertyController.propertyData!.op}/${propertyController.propertyData!.purpose}',
      color: Colors.white,
      ),
      ),
      ],
      ),
      SizedBox(height: 14),
      Row(
      children: [
      Image.asset(
      "$iconPath/location.png",
      height: 18,
      width: 18,
      color: Colors.white,
      ),
      SizedBox(
      width: 160,
      child: CustomText(
      text: propertyController.propertyData!.areaCommunity.toString(),
      color: Colors.white,
      ),
      ),
      ],
      ),
      ],
      ),
      ),
      ],
      ),
      );
      },
      ),
    ),
    ),


            // InkWell(
            //   onTap: () {
            //     Get.to(CustomBottomAppBar3());
            //   },
            //   child: CustomCard(
            //     height: 500..h,
            //     borderRadius: 25..r,
            //     child: Stack(
            //       fit: StackFit.expand,
            //       children: [
            //         ClipRRect(
            //           borderRadius: BorderRadius.circular(30),
            //           child:
            //           Image.network(
            //             propertyController.propertyData!.propertyImages!.first,
            //             fit: BoxFit.fitHeight,
            //           ),
            //
            //           // Image.asset(
            //           //   "$imagePath/22.png",
            //           //   fit: BoxFit.fitHeight,
            //           // ),
            //         ),
            //
            //         Positioned(
            //           bottom: 30..h,
            //           left: 27..w,
            //           right: 60..w,
            //           child: Column(
            //             children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   CustomCard(
            //                     topPadding: 4..h,
            //                     bottomPadding: 4..h,
            //                     rightPadding: 15..w,
            //                     leftPadding: 15..w,
            //                     borderRadius: 50..r,
            //                     color: Colors.black.withOpacity(0.6),
            //                     child: CustomText(
            //                         text: propertyController.propertyData!.occupancy.toString(), color: Colors.white),
            //                   ),
            //                   CustomCard(
            //                     topPadding: 4..h,
            //                     bottomPadding: 4..h,
            //                     rightPadding: 15..w,
            //                     leftPadding: 15..w,
            //                     borderRadius: 50..r,
            //                     color: Colors.black.withOpacity(0.6),
            //                     child: CustomText(
            //                         text: propertyController.propertyData!.areaSize.toString(), color: Colors.white),
            //                   ),
            //                   CustomCard(
            //                     topPadding: 4..h,
            //                     bottomPadding: 4..h,
            //                     rightPadding: 15..w,
            //                     leftPadding: 15..w,
            //                     borderRadius: 50..r,
            //                     color: Colors.black.withOpacity(0.6),
            //                     child: CustomText(
            //                         text: '${propertyController.propertyData!.op}/${propertyController.propertyData!.purpose}', color: Colors.white),
            //                   ),
            //                 ]
            //               ),
            //               SizedBox(height: 14..h),
            //               Row(
            //                 children: [
            //                   Image.asset(
            //                     "$iconPath/location.png",
            //                     height: 18..h,
            //                     width: 18..w,
            //                     color: Colors.white,
            //                   ),
            //                   SizedBox(
            //                     width: 160..w,
            //                     child: CustomText(
            //                         text: propertyController.propertyData!.areaCommunity.toString(),
            //                         color: Colors.white),
            //                   )
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(height: 20..h),
          ],
        ),
      ),
    );
  }
}
