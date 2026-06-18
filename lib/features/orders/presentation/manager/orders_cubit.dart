import 'orders_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/orders_repo.dart';
import '../../data/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/data/model/cart_model.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../locations/data/models/location_model.dart';

class OrdersCubit extends Cubit<OrdersStates> {
  final OrdersRepo ordersRepo;
  OrdersCubit({required this.ordersRepo}) : super(OrdersInitialState());
  static OrdersCubit get(BuildContext context) => BlocProvider.of(context);

  // Fetch Orders
  List<OrderModel> orders = [];

  Future<void> fetchOrders() async {
    emit(OrdersLoading());
    final result = await ordersRepo.getOrders();
    result.fold(
      (failure) => emit(OrdersFailure(message: failure.message)),
      (orders) {
        this.orders = orders;
        emit(OrdersLoaded());
      },
    );
  }

  // Add Order Data
  String userId = "";
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  LocationModel? selectedLocation;
  double totalPrice = 0.0;
  List<CartModel> cartItems = [];
  String cancelOrderId = "-1";

  /// Initialize Order from Cart
  void initializeOrderFromCart({
    required List<CartModel> cartItems,
    required double totalPrice,
    required LocationModel? selectedLocation,
    required UserModel user,
  }) {
    userId = user.id;
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    phoneController.text = user.phone;
    this.selectedLocation = selectedLocation;
    this.totalPrice = totalPrice;
    this.cartItems = cartItems;
  }

  /// Add Order

  OrderModel _orderModel() {
    return OrderModel(
      id: '',
      userId: userId,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phone: phoneController.text,
      location: selectedLocation!,
      totalPrice: totalPrice,
      cartItems: cartItems,
      createdAt: DateTime.now(),
      status: OrderStatus.pending,
    );
  }

  Future<void> addOrder({required GlobalKey<FormState> formKey}) async {
    if (!formKey.currentState!.validate()) return;
    emit(AddOrderLoading());
    final order = _orderModel();
    final result = await ordersRepo.addOrder(order: order);
    result.fold(
      (failure) => emit(OrdersFailure(message: failure.message)),
      (newOrder) => emit(AddOrderSuccess()),
    );
  }

  /// Cancel Order
  Future<void> cancelOrder(String orderId) async {
    cancelOrderId = orderId;
    emit(CancelOrderLoading());
    final result = await ordersRepo.cancelOrder(orderId: orderId);
    result.fold(
      (failure) => emit(CancelOrderFailure(message: failure.message)),
      (_) => emit(CancelOrderSuccess()),
    );
  }
}
