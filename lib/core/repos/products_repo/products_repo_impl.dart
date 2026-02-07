// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/models/product_model.dart';
import 'package:fruits_hub/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';

class ProductsRepoImpl extends ProductsRepo {
 final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getFeaturedProducts() async{
    try {
  var data = await databaseService.getData(
    collectionName: BackendEndpoint.getProducts, 
    query: {
            'whereField': 'isFeatured',
            'whereValue': true,
            'limit': 10,
          }
    ) as List<Map<String, dynamic>>;

    List<ProductEntity> products =
        data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
    return right(products);

} catch (e) {
  return left(ServerFailure('Failed to get products'));
}
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async{
    try {
  var data = await databaseService.getData(
    collectionName: BackendEndpoint.getProducts, 
    ) as List<Map<String, dynamic>>;

    List<ProductEntity> products =
        data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
    return right(products);

} catch (e) {
  return left(ServerFailure('Failed to get products'));
}
  }


}
