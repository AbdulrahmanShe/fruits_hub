import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:fruits_hub/features/home/domain/repo/favorite_repo.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final FavoriteRepo favoriteRepo;
  final String userId;

  FavoriteController({required this.favoriteRepo, required this.userId});

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  final RxSet<String> favoriteIds = <String>{}.obs;
  final RxBool isUpdating = false.obs;

  Future<void> loadFavorites() async {
    final result = await favoriteRepo.getFavorites(userId: userId);

    result.fold(
      (failure) {
        Get.snackbar(S.current.error, failure.message);
      },
      (ids) {
        favoriteIds
          ..clear()
          ..addAll(ids);
      },
    );
  }

  bool isFavorite(ProductEntity product) {
    return favoriteIds.contains(product.productId);
  }

  Future<void> toggleFavorite(ProductEntity product) async {
    if (isUpdating.value) return;
    isUpdating.value = true;

    final id = product.productId;
    if (id.isEmpty) {
      Get.snackbar(S.current.error, S.current.productIdUnavailable);
      isUpdating.value = false;
      return;
    }

    final isFav = isFavorite(product);

    isFav ? favoriteIds.remove(id) : favoriteIds.add(id);

    final result =
        isFav
            ? await favoriteRepo.removeFavorite(
              userId: userId,
              productAutoId: id,
            )
            : await favoriteRepo.addFavorite(userId: userId, productAutoId: id);

    result.fold((failure) {
      isFav ? favoriteIds.add(id) : favoriteIds.remove(id);
      Get.snackbar(S.current.error, failure.message);
    }, (_) {});

    isUpdating.value = false;
  }
}
