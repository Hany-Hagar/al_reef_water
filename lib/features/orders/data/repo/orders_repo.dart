import 'package:dartz/dartz.dart';
import '../models/order_model.dart';
import '../../../../core/failure/failure.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderModel>>> getOrders();

  Future<Either<Failure, OrderModel>> addOrder({required OrderModel order});

  Future<Either<Failure, void>> cancelOrder({required String orderId});
}
