import 'dart:io';

import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/view/auth/sign_up/signup_screen4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const/image_or_icon_path.dart';
import '../../../controller/authController.dart';
import '../../../utils/button/custom_button.dart';
import 'package:get/get.dart';
import '../../../utils/custom_card/big_card.dart';
import '../../../utils/custom_text_field/custom_text_field.dart';
import '../../bottom_appbar/bottom_appbar.dart';

class SignupScreen5 extends StatefulWidget {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String selectedOption;
  final String companyName;
  final String? imageLinkRera;
  final bool isReraCertified; // Declare the variable here

  final List<String> selectedOptions;
  final String locations;
  final String experience; // Add experience parameter

  SignupScreen5({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.selectedOption,
    required this.companyName,
    required this.imageLinkRera,
    required this.isReraCertified,
    required this.selectedOptions,
    required this.locations,
    required this.experience, // Add experience parameter
  });
  @override
  State<SignupScreen5> createState() => _SignupScreen5State();
}

class _SignupScreen5State extends State<SignupScreen5> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        body: BackgroundWhite(
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 78..h, left: 37..w),
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          onPressed: ()
                          =>

                          Get.back(),
                          ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 63..w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CustomText(
                        text: "Add profile picture",
                        fontSize: 24..sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 45..h),
                    controller.imageFile != null
                        ? Center(
                            child: Container(
                                width: 222..w,
                                height: 297..h,
                                // padding: EdgeInsets.symmetric(horizontal: 75..w),
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(4),
                                //   color: const Color(0xffd9d9d9),
                                // ),
                                child: Image.file(
                                  File(controller.imageFile!.path),
                                )),
                          )
                        : Center(
                            child: Container(
                              width: 222..w,
                              height: 297..h,
                              padding: EdgeInsets.symmetric(horizontal: 75..w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xffd9d9d9),
                              ),
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (builder) =>
                                          controller.myBottomSheet(context));
                                },
                                child:
                                    // controller.imageFile != null
                                    //     ? ClipRRect(
                                    //         borderRadius: BorderRadius.circular(25..r),
                                    //         child: Image.file(
                                    //             File(controller.imageFile!.path),
                                    //             fit: BoxFit.cover))
                                    //     :

                                    CircleAvatar(
                                  backgroundColor: AppColors.k0xff9D9D9D,
                                  child: Icon(Icons.add,
                                      color: Colors.white, size: 35..r),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 104..h),
                    CustomButton(
                        // onTap: () async {
    onTap: () async {
    // if (controller.imageFile == null) {
    // // Show a toast if no profile picture is provided
    // EasyLoading.showToast('Please provide a profile picture');
    // } else{
    //
    //
    //                       await authController
    //                           .uploadImageToFirebase("Profile_Images");
    //                       if (authController.imageLink != null) {
    //                         print(
    //                             'Uploaded Image URL: Uploaded Image URL: ${authController.imageLink}');
    //
    //
    //                         await authController.registerUserWithData(
    //                           password: widget.password,
    //                           certified: widget.isReraCertified,
    //                           certifiedImage: widget.imageLinkRera ?? "NoData",
    //                           company: widget.companyName,
    //                           phone: widget.phoneNumber,
    //                           email: widget.email,
    //                           name: widget.name,
    //                           location: widget.locations,
    //                           experience: widget.experience,
    //                           status: widget.selectedOption,
    //                           specialty: widget.selectedOptions,
    //                           profileImage: authController.imageLink.toString(),
    //                         );
    //
    //                       }}},
                          // Add navigation or other logic as neede
                        // Get.to(CustomBottomAppBar()),
if(authController.imageLink != null){
  await authController.uploadImageToFirebase("Profile_Images");

  await authController.registerUserWithData(
      password: widget.password,
      certified: widget.isReraCertified,
      certifiedImage: widget.imageLinkRera ?? "NoData",
      company: widget.companyName,
      phone: widget.phoneNumber,
      email: widget.email,
      name: widget.name,
      location: widget.locations,
      experience: widget.experience,
      status: widget.selectedOption,
      specialty: widget.selectedOptions,
      profileImage: authController.imageLink.toString());
}else{

  await authController.registerUserWithData(
      password: widget.password,
      certified: widget.isReraCertified,
      certifiedImage: widget.imageLinkRera ?? "NoData",
      company: widget.companyName,
      phone: widget.phoneNumber,
      email: widget.email,
      name: widget.name,
      location: widget.locations,
      experience: widget.experience,
      status: widget.selectedOption,
      specialty: widget.selectedOptions,
      profileImage: authController.imageLink.toString());

}




}
,
                        label: 'Next')
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
