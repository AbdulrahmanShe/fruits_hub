import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/auth/domin/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domin/repos/auth_repo.dart';
import 'package:fruits_hub/core/utils/show_snack_bar.dart';
import 'package:fruits_hub/generated/l10n.dart';
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

        return  handleAuthResult(result,successMessage: S.current.accountCreatedSuccessfully);
           
  }

  Future<bool> signInWithEmailAndPassword({
    required String email, required String password,}) async{

      isLoading.value = true;

      final result = 
            await authRepo.signInWithEmailAndPassword(email, password,);

      isLoading.value = false;

        return  handleAuthResult(result,successMessage: S.current.signInSuccessful);
           
  }

Future<bool> signInWithGoogle() async {
  isLoading.value = true;

  final result = await authRepo.signInWithGoogle();

  isLoading.value = false;

  return handleAuthResult(
    result,
    successMessage: S.current.signedInWithGoogle,
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
    successMessage: S.current.passwordResetLinkSent,
  );
}



  Future<bool> handleAuthResult(Either<Failure, UserEntity> result,{required String successMessage}) async{
    return result.fold(
          (failure) {
      showSnackBar(S.current.error, failure.message);
      return false;
    },
         (user) {
      showSnackBar(S.current.success, successMessage);
      return true;

    },
         );
  }

  Future<bool> handleUnitResult(Either<Failure, Unit> result,{required String successMessage}) async{
    return result.fold(
          (failure) {
      showSnackBar(S.current.error, failure.message);
      return false;
    },
         (_) {
      showSnackBar(S.current.success, successMessage);
      return true;

    },
         );
  }

}
