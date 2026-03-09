import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
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
            message: S.current.alreadyRegisteredPleaseSignIn);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: S.current.checkInternetConnectionTypo);
      } else {
        throw CustomException(
            message: S.current.somethingWentWrongTryAgain);
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: S.current.somethingWentWrongTryAgain);
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
          message: S.current.emailNotRegistered,
        );

      case 'invalid-credential':
        throw CustomException(
          message: S.current.invalidCredentials,
        );

      case 'network-request-failed':
        throw CustomException(
          message: S.current.checkInternetConnection,
        );

      default:
        throw CustomException(
          message: S.current.unexpectedErrorTryLater,
        );
    }
  } catch (e) {
    log(
      "Exception in signInWithEmailAndPassword: ${e.toString()}",
    );

    throw CustomException(
      message: S.current.unexpectedErrorTryAgain,
    );
  }
}


  /* ================= Email Reset ================= */

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: S.current.thisEmailIsNotRegistered);
      } else {
        throw CustomException(message: S.current.failedToSendResetLink);
      }
    }
  }

  Future<User> signInWithGoogle() async {
  final account = await GetGoogleAccount()._getGoogleAccount();

  if (account == null) {
    throw CustomException(message: S.current.signInCancelled);
  }

  final googleAuth =  account.authentication;

  final credential = GoogleAuthProvider.credential(
    idToken: googleAuth.idToken,
  );

  final userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  return userCredential.user!;
}

bool isLoggedIn(){
  return FirebaseAuth.instance.currentUser != null;
}

}
 class GetGoogleAccount {
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
}
