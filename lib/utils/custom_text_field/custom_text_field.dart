import 'package:a2aff/const/colors.dart';
import 'package:a2aff/const/image_or_icon_path.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWithLabel extends StatefulWidget {
  final String? label;
  final bool? isOptional;
  final String? hintText;
  final Color? borderColor;
  final Color? labelColor;
  final double? labelSize;
  final TextEditingController? controller;

  const TextFieldWithLabel({
    super.key,
    this.label,
    this.isOptional = false,
    this.hintText,
    this.controller,
    this.borderColor,
    this.labelColor,
    this.labelSize,
  });

  @override
  State<TextFieldWithLabel> createState() => _TextFieldWithLabelState();
}

class _TextFieldWithLabelState extends State<TextFieldWithLabel> {
  bool isTapped = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              text: widget.label!,
              fontSize: widget.labelSize,
              color: focusNode.hasFocus
                  ? widget.labelColor ?? AppColors.k0xff352049
                  : widget.labelColor ?? AppColors.k0xff9D9D9D,
            ),
            CustomText(
              text: widget.isOptional == false ? "*" : " (Optional)",
              color: widget.isOptional == true
                  ? AppColors.k0xff9D9D9D
                  : AppColors.k0xffDA0404,
            ),
          ],
        ),
        SizedBox(height: 5..h),
        SizedBox(
          height: 40..h,
          child: TextFormField(
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.bottom,
            onTap: () {
              setState(() {
                isTapped = true;
              });
            },
            onChanged: (text) {
              setState(() {
                isTapped = false;
              });
            },
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintText ?? '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4..r),
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.k0xff9D9D9D,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0..r),
                borderSide: BorderSide(
                  color: AppColors.k0xff352049,
                  width: 2..w, // Change the border width to make it visible
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 18..h),
      ],
    );
  }
}

class CustomTextFieldWithIcon extends StatelessWidget {
  final TextEditingController? controller;
  final String? assetIcon;
  final String? hintText;

  const CustomTextFieldWithIcon(
      {super.key, required this.hintText, this.assetIcon, this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41..h,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(vertical: 15..h, horizontal: 5..w),
          filled: true,
          hintText: hintText ?? 'Enter text',
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0..w),
            child: Image.asset(assetIcon!, height: 18..h, width: 18..w),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4..r),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0..w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              color: Colors
                  .transparent, // Same border color as in the normal state
              width: 0..w,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldRightIcon extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  Function(String)? onChange;

  CustomTextFieldRightIcon(
      {super.key, required this.hintText, this.controller, this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41..h,
      child: TextFormField(
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 10..h, right: 19..w),
          filled: true,
          hintText: hintText ?? 'Enter text',
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 10.0..w, bottom: 10..w),
            child: Image.asset("$iconPath/search.png",
                height: 24..h, width: 24..w),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4..r),
            borderSide: BorderSide(
              color: AppColors.k0xff3C1663,
              width: 1..w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              color: AppColors.k0xff3C1663,
              width: 1..w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              color: AppColors.k0xff3C1663,
              width: 1..w,
            ),
          ),
        ),
      ),
    );
  }
}
