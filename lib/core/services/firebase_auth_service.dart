import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {

  static const List<String> _scopes = <String>[
  'email',
];

final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
bool _isGoogleSignInInitialized = false;

Future<void> _initializeGoogleSignIn() async {
  await _googleSignIn.initialize();
  _isGoogleSignInInitialized = true;
}

Future<void> _ensureGoogleSignInInitialized() async {
  if (!_isGoogleSignInInitialized) {
    await _initializeGoogleSignIn();
  }
}

Future<GoogleSignInAccount?> _getGoogleAccount() async {
  await _ensureGoogleSignInInitialized();

  try {
    return await _googleSignIn.authenticate(
      scopeHint: _scopes,
    );
  } on GoogleSignInException catch (e) {
    log('Google Sign In error: $e');
    return null;
  } catch (e) {
    log('Unexpected Google Sign-In error: $e');
    return null;
  }
}

  
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
      if (e.code == 'email-already-in-use') {
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
      case 'user-not-found':
        throw CustomException(
          message: 'البريد الإلكتروني غير مسجل مسبقًا.',
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

  Future<User> signInWithGoogle() async {
  final account = await _getGoogleAccount();

  if (account == null) {
    throw CustomException(message: 'تم إلغاء تسجيل الدخول');
  }

  final googleAuth =  account.authentication;

  final credential = GoogleAuthProvider.credential(
    idToken: googleAuth.idToken,
  );

  final userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  return userCredential.user!;
}


}
