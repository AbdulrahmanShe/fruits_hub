import 'package:get/get.dart';

class MainController extends GetxController {
  final currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is int && args >= 0 && args < 4) {
      currentIndex.value = args;
    }
  }

  void setIndex(int index) {
    currentIndex.value = index;
  }
}
