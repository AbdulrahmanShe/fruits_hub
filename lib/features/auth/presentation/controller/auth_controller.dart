import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/auth/domin/entites/user_entity.dart';
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

        return  handleAuthResult(result,successMessage: 'تم إنشاء الحساب بنجاح');
           
  }

  Future<bool> signInWithEmailAndPassword({
    required String email, required String password,}) async{

      isLoading.value = true;

      final result = 
            await authRepo.signInWithEmailAndPassword(email, password,);

      isLoading.value = false;

        return  handleAuthResult(result,successMessage: 'تم تسجيل الدخول بنجاح');
           
  }

Future<bool> signInWithGoogle() async {
  isLoading.value = true;

  final result = await authRepo.signInWithGoogle();

  isLoading.value = false;

  return handleAuthResult(
    result,
    successMessage: 'تم تسجيل الدخول باستخدام Google',
  );
}

Future<bool> signInWithFacebook() async {
  isLoading.value = true;

  final result = await authRepo.signInWithFacebook();

  isLoading.value = false;

  return handleAuthResult(
    result,
    successMessage: 'تم تسجيل الدخول باستخدام Facebook',
  );
}

         //Email Reset

  Future<bool> sendPasswordResetEmail({
  required String email,
}) async {
  isLoading.value = true;

  final result = await authRepo.sendPasswordResetEmail(email);

  isLoading.value = false;

  return handleUnitResult(
    result,
    successMessage: 'تم إرسال رابط إعادة تعيين كلمة المرور',
  );
}



  Future<bool> handleAuthResult(Either<Failure, UserEntity> result,{required String successMessage}) async{
    return result.fold(
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
        successMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;

    },
         );
  }

  Future<bool> handleUnitResult(Either<Failure, Unit> result,{required String successMessage}) async{
    return result.fold(
          (failure) {
      Get.snackbar(
        'خطأ',
        failure.message,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    },
         (_) {
      Get.snackbar(
        'نجاح',
        successMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;

    },
         );
  }

}