import 'package:a2aff/view/post_property/post_property1_screen.dart';
import 'package:a2aff/view/post_property/post_property2_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/colors.dart';
import '../../const/image_or_icon_path.dart';
import '../../controller/post_property_controller.dart';
import '../../utils/button/custom_button.dart';
import '../../utils/custom_card/big_card.dart';
import '../../utils/custom_text/heading1/heading1_text.dart';

class PostPropertyAllScreens extends StatelessWidget {
  final PostPropertyController postPropertyController =
      Get.put(PostPropertyController());

  PostPropertyAllScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 90..h),
          Padding(
            padding: EdgeInsets.only(left: 45.0..w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    postPropertyController.currentStep.value == 0
                        ? Get.back()
                        : postPropertyController.currentStep.value--;
                  },
                  child: Icon(Icons.arrow_back_ios, size: 25..r),
                ),
                CustomText(
                  text: "Post a Property",
                  fontSize: 24..sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: 70..w),
              ],
            ),
          ),
          SizedBox(height: 20..h),
          Obx(
            () => Flexible(
              child: Theme(
                data: ThemeData(
                  primarySwatch: Colors.deepPurple,
                ),
                child: Stepper(
                  controlsBuilder: (context, controller) {
                    return const SizedBox.shrink();
                  },
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  type: StepperType.horizontal,
                  steps: buildStep(context),
                  currentStep: postPropertyController.currentStep.value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Step> buildStep(BuildContext context) {
    return [
      Step(
        state: postPropertyController.currentStep.value == 0
            ? StepState.indexed
            : StepState.complete,
        isActive: postPropertyController.currentStep.value >= 0 ? true : false,
        title: const Text("  "),
        content: GetBuilder<PostPropertyController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Purpose",
                  fontSize: 16..sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 27..h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.selectSale();
                          },
                          child: CustomCard(
                            height: 164..h,
                            width: 164..w,
                            topPadding: 33..h,
                            bottomPadding: 33..h,
                            color: controller.sale == true
                                ? AppColors.k0xff7B48B0
                                : AppColors.k0xffCBABEC,
                            child: Image.asset(
                              "$imagePath/sale.png",
                            ),
                          ),
                        ),
                        SizedBox(height: 19..h),
                        CustomText(
                          text: "For Sale",
                          fontSize: 20..sp,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.selectRent();
                          },
                          child: CustomCard(
                            height: 164..h,
                            width: 164..w,
                            topPadding: 33..h,
                            bottomPadding: 33..h,
                            color: controller.rent == true
                                ? AppColors.k0xff7B48B0
                                : AppColors.k0xffCBABEC,
                            child: Image.asset(
                              "$imagePath/rent.png",
                            ),
                          ),
                        ),
                        SizedBox(height: 19..h),
                        CustomText(
                          text: "For Rent",
                          fontSize: 20..sp,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40..h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.selectResidential();
                      },
                      child: CustomCard(
                        topPadding: 7..h,
                        bottomPadding: 7..h,
                        leftPadding: 20..h,
                        rightPadding: 20..h,
                        color: controller.residential == true
                            ? AppColors.k0xff7B48B0
                            : AppColors.k0xffCBABEC,
                        child: Row(
                          children: [
                            Image.asset(
                              "$imagePath/residential.png",
                              height: 20..h,
                              width: 20..w,
                              color: controller.residential == true
                                  ? Colors.white
                                  : AppColors.k0xff7B48B0,
                            ),
                            SizedBox(width: 15..w),
                            CustomText(
                              text: "Residential",
                              fontSize: 15..sp,
                              fontWeight: FontWeight.w500,
                              color: controller.residential == true
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.selectCommercial();
                      },
                      child: CustomCard(
                        topPadding: 7..h,
                        bottomPadding: 7..h,
                        leftPadding: 20..h,
                        rightPadding: 20..h,
                        color: controller.commercial == true
                            ? AppColors.k0xff7B48B0
                            : AppColors.k0xffCBABEC,
                        child: Row(
                          children: [
                            Image.asset(
                              "$imagePath/commercial.png",
                              height: 20..h,
                              width: 20..w,
                              color: controller.commercial == true
                                  ? Colors.white
                                  : AppColors.k0xff7B48B0,
                            ),
                            SizedBox(width: 15..w),
                            CustomText(
                              text: "Commercial",
                              fontSize: 15..sp,
                              fontWeight: FontWeight.w500,
                              color: controller.commercial == true
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60..h),
                CustomText(
                  text: "Select Property Type",
                  fontSize: 16..sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20..h),
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios, size: 19..r),
                    Expanded(
                      child: SizedBox(
                        height: 55..h,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10..w),
                          itemBuilder: (context, index) => SizedBox(
                            width: 90..w,
                            child: Column(
                              children: [
                                Image.asset(
                                  "$imagePath/commercial.png",
                                  height: 32..h,
                                  width: 32..w,
                                ),
                                SizedBox(height: 10..h),
                                CustomText(
                                  text: index == 1
                                      ? "Commercial / Office"
                                      : "Purpose",
                                  fontSize: 9..sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_sharp, size: 19..r),
                  ],
                ),
                SizedBox(height: 66..h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0..w),
                  child: CustomButton(
                    onTap: () {
                      controller.currentStep++;
                    },
                    label: 'Next',
                    color: AppColors.k0xff7B48B0,
                    labelColor: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      Step(
        state: postPropertyController.currentStep.value <= 1
            ? StepState.indexed
            : StepState.complete,
        isActive: postPropertyController.currentStep.value >= 1 ? true : false,
        title: Text("  "),
        content: GetBuilder<PostPropertyController>(builder: (controller) {
          return Padding(
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
                SizedBox(height: 80..h),
                CustomButton(
                  onTap: () {
                    controller.currentStep++;
                  },
                  label: 'Next',
                  color: AppColors.k0xff7B48B0,
                  labelColor: Colors.white,
                ),
              ],
            ),
          );
        }),
      ),
      Step(
        state: postPropertyController.currentStep.value <= 2
            ? StepState.indexed
            : StepState.complete,
        isActive: postPropertyController.currentStep.value >= 2 ? true : false,
        title: Text("  "),
        content: GetBuilder<PostPropertyController>(builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 45..w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                            controller.selectedItem = newValue!;
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
                            controller.selectedItem = newValue!;
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
                      onTap: () {
                        controller.updateYes1();
                      },
                      child: Row(
                        children: [
                          controller.yes1 == false
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
                      onTap: () {
                        controller.updateNo1();
                      },
                      child: Row(
                        children: [
                          controller.no1 == false
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
                      onTap: () {
                        controller.updateYes();
                      },
                      child: Row(
                        children: [
                          controller.yes == false
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
                      onTap: () {
                        controller.updateNo();
                      },
                      child: Row(
                        children: [
                          controller.no == false
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
                  onTap: () {
                    controller.currentStep.value++;
                  },
                  label: 'Next',
                  color: AppColors.k0xff7B48B0,
                  labelColor: Colors.white,
                ),
              ],
            ),
          );
        }),
      ),
      Step(
        state: postPropertyController.currentStep.value <= 3
            ? StepState.indexed
            : StepState.complete,
        isActive: postPropertyController.currentStep.value >= 3 ? true : false,
        title: Text("  "),
        content: GetBuilder<PostPropertyController>(builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 45..w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                            controller.selectedItem = newValue!;
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
                            controller.selectedItem = newValue!;
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
                            controller.selectedItem = newValue!;
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
                            controller.selectedItem = newValue!;
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
                    onTap: () {
                      controller.currentStep.value++;
                    },
                    label: 'Next',
                    color: AppColors.k0xff7B48B0,
                    labelColor: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      Step(
        state: postPropertyController.currentStep.value <= 4
            ? StepState.indexed
            : StepState.complete,
        isActive: postPropertyController.currentStep.value >= 4 ? true : false,
        title: Text(""),
        content: GetBuilder<PostPropertyController>(builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 45..w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Padding(
                  padding: EdgeInsets.all(20.0..w),
                  child: CustomButton(
                    onTap: () {
                      controller.currentStep.value++;
                    },
                    label: 'Next',
                    color: AppColors.k0xff7B48B0,
                    labelColor: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      Step(
        state: postPropertyController.currentStep.value <= 5
            ? StepState.indexed
            : StepState.complete,
        isActive: postPropertyController.currentStep.value >= 5 ? true : false,
        title: Text("  "),
        content: GetBuilder<PostPropertyController>(builder: (controller) {
          return Padding(
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
                            controller.selectedItem = newValue!;
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
                            controller.selectedItem = newValue!;
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
                            controller.selectedItem = newValue!;
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0..w),
                  child: CustomButton(
                    onTap: () {
                      controller.currentStep.value++;
                    },
                    label: 'Next',
                    color: AppColors.k0xff7B48B0,
                    labelColor: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      Step(
        state: postPropertyController.currentStep.value <= 6
            ? StepState.indexed
            : StepState.complete,
        isActive: postPropertyController.currentStep.value >= 6 ? true : false,
        title: Text("  "),
        content: GetBuilder<PostPropertyController>(builder: (controller) {
          return Padding(
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
                const Divider(),
                SizedBox(height: 20..h),
                CustomText(
                  text: "Property Description",
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
                const Divider(),
                SizedBox(height: 20..h),
                Center(
                  child: CustomText(
                    text: "Upload Images of Your Property",
                    fontSize: 16..sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20..h),
                Center(
                  child: DottedBorder(
                    color: AppColors.k0xff3C1663,
                    borderType: BorderType.RRect,
                    dashPattern: const <double>[10, 3],
                    radius: Radius.circular(5..r),
                    strokeWidth: 1,
                    child: Container(
                      height: 55..h,
                      width: 277..w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "$iconPath/plus.png",
                            height: 24..h,
                            width: 24..w,
                          ),
                          SizedBox(width: 4..w),
                          CustomText(
                            text: "Upload From Gallery",
                            fontSize: 13..sp,
                            fontWeight: FontWeight.w300,
                            color: AppColors.k0xff3C1663,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
          );
        }),
      ),
    ];
  }
}
