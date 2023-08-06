import 'package:get/get.dart';

class PropertyListingController extends GetxController {
  int selectedIndex = -1;

  void selectIndex(int index) {
    selectedIndex = index;
    update();
  }
}
