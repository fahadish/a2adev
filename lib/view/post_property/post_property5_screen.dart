import 'package:a2aff/const/colors.dart';
import 'package:a2aff/const/image_or_icon_path.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/post_property_controller.dart';
import '../../utils/button/custom_button.dart';

class PostPropertyScreen5 extends StatefulWidget {
  const PostPropertyScreen5({super.key});

  @override
  State<PostPropertyScreen5> createState() => _PostPropertyScreen5State();
}

class _PostPropertyScreen5State extends State<PostPropertyScreen5> {
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
                    text: "Handover date",
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
              SizedBox(height: 20..h),
              Row(
                children: [
                  CustomText(
                    text: "OP",
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
              SizedBox(height: 20..h),
              Row(
                children: [
                  CustomText(
                    text: "SP",
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
                    text: "Service Charge",
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
                    text: "ROI",
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
              SizedBox(height: 20..h),
              SizedBox(height: 80..h),
              Padding(
                padding: EdgeInsets.all(20.0..w),
                child: CustomButton(
                  onTap: () {},
                  label: 'Next',
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
