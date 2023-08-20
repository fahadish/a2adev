import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';

class CustomCard extends StatelessWidget {
  final double? height;
  final double? width;
  final double? blurRadius;
  final double? spreadRadius;
  final double? topMargin;
  final double? topPadding;
  final double? bottomMargin;
  final double? bottomPadding;
  final double? rightMargin;
  final double? rightPadding;
  final double? leftMargin;
  final double? leftPadding;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final bool? enableBorder;
  final Widget child;
  final Color? color;
  final Color? shadowColor;
  const CustomCard(
      {super.key,
      this.height,
      this.width,
      this.borderRadius,
      this.topMargin,
      this.bottomMargin,
      this.rightMargin,
      this.leftMargin,
      required this.child,
      this.topPadding,
      this.bottomPadding,
      this.rightPadding,
      this.leftPadding,
      this.color,
      this.shadowColor,
      this.blurRadius,
      this.spreadRadius,
      this.enableBorder = false,
      this.borderColor,
      this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
          left: leftMargin ?? 0, right: rightMargin ?? 0, top: topMargin ?? 0, bottom: bottomMargin ?? 0),
      padding: EdgeInsets.only(
          left: leftPadding ?? 0, right: rightPadding ?? 0, top: topPadding ?? 0, bottom: bottomPadding ?? 0),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        border: enableBorder == true
            ? Border.all(
                color: borderColor ?? Colors.white,
                width: borderWidth ?? 1
                  ..w)
            : null,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 4)),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.transparent,
            blurRadius: blurRadius ?? 0,
            offset: const Offset(0, 0),
            spreadRadius: spreadRadius ?? 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
