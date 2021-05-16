import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxDouble totalBill = 500.0.obs;

  void updateTotalBill(double value) {
    totalBill.value = value;
    update();
  }
}
