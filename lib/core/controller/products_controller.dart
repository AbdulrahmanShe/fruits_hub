import 'package:dartz/dartz.dart';
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
      Get.snackbar(
        'نجاح',
        successMessage,
        snackPosition: SnackPosition.BOTTOM,
      );

    },
         );
  }
}