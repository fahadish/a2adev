import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../const/image_or_icon_path.dart';
import '../../utils/background_image/background_image.dart';
import '../auth/login/login_screen.dart';
import '../bottom_appbar/bottom_appbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn');

    if (isLoggedIn == true) {
      // User is already logged in, navigate to CustomBottomAppBar
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomAppBar()),
      );
    } else {
      // User is not logged in, navigate to LoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), checkUserLoggedIn);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundColored(
          child: Center(
        child: Image.asset(
          "$imagePath/logo.png",
          height: 154..h,
          width: 120..w,
        ),
      )),
    );
  }
}
