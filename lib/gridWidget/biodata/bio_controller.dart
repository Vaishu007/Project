import 'package:get/get.dart';

class BioController extends GetxController {
 late var selectMStatus="".obs;
  late var select = "".obs;

  void onClickRadioButton(value) {
    print(value);
    select.value = value;
    update();
  }
 void onClickMarriedRadioButton(value) {
   print(value);
   selectMStatus.value = value;
   update();
 }
}
