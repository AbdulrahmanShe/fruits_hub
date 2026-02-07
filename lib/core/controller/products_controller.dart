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
  final featuredProducts = <ProductEntity>[].obs;
  final errorMessage = ''.obs;
  // search
  final filteredProducts = <ProductEntity>[].obs;
  final recentSearches = <String>[].obs;
  final searchQuery = ''.obs;
  // Filter
final minPrice = 0.0.obs;
final maxPrice = 20.0.obs;
final selectedCategory = 'الكل'.obs;

  final currentView = ProductsListView.featured.obs;

  List<ProductEntity> get activeProducts {
    return currentView.value == ProductsListView.all
        ? products
        : featuredProducts;
  }


  List<ProductEntity> get displayProducts {
  if (searchQuery.isNotEmpty ||
      selectedCategory.value != 'الكل' ||
      minPrice.value != 0 ||
      maxPrice.value != 20) {
    return filteredProducts;
  }
  return activeProducts;
}


  Future<void> getProducts({bool force = false}) async{
  setView(ProductsListView.all);
  if (!force && products.isNotEmpty) return;
  isLoading.value = true;
  final result = await productsRepo.getProducts();
  isLoading.value = false;
  
  return handleProductsResult(result,target: products, successMessage: 'تم تحميل المنتجات بنجاح');

  } 

  Future<void> getFeaturedProducts({bool force = false}) async{
    
  setView(ProductsListView.featured);
  if (!force && featuredProducts.isNotEmpty) return;
  isLoading.value = true;
  final result = await productsRepo.getFeaturedProducts();
  isLoading.value = false;
  
  return handleProductsResult(result,target: featuredProducts, successMessage: 'تم تحميل المنتجات المميزة بنجاح');
  
  }
    

     Future<void> handleProductsResult(Either<Failure, List<ProductEntity>> result,{required RxList<ProductEntity> target, required String successMessage}) async{
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
          target.value = productsList;
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
  applyFilter();
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

  filteredProducts.value = activeProducts.where((product) {
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
    final set = activeProducts.map((e) => e.category).toSet().toList();
    set.insert(0, 'الكل');
    return set;
  }
void selectCategory(String category) {
  selectedCategory.value = category;
  applyFilter();
}

/// ✅ التصنيفات + أول منتج (للصورة)
  Map<String, ProductEntity> get categoriesWithProduct {
    final Map<String, ProductEntity> map = {};

    for (final product in activeProducts) {
      map.putIfAbsent(product.category, () => product);
    }

    return map;
  }

  /// أسماء التصنيفات (مع الكل)
  List<String> get categorie {
    return ['الكل', ...categoriesWithProduct.keys];
  }

  void setView(ProductsListView view) {
    currentView.value = view;
    // Reset filters when switching views so category selection
    // in one view doesn't affect the other.
    searchQuery.value = '';
    selectedCategory.value = 'الكل';
    minPrice.value = 0;
    maxPrice.value = 20;
    applyFilter();
  }

}

enum ProductsListView { all, featured }
