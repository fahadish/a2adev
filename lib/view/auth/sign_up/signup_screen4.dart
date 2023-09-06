import 'package:a2aff/const/colors.dart';
import 'package:a2aff/utils/background_image/background_image.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:a2aff/view/auth/sign_up/signup_screen5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const/image_or_icon_path.dart';
import '../../../utils/button/custom_button.dart';
import 'package:get/get.dart';
import '../../../utils/custom_card/big_card.dart';
import '../../../utils/custom_text_field/custom_text_field.dart';

class SignupScreen4 extends StatefulWidget {
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
  final String locations; // Add locations parameter

  SignupScreen4({
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
    required this.locations, // Add locations parameter
  });

  @override
  State<SignupScreen4> createState() => _SignupScreen4State();
}

class _SignupScreen4State extends State<SignupScreen4> {
  final TextEditingController experience = TextEditingController();
  String selectedOption = "1";
  String selectedExperience = "1"; // Initialize with a default value

  List<String> dropdownOptions = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "5+",
    "10+",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundColored(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 78..h, left: 37..w),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
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
                  children: [
                    CustomText(
                      text:
                          "How many years of Real-\nEstate experience do you\nhave?",
                      fontSize: 24..sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    SizedBox(height: 45..h),
                    // Container(
                    //   height: 40..h,
                    //   width: double.maxFinite,
                    //   padding: EdgeInsets.symmetric(horizontal: 16.0..w),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(4.0),
                    //     border: Border.all(color: Colors.grey),
                    //   ),
                    //   child: DropdownButton<String>(
                    //        underline: const SizedBox(),
                    //        icon: const SizedBox(),
                    //        value: selectedExperience, // Use selectedExperience here
                    //        onChanged: (newValue) {
                    //
                    //          setState(() {
                    //            selectedExperience = newValue!; // Update selectedExperience with the selected value
                    //          });
                    //        },
                    //     isExpanded: true,
                    //        items: dropdownOptions.map<DropdownMenuItem<String>>((String value) {
                    //          return DropdownMenuItem<String>(
                    //            value: value,
                    //            child: Text(value),
                    //          );
                    //        }).toList(),
                    //      ),
                    // ),
                    Container(
                      height: 40.0,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButton<String>(
                        underline: const SizedBox(),
                        value: selectedExperience, // Use selectedExperience here
                        onChanged: (newValue) {
                          setState(() {
                            selectedExperience = newValue!;
                          });
                        },
                        isExpanded: true,
                        items: dropdownOptions.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )
,
                    SizedBox(height: 104..h),
                    CustomButton(
                      onTap: () {

                          // Navigate to SignupScreen5 if the experience is not empty
                          Get.to(SignupScreen5(
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
                            locations: widget.locations,
                            experience: selectedExperience,
                          ));
                          print('${selectedExperience}');
                        },
                      label: 'Next',
                    ),
                    SizedBox(height: 20..h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
