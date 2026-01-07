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
  late int productsLength = 0;

  Future<void> getProducts() async{
    // try {
  isLoading.value = true;
  final result = await productsRepo.getProducts();
  isLoading.value = false;
  
  // result.
  return handleProductsResult(result, successMessage: 'تم تحميل المنتجات بنجاح');
  // right(result);
  // }catch (e) {
  //   Left(ServerFailure(e.toString()));
  // }
  } 

  Future<void> getBestSellingProducts() async{
    // try {
  isLoading.value = true;
  final result = await productsRepo.getBestSellingProducts();
  isLoading.value = false;
  
  return handleProductsResult(result, successMessage: 'تم تحميل المنتجات الأكثر مبيعًا بنجاح');
  // right(result);
  // }catch (e) {
  //   Left(ServerFailure(e.toString()));
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
      // return false;
    },
         (productsList) {
          productsLength += productsList.length;
          products.value = productsList;
      Get.snackbar(
        'نجاح',
        successMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
      // return true;

    },
         );
  }
}
  // Future<void> handleUnitResult(Either<Failure, List<ProductEntity>> result,{required String successMessage}) async{
  //   // return result.fold(
  //         Left (
  //     Get.snackbar(
  //       'خطأ',
  //       'Failure',
  //       snackPosition: SnackPosition.BOTTOM,
  //     ),
  //     // return false;
  //         );
  //        right (
  //     Get.snackbar(
  //       'نجاح',
  //       successMessage,
  //       snackPosition: SnackPosition.BOTTOM,
  //     ),
  //     // return true;

    
  //        );
  // }
  
// }