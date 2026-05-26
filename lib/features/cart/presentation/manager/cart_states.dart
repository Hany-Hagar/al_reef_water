sealed class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {}

class CartFailure extends CartState {
  final String message;

  CartFailure(this.message);
}

class AddToCartLoading extends CartState {
  final String productId;
  AddToCartLoading({required this.productId});
}
class AddToCartSuccess extends CartState {}

class RemoveFromCartLoading extends CartState {}
class RemoveFromCartSuccess extends CartState {}