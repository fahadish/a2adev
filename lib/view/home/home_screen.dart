import 'package:a2aff/const/image_or_icon_path.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/colors.dart';
import '../../utils/custom_text_field/custom_text_field.dart';

class HomeScreenArchitecture extends StatefulWidget {
  const HomeScreenArchitecture({super.key});

  @override
  State<HomeScreenArchitecture> createState() => _HomeScreenArchitectureState();
}

class _HomeScreenArchitectureState extends State<HomeScreenArchitecture> {
  int _currentIndex = 0;
  final List<String> _imageUrls = ["$imagePath/22.png", "$imagePath/11.png"];

  @override
  Widget build(BuildContext context) {
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
                CircleAvatar(
                  radius: 21..r,
                  backgroundColor: AppColors.k0xff7B48B0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0..r),
                    child: Image.asset("$iconPath/bell.png"),
                  ),
                ),
                SizedBox(width: 8..w),
                CircleAvatar(
                  radius: 21..r,
                  backgroundImage: AssetImage("$imagePath/Mask group.png"),
                ),
              ],
            ),
            SizedBox(height: 40..h),
            CustomTextFieldRightIcon(hintText: "Search...."),
            SizedBox(height: 25..h),
            CustomCard(
              height: 500..h,
              borderRadius: 25..r,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25..r),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 0.5..r,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        items: _imageUrls.map((imageUrl) {
                          return Image.asset(
                            imageUrl,
                            fit: BoxFit.fitHeight,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _imageUrls.map((imageUrl) {
                          int index = _imageUrls.indexOf(imageUrl);
                          return Expanded(
                            child: Container(
                              height: 2.0,
                              margin: EdgeInsets.symmetric(vertical: 10.0..h, horizontal: 1.0..w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50..r),
                                color: _currentIndex == index ? Colors.white : AppColors.k0xffCCCCCC,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30..h,
                    left: 27..w,
                    right: 60..w,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            3,
                            (index) => CustomCard(
                              topPadding: 4..h,
                              bottomPadding: 4..h,
                              rightPadding: 15..w,
                              leftPadding: 15..w,
                              borderRadius: 50..r,
                              color: Colors.black.withOpacity(0.1),
                              child: CustomText(text: "24HB", color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 14..h),
                        Row(
                          children: [
                            Image.asset(
                              "$iconPath/location.png",
                              height: 18..h,
                              width: 18..w,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 160..w,
                              child:
                                  CustomText(text: "Bahria town Apartments, Lahore, Pk", color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20..h),
          ],
        ),
      ),
    );
  }
}
