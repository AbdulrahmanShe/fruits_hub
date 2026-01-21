import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/domain/repo/favorite_repo.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final FavoriteRepo favoriteRepo;
  final String userId;
  

  FavoriteController({
    required this.favoriteRepo,
    required this.userId,
  });

  @override
  void onInit() {
  super.onInit();
  loadFavorites();
  }

  final RxSet<String> favoritesCodes = <String>{}.obs;
  final RxBool isUpdating = false.obs;

  Future<void> loadFavorites() async {
  final result = await favoriteRepo.getFavorites(userId: userId);

  result.fold(
    (failure) {
      Get.snackbar('خطأ', failure.message);
    },
    (codes) {
  favoritesCodes
    ..clear()
    ..addAll(codes);
},
  );
}


  bool isFavorite(ProductEntity product) {
    return favoritesCodes.contains(product.code);
  }

  Future<void> toggleFavorite(ProductEntity product) async {
    if (isUpdating.value) return;
  isUpdating.value = true;

  final isFav = isFavorite(product);

  // تحديث UI فوراً
  isFav
      ? favoritesCodes.remove(product.code)
      : favoritesCodes.add(product.code);

  final result = isFav
      ? await favoriteRepo.removeFavorite(
          userId: userId,
          productCode: product.code,
        )
      : await favoriteRepo.addFavorite(
          userId: userId,
          productCode: product.code,
        );

  result.fold(
    (failure) {
      // rollback
      isFav
          ? favoritesCodes.add(product.code)
          : favoritesCodes.remove(product.code);

      Get.snackbar('خطأ', failure.message);
    },
    (_) {},
  );
  isUpdating.value = false;
}

}