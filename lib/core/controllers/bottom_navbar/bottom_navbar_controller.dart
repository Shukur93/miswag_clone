import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;
  Map<String, dynamic>? arguments;

  void changeIndexWithArgs(int index, {Map<String, dynamic>? args}) {
    currentIndex.value = index;
    arguments = args;
  }

  // reset arguments
  void resetArguments() {
    arguments = null;
  }
}
