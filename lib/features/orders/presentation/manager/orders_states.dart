sealed class OrdersStates {}

class OrdersInitialState extends OrdersStates {}

class OrdersLoading extends OrdersStates {}

class OrdersLoaded extends OrdersStates {}

class OrdersFailure extends OrdersStates {
  final String message;
  OrdersFailure({required this.message});
}