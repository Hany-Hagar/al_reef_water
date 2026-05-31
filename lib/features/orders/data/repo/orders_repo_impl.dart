import 'orders_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/order_model.dart';
import '../database/orders_data.dart';
import '../../../../core/failure/failure.dart';

class OrdersRepoImpl extends OrdersRepo {
  final OrdersData ordersData;
  OrdersRepoImpl({required this.ordersData});

  @override
  Stream<Either<Failure, List<OrderModel>>> getOrders() {
    try {
      return ordersData.getOrders().map((querySnapshot) {
        final orders = querySnapshot.docs
            .map((doc) => OrderModel.fromFirestore(doc.data()))
            .toList();
        return Right(orders);
      });
    } catch (e) {
      return Stream.value(Left(Failure.handle(e)));
    }
  }

  @override
  Future<Either<Failure, OrderModel>> addOrder({
    required OrderModel order,
  }) async {
    try {
      final docRef = await ordersData.addOrder(order.toFirestore());
      final docSnapshot = await docRef.get();
      final newOrder = OrderModel.fromFirestore(docSnapshot.data()!);
      return Right(newOrder);
    } catch (e) {
      return Left(Failure.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> cancelOrder({required String orderId}) async {
    try {
      await ordersData.cancelOrder(orderId);
      return const Right(null);
    } catch (e) {
      return Left(Failure.handle(e));
    }
  }
}
