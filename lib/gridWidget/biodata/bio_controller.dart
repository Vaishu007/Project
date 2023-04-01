import 'package:get/get.dart';

class BioController extends GetxController {
  late String selectedGender;
  late var select = "".obs;

  void onClickRadioButton(value) {
    print(value);
    select.value = value;
    update();
  }
}
