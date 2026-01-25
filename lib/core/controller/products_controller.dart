import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/controller/voice_search_controller.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/repos/products_repo/products_repo.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final ProductsRepo productsRepo;

  ProductsController({required this.productsRepo});

  final isLoading = false.obs;
  final products = <ProductEntity>[].obs;
  final errorMessage = ''.obs;
  // search
  final filteredProducts = <ProductEntity>[].obs;
  final recentSearches = <String>[].obs;
  final searchQuery = ''.obs;
  // Filter
final minPrice = 0.0.obs;
final maxPrice = 7.0.obs;
// final selectedCategory = ''.obs; // مثال: 'فواكه'

  Future<void> getProducts() async{
  isLoading.value = true;
  final result = await productsRepo.getProducts();
  isLoading.value = false;
  
  return handleProductsResult(result, successMessage: 'تم تحميل المنتجات بنجاح');

  } 

  Future<void> getBestSellingProducts() async{
    
  isLoading.value = true;
  final result = await productsRepo.getBestSellingProducts();
  isLoading.value = false;
  
  return handleProductsResult(result, successMessage: 'تم تحميل المنتجات الأكثر مبيعًا بنجاح');
  
  }
    

     Future<void> handleProductsResult(Either<Failure, List<ProductEntity>> result,{required String successMessage}) async{
    return result.fold(
          (failure) {
            errorMessage.value = failure.message;
      Get.snackbar(
        'خطأ',
        failure.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    },
         (productsList) {
          products.value = productsList;
          applyFilter(); // 👈 أضف هذا السطر
      Get.snackbar(
        'نجاح',
        successMessage,
        snackPosition: SnackPosition.BOTTOM,
      );

    },
         );
  }

  // Search
  void search(String query) {
    searchQuery.value = query;
    applyFilter();

    // if (query.isEmpty) {
    //   filteredProducts.clear();
    //   return;
    // }

    // filteredProducts.value = products
    //     .where((product) =>
    //         product.name.toLowerCase().contains(query.toLowerCase()))
    //     .toList();
  }

  void addRecentSearch(String value) {
    if (value.isEmpty) return;

    recentSearches.remove(value);
    recentSearches.insert(0, value);

    if (recentSearches.length > 5) {
      recentSearches.removeLast();
    }
  }

  void removeRecent(String value) {
    recentSearches.remove(value);
  }
  void clearSearch() {
    searchQuery.value = '';
  filteredProducts.clear();
  }
  void clearRecentSearches() {
  recentSearches.clear();
}

// voice Search
void setVoiceResult(String text) {
  searchQuery.value = text;
  search(text);
}
@override
void onClose() {
  clearSearch();
  clearRecentSearches();
  super.onClose();
}

@override
void dispose() {
  if (Get.isRegistered<VoiceSearchController>()) {
    Get.find<VoiceSearchController>().stopListening();
  }
  super.dispose();
}
// Filter
void applyFilter() {
  filteredProducts.value = products.where((product) {
    final matchesPrice =
        product.price >= minPrice.value &&
        product.price <= maxPrice.value;

    // final matchesCategory =
    //     selectedCategory.value.isEmpty ||
    //     product.category == selectedCategory.value;

    final matchesSearch =
        searchQuery.value.isEmpty ||
        product.name
            .toLowerCase()
            .contains(searchQuery.value.toLowerCase());

    return matchesPrice && matchesSearch; //return matchesPrice && matchesCategory && matchesSearch;
  }).toList();
}

}