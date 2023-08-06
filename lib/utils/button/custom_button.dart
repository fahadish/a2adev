import 'package:a2aff/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import '../custom_card/big_card.dart';
import '../custom_text/heading1/heading1_text.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Callback onTap;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomCard(
        width: double.maxFinite,
        topPadding: 15..h,
        bottomPadding: 15..h,
        borderRadius: 10..r,
        // rightPadding: 133..w,
        // leftPadding: 133..w,
        color: AppColors.k0xffFD7B01,
        child: Center(
          child: CustomText(
            text: label,
            fontSize: 15..sp,
            fontWeight: FontWeight.w600,
            color: AppColors.k0xff352049,
          ),
        ),
      ),
    );
  }
}
