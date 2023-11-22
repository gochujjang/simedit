import 'package:get/get.dart';

class HomeController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    // If the tapped index is greater than or equal to the position of the spacer item,
    // increment it to account for the spacer item in the IndexedStack.
    if (index >= 2) {
      index--;
    }

    tabIndex = index;
    update();
  }
}
