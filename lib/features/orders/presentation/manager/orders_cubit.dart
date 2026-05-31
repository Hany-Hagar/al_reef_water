// ignore_for_file: strict_top_level_inference

import 'orders_states.dart';
import '../../data/repo/orders_repo.dart';
import '../../data/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersCubit extends Cubit<OrdersStates> {
  final OrdersRepo ordersRepo;
  OrdersCubit({required this.ordersRepo}) : super(OrdersInitialState());

  static OrdersCubit get(context) => BlocProvider.of(context);

  List<OrderModel> orders = [];

  void fetchOrders() {
    emit(OrdersLoading());
    var data = ordersRepo.getOrders();
    data.listen((ordersData) {
      ordersData.fold(
        (failure) => emit(OrdersFailure(message: failure.message)),
        (orders) {
          this.orders = orders;
          emit(OrdersLoaded());
        },
      );
    });
  }
}
