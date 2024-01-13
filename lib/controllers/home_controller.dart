import 'package:SiMedit/controllers/profile_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ProfileController profileController = Get.put(ProfileController());
  @override
  void onInit() {
    super.onInit();
    profileController.getProfiles();
    update();
  }

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
