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
  final TextInputType? keyboardType;

  final bool enabled; // Add this property
  final bool obsecure; // Add this property

  const TextFieldWithLabel({
    super.key,
    this.label,
    this.isOptional = false,
    this.enabled = true,
    this.obsecure = false,
    this.hintText,
    this.controller,
    this.borderColor,
    this.labelColor,
    this.labelSize,
    this.keyboardType,
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
        Container(
          padding: EdgeInsets.only(left: 10..w, top: 2..h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4..r),
            border: Border.all(
              color: focusNode.hasFocus
                  ? widget.labelColor ?? AppColors.k0xff352049
                  : widget.labelColor ?? AppColors.k0xff9D9D9D,
            ),
          ),
          height: 40..h,
          child: TextFormField(
            focusNode: focusNode,
            keyboardType: widget.keyboardType,
            enabled: widget.enabled,
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
            obscureText: widget.obsecure,
            style: TextStyle(height: 1.3..sp),
            decoration: InputDecoration(
              hintText: widget.hintText ?? '',
              isDense: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
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
    return Container(
      height: 41..h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4..r),
          border: Border.all(color: Colors.black45)),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 15..w, top: 10..h, bottom: 10..h, right: 10..w),
              child: Image.asset(assetIcon!, height: 18..h, width: 18..w),
            ),
            Flexible(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: hintText ?? 'Enter text',
                  // filled: true,
                  // fillColor: Colors.blue,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFieldWithIconObsecure extends StatefulWidget {
  final TextEditingController? controller;
  final String? assetIcon;
  final String? hintText;

  const CustomTextFieldWithIconObsecure({
    Key? key,
    required this.hintText,
    this.assetIcon,
    this.controller,
  }) : super(key: key);

  @override
  _CustomTextFieldWithIconObsecureState createState() =>
      _CustomTextFieldWithIconObsecureState();
}

class _CustomTextFieldWithIconObsecureState
    extends State<CustomTextFieldWithIconObsecure> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4..r),
          border: Border.all(color: Colors.black45)),
      child: Center(
        child: TextFormField(
          textAlignVertical: TextAlignVertical.top,
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            isDense: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            filled: true,
            hintText: widget.hintText ?? 'Enter text',
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset(widget.assetIcon!, height: 18, width: 18),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
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
