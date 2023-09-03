import 'package:a2aff/const/colors.dart';
import 'package:a2aff/const/image_or_icon_path.dart';
import 'package:a2aff/utils/custom_card/big_card.dart';
import 'package:a2aff/utils/custom_text/heading1/heading1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/authController.dart';
import '../../model/userModel.dart';
import '../../utils/custom_text_field/custom_text_field.dart';
import '../bottom_appbar/bottom_appbar.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel? userData; // Add this line to accept userData

  const EditProfileScreen({Key? key, this.userData}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  AuthController authController = Get.put(AuthController());
  UserModel? userData;

  bool isDataChanged = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneControllerW = TextEditingController();

  @override
  void initState() {
    super.initState();
    userData = widget.userData;
    nameController.text = userData?.name ?? '';
    emailController.text = userData?.email ?? '';
    // Initialize other controllers with userData values
    passwordController.text = ''; // Initialize password to empty
    passwordController.text = ''; // Initialize password to empty
    companyNameController.text = userData?.company ?? '';
    phoneController.text = userData?.phone ?? '';
    phoneControllerW.text = userData?.phoneW ?? '';
  }

  void checkDataChanges() {
    if (userData!.name != nameController.text ||
        userData!.email != emailController.text ||
        // Check other fields for changes
        userData!.company != companyNameController.text ||
        userData!.phone != phoneController.text||
        userData!.phoneW != phoneControllerW.text

    ) {
      isDataChanged = true;
    } else {
      isDataChanged = false;
    }
  }


  void updateUserData() async {
    if (isDataChanged) {
      Map<String, dynamic> updatedData = {
        'name': nameController.text,
        // 'email': emailController.text,
        // Add other fields as needed
        'company': companyNameController.text,
        'phone': phoneController.text,
        'phoneW': phoneControllerW.text,
      };

      String userId = authController.getCurrentUserUid() ?? '';

      await authController.updateUserData(
        userId: userId,
        updatedData: updatedData,
      );

      // Fetch the updated user data and update the local userData
      UserModel? updatedUser = await authController.fetchUserData(userId);
      if (updatedUser != null) {
        userData = updatedUser;
      }

      // Show a toast message using EasyLoading
      EasyLoading.showToast('User data updated successfully');
      Get.offAll(() => CustomBottomAppBar());
    } else {
      // Show a toast message using EasyLoading
      EasyLoading.showToast('Change something first');
    }
  }


  @override
  Widget build(BuildContext context) {
    UserModel? userData = widget.userData;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 63..h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0..w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  CustomText(
                    text: "Edit Profile",
                    fontSize: 24..sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(width: 20..w)
                ],
              ),
            ),
            SizedBox(height: 40..h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0..w),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 140..h,
                        width: 140..w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.k0xff352049),
                        ),
                        child: ClipOval(
                          child: userData?.profileImage == ''
                              ? Image.asset("assets/images/12.png")
                              : Image.network(
                                  '${userData?.profileImage}',
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return Image.asset("assets/images/12.png");
                                  },
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 10..h,
                        right: 7..w,
                        child: InkWell(
                          onTap: () {
                            EasyLoading.showToast('Under development....');
                          },
                          child: Image.asset(
                            "assets/icons/camera.png",
                            height: 24..h,
                            width: 26.6..w,
                          ),
                        ),
                      ),
                    ],
                  ),

                  TextFieldWithLabel(
                    label: "Name",
                    hintText: "Enter your name",
                    labelSize: 16..sp,
                    borderColor: const Color(0xff544C4C24),
                    labelColor: Colors.black,
                    controller: nameController,
                  ),
                  TextFieldWithLabel(
                    label: "Email",
                    hintText: "Enter your email",
                    labelSize: 16..sp,
                    borderColor: Color(0xff544C4C24),
                    labelColor: Colors.black,
                    controller: emailController,
                    enabled: false,
                  ),
                  TextFieldWithLabel(
                    label: "WhatsApp",
                    hintText: "Enter phone number",
                    labelSize: 16..sp,
                    borderColor: Color(0xff544C4C24),
                    labelColor: Colors.black,
                    controller: phoneController,
                  ),
                  SizedBox(height: 5..h),
                  TextFieldWithLabel(
                    label: "Company name",
                    hintText: "Pakistin",
                    labelSize: 16..sp,
                    borderColor: Color(0xff544C4C24),
                    labelColor: Colors.black,
                    controller: companyNameController,
                  ),
                  SizedBox(height: 5..h),
                  TextFieldWithLabel(
                    label: "WhatsApp",
                    hintText: "United Arab Emirates",
                    labelSize: 16..sp,
                    borderColor: Color(0xff544C4C24),
                    labelColor: Colors.black,
                    // isOptional: false,
                    controller: phoneControllerW,
                    // enabled: false,
                  ),
                  SizedBox(height: 30..h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80.0..w),
                    child: InkWell(
                      onTap: () {
                        checkDataChanges();
                        updateUserData();
                      },
                      child: CustomCard(
                        topPadding: 13..h,
                        bottomPadding: 13..h,
                        color: AppColors.k0xff7B48B0,
                        borderRadius: 50..r,
                        child: Center(
                          child: CustomText(
                            text: "Save",
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16..sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
