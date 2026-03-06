import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/features/home/domain/repo/favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final DatabaseService databaseService;

  FavoriteRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, void>> addFavorite({
    required String userId,
    required String productAutoId,
  }) async {
    try {
      await databaseService.addData(
        collectionName:
            '${BackendEndpoint.users}/$userId/${BackendEndpoint.favorites}',
        docuementId: productAutoId,
        data: {'productAutoId': productAutoId, 'addedAt': DateTime.now()},
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('فشل إضافة المنتج للمفضلة'));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorite({
    required String userId,
    required String productAutoId,
  }) async {
    try {
      await databaseService.deleteData(
        collectionName:
            '${BackendEndpoint.users}/$userId/${BackendEndpoint.favorites}',
        docuementId: productAutoId,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('فشل حذف المنتج من المفضلة'));
    }
  }

  @override
  Future<Either<Failure, Set<String>>> getFavorites({
    required String userId,
  }) async {
    try {
      final result = await databaseService.getData(
        collectionName:
            '${BackendEndpoint.users}/$userId/${BackendEndpoint.favorites}',
      );

      final ids =
          (result as List)
              .map((e) {
                final map = e as Map<String, dynamic>;
                return (map['productAutoId'] ??
                        map['productCode'] ??
                        map['productId'] ??
                        '')
                    .toString();
              })
              .where((id) => id.isNotEmpty)
              .toSet();

      return Right(ids);
    } catch (e) {
      return Left(ServerFailure('فشل تحميل المفضلة'));
    }
  }
}
