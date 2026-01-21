import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, void>> addFavorite({
    required String userId,
    required String productCode,
  });

  Future<Either<Failure, void>> removeFavorite({
    required String userId,
    required String productCode,
  });

  Future<Either<Failure, Set<String>>> getFavorites({
  required String userId,
});
}
