
import 'package:get/get.dart';

SnackbarController showSnackBar(String title, String subTitle) {
  
    return Get.snackbar(
      title,
      subTitle,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1)
    );
  }