import 'package:a2aff/const/colors.dart';
import 'package:a2aff/const/image_or_icon_path.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/post_property_controller.dart';
import '../../utils/button/custom_button.dart';

class PostPropertyScreen2 extends StatefulWidget {
  const PostPropertyScreen2({super.key});

  @override
  State<PostPropertyScreen2> createState() => _PostPropertyScreen2State();
}

class _PostPropertyScreen2State extends State<PostPropertyScreen2> {
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
                    text: "Area / Community",
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
              Container(
                height: 40..h,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10..w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.k0xff3C1663,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Enter area size"),
                      ),
                    ),
                    Container(
                      height: 30..w,
                      width: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 17..w),
                    CustomText(
                      text: "Sq ft:",
                      fontWeight: FontWeight.w500,
                      fontSize: 16..sp,
                      color: AppColors.k0xff545454,
                    ),
                    SizedBox(width: 17..w),
                  ],
                ),
              ),
              SizedBox(height: 20..h),
              Row(
                children: [
                  CustomText(
                    text: "Building",
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
              SizedBox(height: 20..h),
              Row(
                children: [
                  CustomText(
                    text: "Type /Series",
                    fontSize: 16..sp,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: " (optional)",
                    fontSize: 16..sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.k0xffCBCBCB,
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
              SizedBox(height: 80..h),
              CustomButton(
                onTap: () {},
                label: 'Next',
                color: AppColors.k0xff7B48B0,
                labelColor: Colors.white,
              ),
            ],
          ),
        ),
      );
    });
  }
}
