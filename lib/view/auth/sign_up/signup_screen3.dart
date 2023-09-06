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

class SignupScreen3 extends StatefulWidget {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String phoneNumberW;
  final String selectedOption;
  final String companyName;
  final String? imageLinkRera;
  final bool isReraCertified; // Declare the variable here

  final List<String> selectedOptions;


  SignupScreen3({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.phoneNumberW,
    required this.selectedOption,
    required this.companyName,
    required this.imageLinkRera,
    required this.isReraCertified,
    required this.selectedOptions,
  });
  @override
  State<SignupScreen3> createState() => _SignupScreen3State();
}

class _SignupScreen3State extends State<SignupScreen3> {
  AuthController authController = Get.put(AuthController());
  final TextEditingController locations = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        body: BackgroundWhite(
          child: Column(
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
                    onPressed: () => Get.back(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 63..w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "What areas locations \nare you expert at?",
                        fontSize: 24..sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 45..h),
                      CustomTextFieldRightIcon(
                        hintText: '',

                          controller:locations,
                        // onChange: (value) {
                        //   controller.locationController = value;
                        //   controller
                        //       .searchLocation(controller.locationController);
                        // },
                      ),
                      // SizedBox(
                      //   height: 300,
                      //   child: ListView.separated(
                      //     itemCount: 2,
                      //     separatorBuilder: (context, index) =>
                      //         SizedBox(height: 10..h),
                      //     itemBuilder: (context, index) => Align(
                      //       alignment: Alignment.topLeft,
                      //       child: Container(
                      //           padding: EdgeInsets.fromLTRB(
                      //               15..w, 6..h, 12..w, 6..h),
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(64),
                      //               color: Color(0xffdab7ff)),
                      //           child: Row(
                      //             mainAxisSize: MainAxisSize.min,
                      //             children: [
                      //               CustomText(
                      //                 text: "Faisalabad",
                      //                 color: Colors.black,
                      //                 fontSize: 13..sp,
                      //               ),
                      //               SizedBox(width: 5..w),
                      //               Icon(Icons.close)
                      //             ],
                      //           )),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 104..h),
                      CustomButton(

                          onTap: () {
                            if (locations.text.isEmpty) {
                              // Show a toast message indicating that the location should be provided
                              EasyLoading.showToast('Please provide valid location');
                            } else {
                              // Navigate to the SignupScreen4 if the location is not empty
                              authController.clearImage();
                              Get.to(SignupScreen4(
                                name: widget.name,
                                email: widget.email,
                                password: widget.password,
                                phoneNumber: widget.phoneNumber,
                                phoneNumberW: widget.phoneNumberW,
                                selectedOption: widget.selectedOption,
                                companyName: widget.companyName,
                                imageLinkRera: widget.imageLinkRera,
                                isReraCertified: widget.isReraCertified,
                                selectedOptions: widget.selectedOptions,
                                locations: locations.text,
                              ));
                            }
                          },
                          // onTap:
                          //     () {
                          //
                          //       authController.clearImage();
                          //   Get.to(SignupScreen4(
                          //
                          //       name: widget.name,
                          //       email: widget.email,
                          //       password: widget.password,
                          //       phoneNumber: widget.phoneNumber,
                          //       selectedOption: widget.selectedOption,
                          //       companyName: widget.companyName,
                          //       imageLinkRera: widget.imageLinkRera,
                          //       isReraCertified: widget.isReraCertified,
                          //       selectedOptions: widget.selectedOptions,
                          //       locations: locations.text, // Pass the
                          //     ));},
                          //
                          //
                          label: 'Next')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
