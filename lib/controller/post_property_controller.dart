import 'package:get/get.dart';

class PostPropertyController extends GetxController {
  RxInt currentStep = 0.obs;
  bool? sale;
  bool? rent;
  bool? commercial;
  bool? residential;
  String selectedItem = '1';
  bool yes = false;
  bool yes1 = false;
  bool no = false;
  bool no1 = false;

  List<String> dropdownItems = ['1', '2', '3', '4'];

  @override
  void onInit() {
    // TODO: implement onInit
    sale = true;
    residential = true;
    super.onInit();
  }

  void selectSale() {
    sale = true;
    rent = false;
    update();
  }

  void selectRent() {
    rent = true;
    sale = false;
    update();
  }

  void selectResidential() {
    residential = true;
    commercial = false;
    update();
  }

  void selectCommercial() {
    commercial = true;
    residential = false;
    update();
  }

  void updateYes() {
    yes == false ? yes = true : yes = false;
    no = false;
    update();
  }

  void updateNo() {
    no == false ? no = true : no = false;
    yes = false;
    update();
  }

  void updateYes1() {
    yes1 == false ? yes1 = true : yes1 = false;
    no1 = false;
    update();
  }

  void updateNo1() {
    no1 == false ? no1 = true : no1 = false;
    yes1 = false;
    update();
  }
}
