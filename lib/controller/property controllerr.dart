import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/property_model.dart';
import 'authController.dart';

class PropertyController extends GetxController {
  final Rx<Property?> property = Rx<Property?>(null);
  String? lastFetchedId; // Track the last fetched ID

  // Getter to access the property data
  Property? get propertyData => property.value;
  late AuthController authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
    fetchPropertyData();
    // Automatically fetch property data when the controller is initialized
  }

  Future<void> fetchPropertyData() async {
    try {
      CollectionReference collection = FirebaseFirestore.instance.collection("properties");

      Query query = collection.orderBy(FieldPath.documentId);

      if (lastFetchedId != null) {
        query = query.startAfter([lastFetchedId]);
      }

      QuerySnapshot querySnapshot = await query.limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot docSnapshot = querySnapshot.docs.first;

        Property propertyData = Property.fromMap(docSnapshot.id, docSnapshot.data() as Map<String, dynamic>);

        lastFetchedId = docSnapshot.id;

        // Update the property value
        property.value = propertyData;

        // Print the new values
        print('New Property Data:');
        print('ID: ${propertyData.id}');
        print('Name: ${propertyData.email}');
        print('Description: ${propertyData.sp}');
        // Add more properties as needed

      } else {
        // No more documents available
        print('No more documents available');
        property.value = null;
      }
    } catch (error) {
      print('Error fetching property data: $error');
    }
  }

  RxBool isLoading = false.obs;

  // Function to handle swiping left (rejected)
  void swipeLeft() async {
    try {
      isLoading.value = true;

      // Get the current property being shown
      final currentProperty = propertyData;

      // Check if the current property is not null
      if (currentProperty != null) {
        // Store the user's swipe action in Firestore
        await storeSwipeAction(currentProperty.id ?? '', "swiped_left");

        // Fetch the next property
        await fetchPropertyData();
      } else {
        print("No property to swipe left on.");
      }

      isLoading.value = false;

      await EasyLoading.showToast('Removed');
    } catch (error) {
      print('Error swiping left: $error');
    }
  }

  // Function to handle swiping right (accepted)
  void swipeRight() async {
    try {
      isLoading.value = true;

      // Get the current property being shown
      final currentProperty = propertyData;

      // Check if the current property is not null
      if (currentProperty != null) {
        // Store the user's swipe action in Firestore
        await storeSwipeAction(currentProperty.id ?? '', "swiped_right");

        // Send a request to the property owner
        await sendRequestToPropertyOwner(currentProperty);

        // Fetch the next property
        await fetchPropertyData();
      } else {
        print("No property to swipe right on.");
      }

      isLoading.value = false;

      EasyLoading.showToast('Send Request successfully');
    } catch (error) {
      print('Error swiping right: $error');
    }
  }

  Future<void> storeSwipeAction(String propertyId, String action) async {
    try {
      final userId = authController.getCurrentUserUid();

      // Store the user's swipe action in Firestore
      await FirebaseFirestore.instance.collection("user_actions").add({
        "userId": userId,
        "propertyId": propertyId,
        "action": action,
        "timestamp": FieldValue.serverTimestamp(),
      });
    } catch (error) {
      print('Error storing swipe action: $error');
    }
  }



  Future<void> sendRequestToPropertyOwner(Property property) async {
    try {
      final requesterUserId = authController.getCurrentUserUid();

      // Make sure the Property class has a userId property, and use it here.
      final propertyOwnerId = property.ownerId ?? ''; // Provide a default value if userId is null

      // Create a document in the "requests" collection
      await FirebaseFirestore.instance.collection("requests").add({
        "propertyId": property.id,
        "requesterUserId": requesterUserId,
        "propertyOwnerId": propertyOwnerId,
        "status": "pending",
        // Include other request details
      });

      // Optionally, you can notify the property owner through a notification system or a messaging feature.

      EasyLoading.showToast('Request sent successfully');
    } catch (error) {
      print('Error sending request: $error');
      EasyLoading.showToast('Error sending request');
    }
  }
}

