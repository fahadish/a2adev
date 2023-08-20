import 'package:a2aff/const/colors.dart';
import 'package:a2aff/const/image_or_icon_path.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
// import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/post_property_controller.dart';
import '../../utils/button/custom_button.dart';

class PostPropertyScreen7 extends StatefulWidget {
  const PostPropertyScreen7({super.key});

  @override
  State<PostPropertyScreen7> createState() => _PostPropertyScreen7State();
}

class _PostPropertyScreen7State extends State<PostPropertyScreen7> {
  PostPropertyController postPropertyController = Get.put(PostPropertyController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostPropertyController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45..w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 52..h),
              Row(
                children: [
                  CustomText(
                    text: "Property Title",
                    fontSize: 16..sp,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: "*",
                    fontSize: 16..sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.k0xffDA0404,
                  ),
                ],
              ),
              SizedBox(height: 7..h),
              TextFormField(
                // controller: widget.controller,
                decoration: InputDecoration(
                  hintText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4..r),
                    borderSide: BorderSide(
                      color: AppColors.k0xff3C1663,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0..r),
                    borderSide: BorderSide(
                      color: AppColors.k0xff3C1663,
                      width: 1..w, // Change the border width to make it visible
                    ),
                  ),
                ),
              ),
              SizedBox(height: 36..h),
              const Divider(),
              SizedBox(height: 22..h),
              CustomText(
                text: "Property Description",
                fontSize: 16..sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 7..h),
              TextFormField(
                // controller: widget.controller,
                decoration: InputDecoration(
                  hintText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4..r),
                    borderSide: BorderSide(
                      color: AppColors.k0xff3C1663,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0..r),
                    borderSide: BorderSide(
                      color: AppColors.k0xff3C1663,
                      width: 1..w, // Change the border width to make it visible
                    ),
                  ),
                ),
              ),
              SizedBox(height: 36..h),
              const Divider(),
              SizedBox(height: 22..h),
              Center(
                child: CustomText(
                  text: "Upload Images of Your Property",
                  fontSize: 16..sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20..h),
              // Center(
              //   child: DottedBorder(
              //     color: AppColors.k0xff3C1663,
              //     borderType: BorderType.RRect,
              //     dashPattern: const <double>[10, 3],
              //     radius: Radius.circular(5..r),
              //     strokeWidth: 1,
              //     child: Container(
              //       height: 55..h,
              //       width: 277..w,
              //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Image.asset(
              //             "$iconPath/plus.png",
              //             height: 24..h,
              //             width: 24..w,
              //           ),
              //           SizedBox(width: 4..w),
              //           CustomText(
              //             text: "Upload From Gallery",
              //             fontSize: 13..sp,
              //             fontWeight: FontWeight.w300,
              //             color: AppColors.k0xff3C1663,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 45..h),
              Padding(
                padding: EdgeInsets.all(20.0..w),
                child: CustomButton(
                  onTap: () {},
                  label: 'Save Draft',
                  color: AppColors.k0xff7B48B0,
                  labelColor: Colors.white,
                ),
              ),
              SizedBox(height: 20..h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0..w),
                child: CustomButton(
                  onTap: () {},
                  label: 'Post listing',
                  color: AppColors.k0xff7B48B0,
                  labelColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
