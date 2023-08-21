import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  RxBool isLoading = false.obs;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      isLoading.value = true; // Set loading state
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => HomeScreenArchitecture()); // Use Get.off or Get.offAll as needed

      // After successful authentication, you might want to navigate to another screen
    } catch (e) {

      Get.snackbar('Error', e.toString());
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
