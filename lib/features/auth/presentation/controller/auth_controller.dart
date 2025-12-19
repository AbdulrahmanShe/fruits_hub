import 'package:fruits_hub/features/auth/domin/repos/auth_repo.dart';
import 'package:get/get.dart';
class AuthController extends GetxController{
final AuthRepo authRepo;

  AuthController({required this.authRepo});
  final isLoading = false.obs;

  Future<bool> signUpWithEmailAndPassword({
    required String email, required String password, required String name}) async{

      isLoading.value = true;

      final result = 
            await authRepo.createUserWithEmailAndPassword(email, password, name);

      isLoading.value = false;

        return  result.fold(
            (failure) {
        Get.snackbar(
          'خطأ',
          failure.message,
          snackPosition: SnackPosition.BOTTOM,
        );
        return false;
      },
           (user) {
        Get.snackbar(
          'نجاح',
          'تم إنشاء الحساب بنجاح',
          snackPosition: SnackPosition.BOTTOM,
        );
        return true;

        // Get.offAllNamed('/home');
      },
           );
           
  }

}