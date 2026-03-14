import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/features/checkout/data/models/order_history_model.dart';
import 'package:fruits_hub/features/checkout/data/models/order_model.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entites/order_history_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService dataBaseService;

  OrdersRepoImpl(this.dataBaseService);
  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderInputEntity order}) async {
    try {
      var orderModel = OrderModel.fromEntity(order);
      await dataBaseService.addData(
        collectionName: BackendEndpoint.addOrder,
        docuementId: orderModel.orderId,
        data: orderModel.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderHistoryEntity>>> getOrders({
    required String userId,
  }) async {
    try {
      final data = await dataBaseService.getData(
        collectionName: BackendEndpoint.addOrder,
        query: {
          'whereField': 'uId',
          'whereValue': userId,
        },
      );

      if (data == null) {
        return const Right(<OrderHistoryEntity>[]);
      }

      final list = (data as List<dynamic>)
          .whereType<Map<String, dynamic>>()
          .map((item) => OrderHistoryModel.fromJson(item).toEntity())
          .toList()
        ..sort((a, b) {
          final aDate =
              a.createdAt ??
              DateTime.tryParse(a.createdAtRaw ?? '') ??
              DateTime.fromMillisecondsSinceEpoch(0);
          final bDate =
              b.createdAt ??
              DateTime.tryParse(b.createdAtRaw ?? '') ??
              DateTime.fromMillisecondsSinceEpoch(0);
          return bDate.compareTo(aDate);
        });

      return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
