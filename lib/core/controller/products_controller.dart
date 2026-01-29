import 'package:dartz/dartz.dart';
import 'package:fruits_hub/features/search/presentation/controller/voice_search_controller.dart';
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
final maxPrice = 20.0.obs;
final selectedCategory = 'الكل'.obs;

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
//   void updateSearch(String value) {
//   searchQuery.value = value;
//   applyFilter();
// }
  void search(String query) {
    searchQuery.value = query;
    applyFilter();
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
  final query = searchQuery.value.toLowerCase();
  final category = selectedCategory.value;

  filteredProducts.value = products.where((product) {
    final matchesPrice =
        product.price >= minPrice.value &&
        product.price <= maxPrice.value;

    final matchesCategory =
        category == 'الكل' ||
        product.category == category;

    final matchesSearch =
        query.isEmpty ||
        product.name
            .toLowerCase()
            .contains(query);

    return matchesPrice && matchesCategory && matchesSearch; 
  }).toList();
}
//  / كل التصنيفات
  List<String> get categories {
    final set = products.map((e) => e.category).toSet().toList();
    set.insert(0, 'الكل');
    return set;
  }
// void selectCategory(String category) {
//   selectedCategory.value = category;
//   applyFilter();
// }

}