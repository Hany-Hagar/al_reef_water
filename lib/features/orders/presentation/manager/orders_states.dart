sealed class OrdersStates {}

class OrdersInitialState extends OrdersStates {}

class OrdersLoading extends OrdersStates {}

class OrdersLoaded extends OrdersStates {}

class OrdersFailure extends OrdersStates {
  final String message;
  OrdersFailure({required this.message});
}

class AddOrderLoading extends OrdersStates {}

class AddOrderSuccess extends OrdersStates {}

class CancelOrderLoading extends OrdersStates {}

class CancelOrderSuccess extends OrdersStates {}

class CancelOrderFailure extends OrdersStates {
  final String message;
  CancelOrderFailure({required this.message});
}