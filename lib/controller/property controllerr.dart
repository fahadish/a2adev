import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/property_model.dart';

class PropertyController extends GetxController {
  final Rx<Property?> property = Rx<Property?>(null);
  String? lastFetchedId; // Track the last fetched ID

  // Getter to access the property data
  Property? get propertyData => property.value;

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
  void swipeLeft() async{
    // You can add any additional logic here if needed
    isLoading.value = true;

    fetchPropertyData();
    isLoading.value = false;

    await EasyLoading.showToast('Removed');
  }

  // Function to handle swiping right (accepted)
  void swipeRight() async{
    isLoading.value = true;

    // You can add any additional logic here if needed
   await fetchPropertyData();
    isLoading.value = false;

    EasyLoading.showToast('Send Request successfully');

  }
}
