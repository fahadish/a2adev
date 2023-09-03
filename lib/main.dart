import 'package:a2aff/view/auth/login/login_screen.dart';
import 'package:a2aff/view/auth/sign_up/signup_screen.dart';
import 'package:a2aff/view/bottom_appbar/bottom_appbar.dart';
import 'package:a2aff/view/bottom_appbar/bottom_appbar_on_propery_detail.dart';
import 'package:a2aff/view/chat/messages/messages_screen.dart';
import 'package:a2aff/view/profile/profile_screen.dart';
import 'package:a2aff/view/property_detail/property_detail_screen.dart';
import 'package:a2aff/view/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller/authController.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/authController.dart';
import 'controller/property controllerr.dart';
import 'firebase_options.dart';
import 'view/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final authController = AuthController(); //
  final propertyController = PropertyController(); // Add this line
// Instantiate the AuthController
  Get.put(
      authController); //
  Get.put(propertyController); // Add this line
// Put the AuthController into the GetX dependency management

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool _splitScreenMode = true; // Initialize the field

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: _splitScreenMode, // Use the initialized field here
      builder: (context, child) {
        return GetMaterialApp(
          home:
          // LoginScreen(),
          // SignUpScreen(),
          // CustomBottomAppBar(),
          SplashScreen(),
          // MessageScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
