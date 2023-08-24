import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import '../view/bottom_appbar/bottom_appbar.dart';
import '../view/home/home_screen.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController locations = TextEditingController();
  String locationController = "";
  String? imageLink;
  File? imageFile;
  RxBool isLoading = false.obs;
  CountryCode? countryCode;
  List<String> locationsList = ["Faisalabad", "Islamabad", "Lahore"];

  List<String>? locationsListSearch;
  List<String> locationsListAdd = [];

  void searchLocation(String query) {
    final text = locationsList.where((element) {
      return element.contains(query.toLowerCase());
    }).toList();
    locationsListSearch = text;
    update();
  }

  void changeCountry(CountryCode value) {
    countryCode = value;
    update();
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      imageLink = pickedFile.path;
      print(imageLink);
      update();
    } else {
      print('No image selected.');
    }
    update();
  }

  Widget myBottomSheet(BuildContext context) {
    return Container(
      height: 100.h,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              // color: AppTheme.appColor,
              // fontFamily: AppTheme.fontfamily,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () async {
                  await getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      // color: AppTheme.appColor,
                    ),
                    SizedBox(width: 8.0.w),
                    Text(
                      'Camera',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        // color: AppTheme.appColor,
                        // fontFamily: AppTheme.fontfamily,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  await getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.image,
                      // color: AppTheme.appColor,
                    ),
                    SizedBox(width: 8.0.w),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        // color: AppTheme.appColor,
                        // fontFamily: AppTheme.fontfamily,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      isLoading.value = true; // Set loading state
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      EasyLoading.showToast('Login successfully');
      Get.offAll(
          () => CustomBottomAppBar()); // Use Get.off or Get.offAll as needed

      // After successful authentication, you might want to navigate to another screen
    } catch (e) {
      EasyLoading.showToast('Provided valid credentials');
      // Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false; // Reset loading state
    }
  }

  // Future<void> signInWithEmailAndPassword(String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
