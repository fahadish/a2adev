import 'package:a2aff/view/auth/sign_up/signup_screen.dart';
import 'package:a2aff/view/post_property/post_property7_screen.dart';
import 'package:a2aff/view/post_property/post_property_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUpScreen(),
          // SplashScreen(),
        );
      },
    );
  }
}
