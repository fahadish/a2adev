import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/post_property_controller.dart';
import '../../utils/button/custom_button.dart';

class PostPropertyScreen4 extends StatefulWidget {
  const PostPropertyScreen4({super.key});

  @override
  State<PostPropertyScreen4> createState() => _PostPropertyScreen4State();
}

class _PostPropertyScreen4State extends State<PostPropertyScreen4> {
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
              Row(
                children: [
                  CustomText(
                    text: "Occupancy",
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
                  border: Border.all(color: Colors.grey),
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
                text: "Finishing",
                fontSize: 16..sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 7..h),
              Container(
                height: 40..h,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10..w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
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
                text: "Floor",
                fontSize: 16..sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 7..h),
              Container(
                height: 40..h,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10..w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
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
                text: "Payment Terms",
                fontSize: 16..sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 7..h),
              Container(
                height: 40..h,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10..w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
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
                text: "Payment Plan",
                fontSize: 16..sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 7..h),
              Container(
                height: 40..h,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10..w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20..h),
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
