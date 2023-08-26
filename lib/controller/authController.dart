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

import '../view/bottom_appbar/bottom_appbar.dart';
import '../view/home/home_screen.dart';
import '../view/splash/splash_screen.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
bool loading = false;
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

  // Future<void> signInWithEmailAndPassword(String email, String password) async {
  //   try {
  //     loading = true;
  //     isLoading.value = true; // Set loading state
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //     loading=false;
  //     EasyLoading.showToast('Login successfully');
  //     Get.offAll(
  //         () => CustomBottomAppBar()); // Use Get.off or Get.offAll as needed
  //
  //     // After successful authentication, you might want to navigate to another screen
  //   } catch (e) {
  //     loading=false;
  //     EasyLoading.showToast('Provided valid credentials');
  //     // Get.snackbar('Error', e.toString());
  //   } finally {
  //     isLoading.value = false; // Reset loading state
  //   }
  // }
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      loading = true;
      isLoading.value = true; // Set loading state

      // Sign in the user
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // Navigate to the next screen
      Get.offAll(() => CustomBottomAppBar());

      // Show a success message
      Get.snackbar('Success', 'Login successfully');

    } catch (e) {
      // Log the error for debugging purposes
      print('Authentication Error: $e');

      // Show a user-friendly error message
      String errorMessage = 'An error occurred';
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          errorMessage = 'Invalid email or password';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'Invalid email format';
        } // Add more specific error handling if needed
      }
      Get.snackbar('Error', errorMessage);

    } finally {
      loading = false;
      isLoading.value = false; // Reset loading state
    }
  }


  void clearImage() {
    imageFile = null;
    imageLink = null;
    update();
  }
  Future<void> signOut() async {
    EasyLoading.show(status: 'Loading...');
    await _auth.signOut();
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



  // Future<void> registerUser({
  //   required bool certified,
  //   required String certifiedImage,
  //   required String company,
  //   required String phone,
  //   required String email,
  //   required String name,
  //   required String location,
  //   required String experience,
  //   required String status,
  //   required List<String> specialty,
  //   required String profileImage,
  // }) async {
  //   try {
  //     loading=true;
  //
  //     EasyLoading.show(status: "Loading...");
  //     // Reference to the 'users' collection
  //     CollectionReference usersCollection =
  //     FirebaseFirestore.instance.collection('users');
  //
  //     // Create a new document with a generated ID
  //     await usersCollection.add({
  //       'certified': certified,
  //       'certified_image': certifiedImage,
  //       'company': company,
  //       'phone': phone,
  //       'email': email,
  //       'name': name,
  //       'location': location,
  //       'experience': experience,
  //       'status': status,
  //       'specialty': specialty,
  //       'profile_image': profileImage,
  //     });
  //     loading = false;
  //
  //     EasyLoading.dismiss();
  //     EasyLoading.showToast('User registered successfully');
  //     print('User registered successfully');
  //   } catch (e) {
  //     EasyLoading.dismiss();
  //     loading=false;
  //
  //
  //     print('Error registering user: $e');
  //   }
  // }
  Future<void> registerUserWithData({
    required String password,
    required bool certified,
    required String certifiedImage,
    required String company,
    required String phone,
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

      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userMap = {
        'certified': certified,
        'certified_image': certifiedImage,
        'company': company,
        'phone': phone,
        'email': email,
        'name': name,
        'location': location,
        'experience': experience,
        'status': status,
        'specialty': specialty,
        'profile_image': profileImage,
      };

      // Reference to the 'users' collection
      CollectionReference usersCollection = FirebaseFirestore.instance
          .collection('users');

      // Create a new document with the user's UID and set user data
      await usersCollection.doc(userCredential.user!.uid).set(userMap);
      EasyLoading.dismiss();
      EasyLoading.showToast('User Register successfully');
      
      Get.to(CustomBottomAppBar());
    } on FirebaseAuthException catch (e) {
      // FirebaseAuthException covers authentication related errors
      print('FirebaseAuthException: ${e.message}');
      EasyLoading.showToast('Authentication error: ${e.message}');
    } catch (e) {
      // Catch any other exceptions
      if (e is FirebaseException) {
        // Handle Firebase-related exceptions
        if (e.code == 'cancelled') {
          print('FirebaseException (cancelled): ${e.message}');
          EasyLoading.showToast('Operation cancelled');
        } else {
          print('FirebaseException: ${e.message}');
          EasyLoading.showToast('Firebase error: ${e.message}');
        }
      } else {
        // Handle other unexpected exceptions
        print('Unexpected error: $e');
        EasyLoading.showToast('An unexpected error occurred');
      }
    }
  }
}
