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


class IncreaseCartQuantityLoading extends CartState {
  final String cartId;
  IncreaseCartQuantityLoading({required this.cartId});
}

class IncreaseCartQuantitySuccess extends CartState {}


class DecreaseCartQuantityLoading extends CartState {
  final String cartId;
  DecreaseCartQuantityLoading({required this.cartId});
}

class DecreaseCartQuantitySuccess extends CartState {}


class RemoveFromCartLoading extends CartState {
  final String cartId;
  RemoveFromCartLoading({required this.cartId});
}

class RemoveFromCartSuccess extends CartState {}