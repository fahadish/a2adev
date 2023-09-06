import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/userModel.dart';
import '../view/bottom_appbar/bottom_appbar.dart';
import '../view/home/home_screen.dart';
import '../view/splash/splash_screen.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

bool loading = false;



  Rxn<User> firebaseUser = Rxn<User>();
  RxBool isLoading = false.obs;
  Rx<UserModel?> userData = Rx<UserModel?>(null);
  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
  }


  String locationController = "";
  String? imageLink;
  File? imageFile;
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
  Widget myBottomSheetR(BuildContext context) {
    return Container(
      height: 100.h,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Select RERA certificate',
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



  void clearImage() {
    imageFile = null;
    imageLink = null;
    update();
  }
  Future<void> signOut() async {
    EasyLoading.show(status: 'Loading...');
    await _auth.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    prefs.remove('email');
    prefs.remove('password');
    EasyLoading.dismiss();
    EasyLoading.showToast('SignOut successfully');

    Get.to(SplashScreen());

  }


  Future<void> uploadImageToFirebase(String folderName) async {
    if (imageFile != null) {
      try {
        EasyLoading.show(status: 'Loading...');

        isLoading.value = true;
        loading=true;


        final firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child('$folderName/${firebaseUser.value?.email}/${DateTime.now()}.png');

        await firebaseStorageRef.putFile(imageFile!);

        final downloadUrl = await firebaseStorageRef.getDownloadURL();
        imageLink = downloadUrl;
        loading=false;
        EasyLoading.dismiss();

        EasyLoading.showToast('Image uploaded successfully');

        isLoading.value = false;
      } catch (e) {
        EasyLoading.dismiss();

        isLoading.value = false;
        loading=false;

        // EasyLoading.showToast('Error uploading image');
      }
    } else {
      // EasyLoading.showToast('No image selected');
    }
  }
  // Function to remove uploaded image from Firebase Storage
  Future<void> removeImageFromFirebase() async {
    if (imageLink != null) {
      try {
        EasyLoading.show(status: 'Loading...');
        isLoading.value = true;

        final firebaseStorageRef =
        FirebaseStorage.instance.refFromURL(imageLink!);

        await firebaseStorageRef.delete();
        imageLink = null;
        imageFile = null;
        EasyLoading.showToast('Image removed successfully');

        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
        EasyLoading.showToast('Error removing image');
      }
    } else {
      EasyLoading.showToast('No image to remove');
    }
  }

  bool loginSuccessful = false; // Initialize with a default value
  String? userEmail;
  String? userPassword;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      loading = true;
      isLoading.value = true;

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Set loginSuccessful, userEmail, and userPassword upon successful login
      loginSuccessful = true;
      userEmail = email;
      userPassword = password;
      if (loginSuccessful) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        // Save other user data if needed
        prefs.setString('email', userEmail!);
        prefs.setString('password', userPassword!);
      }

      // await fetchUserData(_auth.currentUser!.uid);
      Get.offAll(() => CustomBottomAppBar());
      Get.snackbar('Success', 'Login successfully');
    } catch (e) {
      print('Authentication Error: $e');
      handleAuthError(e);
    } finally {
      loading = false;
      isLoading.value = false;
    }
  }


  Future<UserModel?> fetchUserData(String userId) async {
    try {
      DocumentSnapshot userSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();


      final user = UserModel.fromSnapshot(userSnapshot);
      return user; // Return the UserModel object
    } catch (e) {
      print('Error fetching user data: $e');
      return null; // Return null if there's an error
    }
  }
  String? getCurrentUserUid() {
    return firebaseUser.value?.uid; // Assuming firebaseUser is a Rxn<User>
  }
  Future<void> registerUserWithData({
    required String password,
    required bool certified,
    required String certifiedImage,
    required String company,
    required String phone,
    required String phoneW,
    required String email,
    required String name,
    required String location,
    required String experience,
    required String status,
    required List<String> specialty,
    required String profileImage,
  }) async {
    try {
      EasyLoading.show(status: 'Loading...');

      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userMap = {
        'certified': certified,
        'certified_image': certifiedImage,
        'company': company,
        'phone': phone,
        'phoneW': phoneW,
        'email': email,
        'name': name,
        'location': location,
        'experience': experience,
        'status': status,
        'specialty': specialty,
        'profile_image': profileImage,
      };

      CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

      await usersCollection.doc(userCredential.user!.uid).set(userMap);
      // await fetchUserData(userCredential.user!.uid);

      EasyLoading.dismiss();
      EasyLoading.showToast('User Register successfully');

      Get.to(CustomBottomAppBar());
    } catch (e) {
      print('Error during registration: $e');
      handleAuthError(e);
      EasyLoading.showToast('User Register failed');

      Get.to(SplashScreen());

    }
  }

  void handleAuthError(dynamic error) {
    String errorMessage = 'An error occurred';
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
        case 'wrong-password':
          errorMessage = 'Invalid email or password';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format';
          break;
        default:
          errorMessage = 'Authentication error: ${error.message}';
      }
    }
    EasyLoading.showToast(errorMessage);
  }
  Future<void> updateUserData({
    required String userId,
    required Map<String, dynamic> updatedData,
  }) async {
    try {
      EasyLoading.show(status: 'Updating...');

      // Reference to the users collection
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

      // Update the user's document with the provided data
      await usersCollection.doc(userId).update(updatedData);

      EasyLoading.dismiss();
      EasyLoading.showToast('User data updated successfully');

      // Optionally, fetch updated user data after updating
      UserModel? updatedUser = await fetchUserData(userId);
      if (updatedUser != null) {
        userData.value = updatedUser; // Update the userData value
      }
    } catch (e) {
      print('Error updating user data: $e');
      EasyLoading.showToast('Error updating user data');
    }
  }



  Future<void> uploadImageToFirebase2(String folderName, File imageFile) async {
    if (imageFile != null) {
      try {
        EasyLoading.show(status: 'Loading...');

        isLoading.value = true;
        loading = true;

        final firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child('$folderName/${firebaseUser.value?.email}/${DateTime.now()}.png');

        await firebaseStorageRef.putFile(imageFile);

        final downloadUrl = await firebaseStorageRef.getDownloadURL();
        imageLink = downloadUrl;
        loading = false;
        EasyLoading.dismiss();

        EasyLoading.showToast('Image uploaded successfully');

        isLoading.value = false;
      } catch (e) {
        EasyLoading.dismiss();

        isLoading.value = false;
        loading = false;
        // Handle the error
      }
    } else {
      // Handle the case where imageFile is null
    }
  }


}
