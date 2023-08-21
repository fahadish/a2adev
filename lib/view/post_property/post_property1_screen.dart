import 'package:a2aff/const/colors.dart';
import 'package:a2aff/const/image_or_icon_path.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/post_property_controller.dart';
import '../../utils/button/custom_button.dart';

class PostPropertyScreen1 extends StatefulWidget {
  const PostPropertyScreen1({super.key});

  @override
  State<PostPropertyScreen1> createState() => _PostPropertyScreen1State();
}

class _PostPropertyScreen1State extends State<PostPropertyScreen1> {
  PostPropertyController postPropertyController = Get.put(PostPropertyController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostPropertyController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0..w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 52..h),
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
                          color: controller.sale == true ? AppColors.k0xff7B48B0 : AppColors.k0xffCBABEC,
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
                          color: controller.rent == true ? AppColors.k0xff7B48B0 : AppColors.k0xffCBABEC,
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
              SizedBox(height: 48..h),
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
                      color: controller.residential == true ? AppColors.k0xff7B48B0 : Colors.transparent,
                      child: Row(
                        children: [
                          Image.asset(
                            "$imagePath/residential.png",
                            height: 20..h,
                            width: 20..w,
                            color: controller.residential == true ? Colors.white : AppColors.k0xff7B48B0,
                          ),
                          SizedBox(width: 15..w),
                          CustomText(
                            text: "Residential",
                            fontSize: 15..sp,
                            fontWeight: FontWeight.w500,
                            color: controller.residential == true ? Colors.white : Colors.black,
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
                      color: controller.commercial == true ? AppColors.k0xff7B48B0 : Colors.transparent,
                      child: Row(
                        children: [
                          Image.asset(
                            "$imagePath/commercial.png",
                            height: 20..h,
                            width: 20..w,
                            color: controller.commercial == true ? Colors.white : AppColors.k0xff7B48B0,
                          ),
                          SizedBox(width: 15..w),
                          CustomText(
                            text: "Commercial",
                            fontSize: 15..sp,
                            fontWeight: FontWeight.w500,
                            color: controller.commercial == true ? Colors.white : Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 72..h),
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
                        separatorBuilder: (context, index) => SizedBox(width: 10..w),
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
                                text: index == 1 ? "Commercial / Office" : "Purpose",
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
