import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  String? imageLink;
  File? imageFile;

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
}
