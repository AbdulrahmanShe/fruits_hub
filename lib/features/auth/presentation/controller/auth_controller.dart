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

}