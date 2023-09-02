import 'package:cloud_firestore/cloud_firestore.dart';
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
    fetchPropertyData(); //
    // Automatically fetch property data when the controller is initialized

  }

  List<Property> propertyList = []; // Initialize an empty list to store properties

  // Future<void> fetchPropertyData() async {
  //   try {
  //     // Reference to the Firestore collection "properties"
  //     CollectionReference collection = FirebaseFirestore.instance.collection("properties");
  //
  //     // If lastFetchedId is null, fetch the first document; otherwise, fetch the next document
  //     Query query;
  //     if (lastFetchedId == null) {
  //       query = collection.orderBy(FieldPath.documentId);
  //     } else {
  //       query = collection.orderBy(FieldPath.documentId).startAfter([lastFetchedId]);
  //     }
  //
  //     // Get the next document
  //     QuerySnapshot querySnapshot = await query.limit(1).get();
  //
  //     if (querySnapshot.docs.isNotEmpty) {
  //       // Get the first document in the result
  //       DocumentSnapshot docSnapshot = querySnapshot.docs.first;
  //
  //       // Convert the document data into a Property object
  //       Property propertyData = Property.fromMap(docSnapshot.data() as Map<String, dynamic>);
  //
  //       // Append the fetched property data to the propertyList
  //       propertyList.add(propertyData);
  //
  //       // Update lastFetchedId to the document ID of the last fetched item
  //       lastFetchedId = docSnapshot.id;
  //
  //       // Print the fetched property data
  //       print('Fetched property data: $propertyData');
  //
  //       // Notify any listeners (e.g., UI) about the updated property list
  //       property.value = propertyData;
  //     } else {
  //       // No more documents available
  //       print('No more documents available');
  //       property.value = null;
  //     }
  //   } catch (error) {
  //     print('Error fetching property data: $error');
  //   }
  // }
  Future<void> fetchPropertyData() async {
    try {
      // Reference to the Firestore collection "properties"
      CollectionReference collection = FirebaseFirestore.instance.collection("properties");

      // Define the query to start after the last fetched document
      Query query = collection.orderBy(FieldPath.documentId);

      if (lastFetchedId != null) {
        query = query.startAfter([lastFetchedId]);
      }

      // Get the next document
      QuerySnapshot querySnapshot = await query.limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Get the first document in the result
        DocumentSnapshot docSnapshot = querySnapshot.docs.first;

        // Convert the document data into a Property object
        Property propertyData = Property.fromMap(docSnapshot.data() as Map<String, dynamic>);

        // Append the fetched property data to the propertyList
        propertyList.add(propertyData);

        // Update lastFetchedId to the document ID of the last fetched item
        lastFetchedId = docSnapshot.id;

        // Print the fetched property data
        print('Fetched property data: $propertyData');

        // Notify any listeners (e.g., UI) about the updated property list
        property.value = propertyData;
      } else {
        // No more documents available
        print('No more documents available');
        property.value = null;
      }
    } catch (error) {
      print('Error fetching property data: $error');
    }
  }

}