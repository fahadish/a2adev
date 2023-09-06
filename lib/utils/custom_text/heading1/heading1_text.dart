import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText24 extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomText24({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? 24
          ..sp,
        fontFamily: 'Lato',
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }
}

class CustomText20 extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomText20({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? 20
          ..sp,
        fontFamily: 'Lato',
        fontWeight: fontWeight ?? FontWeight.w600,
      ),
    );
  }
}

class CustomText16 extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final TextAlign? textAlign;
  const CustomText16({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textOverflow,
    this.maxLine,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 16
          ..sp,
        fontFamily: 'Lato',
        fontWeight: fontWeight ?? FontWeight.w600,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final int? maxLines; // Add maxLines parameter.

  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.maxLines, // Include maxLines in the constructor.

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: overflow,
        color: color ?? Colors.black,
        fontSize: fontSize ?? 14
          ..sp,
        fontFamily: 'Lato',
        fontWeight: fontWeight ?? FontWeight.w400,

      ),

      maxLines: maxLines, // Set maxLines in the Text widget.

    );
  }
}
