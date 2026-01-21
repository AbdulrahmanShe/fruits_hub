import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';
import 'package:fruits_hub/features/home/presentation/controller/favorite_controller.dart';
import 'package:fruits_hub/features/home/domain/repo/favorite_repo.dart';
import 'package:fruits_hub/features/home/data/repo/favorite_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
class FavoritBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatabaseService>(
      () => FireStoreService(),
      fenix: true,
    );

    Get.lazyPut<FavoriteRepo>(
      () => FavoriteRepoImpl(Get.find()),
      fenix: true,
    );

    Get.lazyPut<FavoriteController>(
      () {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          throw Exception('User not logged in');
        }
        return FavoriteController(
          favoriteRepo: Get.find(),
          userId: user.uid,
        );
      },
      fenix: true,
    );
  }
}
