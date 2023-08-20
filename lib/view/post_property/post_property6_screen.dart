import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/post_property_controller.dart';
import '../../utils/button/custom_button.dart';

class PostPropertyScreen6 extends StatefulWidget {
  const PostPropertyScreen6({super.key});

  @override
  State<PostPropertyScreen6> createState() => _PostPropertyScreen6State();
}

class _PostPropertyScreen6State extends State<PostPropertyScreen6> {
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
              SizedBox(height: 50..h),
              CustomText(
                text: "Source",
                fontSize: 16..sp,
                fontWeight: FontWeight.w600,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: DropdownButton<String>(
                        value: controller.selectedItem,
                        isExpanded: true,
                        onChanged: (newValue) {
                          setState(() {
                            controller.selectedItem = newValue!;
                          });
                        },
                        icon: const SizedBox(),
                        underline: const SizedBox(),
                        items: controller.dropdownItems.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Center(child: Text(item)),
                          );
                        }).toList(),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_sharp)
                  ],
                ),
              ),
              SizedBox(height: 20..h),
              CustomText(
                text: "Negotiation",
                fontSize: 16..sp,
                fontWeight: FontWeight.w600,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: DropdownButton<String>(
                        value: controller.selectedItem,
                        isExpanded: true,
                        onChanged: (newValue) {
                          setState(() {
                            controller.selectedItem = newValue!;
                          });
                        },
                        icon: const SizedBox(),
                        underline: const SizedBox(),
                        items: controller.dropdownItems.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Center(child: Text(item)),
                          );
                        }).toList(),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_sharp)
                  ],
                ),
              ),
              SizedBox(height: 20..h),
              CustomText(
                text: "Coverage",
                fontSize: 16..sp,
                fontWeight: FontWeight.w600,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: DropdownButton<String>(
                        value: controller.selectedItem,
                        isExpanded: true,
                        onChanged: (newValue) {
                          setState(() {
                            controller.selectedItem = newValue!;
                          });
                        },
                        icon: const SizedBox(),
                        underline: const SizedBox(),
                        items: controller.dropdownItems.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Center(child: Text(item)),
                          );
                        }).toList(),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_sharp)
                  ],
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
              SizedBox(height: 80..h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0..w),
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
