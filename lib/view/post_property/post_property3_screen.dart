import 'package:a2aff/const/colors.dart';
import 'package:a2aff/const/image_or_icon_path.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/post_property_controller.dart';
import '../../utils/button/custom_button.dart';

class PostPropertyScreen3 extends StatefulWidget {
  const PostPropertyScreen3({super.key});

  @override
  State<PostPropertyScreen3> createState() => _PostPropertyScreen3State();
}

class _PostPropertyScreen3State extends State<PostPropertyScreen3> {
  PostPropertyController postPropertyController = Get.put(PostPropertyController());
  bool yes = false;
  bool yes1 = false;
  bool no = false;
  bool no1 = false;
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
                    text: "Bedrooms",
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: controller.selectedItem,
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
                    text: "Baths",
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
                        isExpanded: true,
                        value: controller.selectedItem,
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
              SizedBox(height: 49..h),
              Divider(),
              SizedBox(height: 34..h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 93..w,
                    child: CustomText(
                      text: "Maid Room:",
                      fontWeight: FontWeight.w500,
                      fontSize: 16..sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      yes1 == false ? yes1 = true : yes1 = false;
                      no1 = false;
                    }),
                    child: Row(
                      children: [
                        yes1 == false
                            ? Image.asset(
                                "$iconPath/box.png",
                                height: 18..h,
                                width: 18..w,
                                color: Colors.black,
                              )
                            : Image.asset(
                                "$iconPath/tick_box.png",
                                height: 18..h,
                                width: 18..w,
                                color: Colors.black,
                              ),
                        SizedBox(width: 11..w),
                        CustomText(
                          text: "Yes",
                          fontSize: 20..sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      no1 == false ? no1 = true : no1 = false;
                      yes1 = false;
                    }),
                    child: Row(
                      children: [
                        no1 == false
                            ? Image.asset(
                                "$iconPath/box.png",
                                height: 18..h,
                                width: 18..w,
                                color: Colors.black,
                              )
                            : Image.asset(
                                "$iconPath/tick_box.png",
                                height: 18..h,
                                width: 18..w,
                                color: Colors.black,
                              ),
                        SizedBox(width: 11..w),
                        CustomText(
                          text: "No",
                          fontSize: 20..sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 27..h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 93..w,
                        child: Row(
                          children: [
                            CustomText(
                              text: "Balcony:",
                              fontWeight: FontWeight.w500,
                              fontSize: 16..sp,
                            ),
                            CustomText(
                              text: "*",
                              fontWeight: FontWeight.w500,
                              fontSize: 16..sp,
                              color: AppColors.k0xffDA0404,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      yes == false ? yes = true : yes = false;
                      no = false;
                    }),
                    child: Row(
                      children: [
                        yes == false
                            ? Image.asset(
                                "$iconPath/box.png",
                                height: 18..h,
                                width: 18..w,
                                color: Colors.black,
                              )
                            : Image.asset(
                                "$iconPath/tick_box.png",
                                height: 18..h,
                                width: 18..w,
                                color: Colors.black,
                              ),
                        SizedBox(width: 11..w),
                        CustomText(
                          text: "Yes",
                          fontSize: 20..sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      no == false ? no = true : no = false;
                      yes = false;
                    }),
                    child: Row(
                      children: [
                        no == false
                            ? Image.asset(
                                "$iconPath/box.png",
                                height: 18..h,
                                width: 18..w,
                                color: Colors.black,
                              )
                            : Image.asset(
                                "$iconPath/tick_box.png",
                                height: 18..h,
                                width: 18..w,
                                color: Colors.black,
                              ),
                        SizedBox(width: 11..w),
                        CustomText(
                          text: "No",
                          fontSize: 20..sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 38..h),
              Divider(),
              SizedBox(height: 31..h),
              CustomText(
                text: "Area Size",
                fontWeight: FontWeight.w500,
                fontSize: 16..sp,
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
