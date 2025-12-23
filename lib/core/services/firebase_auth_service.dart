import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

class FirebaseAuthService {
//////////
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password,required String name,}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      /////////
      await credential.user!.updateDisplayName(name);
    await credential.user!.reload();

    return FirebaseAuth.instance.currentUser!;
    ////////
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }

  // Login
  Future<User> signInWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  try {
    final credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential.user ?? FirebaseAuth.instance.currentUser!;
  } on FirebaseAuthException catch (e) {
    log(
      "FirebaseAuthException in signInWithEmailAndPassword: ${e.message}, code: ${e.code}",
    );

    switch (e.code) {
      case 'invalid-email':
        throw CustomException(
          message: 'صيغة البريد الإلكتروني غير صحيحة.',
        );

      case 'user-not-found':
        throw CustomException(
          message: 'البريد الإلكتروني غير مسجل مسبقًا.',
        );

      case 'wrong-password':
        throw CustomException(
          message: 'كلمة المرور غير صحيحة.',
        );

      case 'invalid-credential':
        throw CustomException(
          message: 'بيانات تسجيل الدخول غير صحيحة.',
        );

      case 'network-request-failed':
        throw CustomException(
          message: 'تأكد من اتصالك بالإنترنت.',
        );

      default:
        throw CustomException(
          message: 'حدث خطأ غير متوقع، الرجاء المحاولة لاحقًا.',
        );
    }
  } catch (e) {
    log(
      "Exception in signInWithEmailAndPassword: ${e.toString()}",
    );

    throw CustomException(
      message: 'حدث خطأ غير متوقع، الرجاء المحاولة مرة أخرى.',
    );
  }
}


  /* ================= Email Reset ================= */

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'هذا البريد غير مسجل.');
      } else {
        throw CustomException(message: 'فشل إرسال رابط إعادة التعيين.');
      }
    }
  }

}
