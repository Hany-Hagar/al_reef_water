// ignore_for_file: strict_top_level_inference

import 'cart_states.dart';
import '../../data/repo/cart_repo.dart';
import '../../data/model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/data/models/product_model.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit({required this.cartRepo}) : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  int totalItems = 0;
  double totalPrice = 0.0;
  List<CartModel> cartItems = [];

  void fetchCartItems() async {
    emit(CartLoading());
    final result = await cartRepo.getCartItems();
    result.fold((failure) => emit(CartFailure(failure.message)), (data) {
      cartItems = data.items;
      totalPrice = data.total;
      totalItems = data.totalItems;
      emit(CartSuccess());
    });
  }

  String getItemCount(String cartId) {
    final item = cartItems.firstWhere(
      (item) => item.id == cartId,
      orElse: () => CartModel.empty(),
    );
    return item.quantity.toString();
  }

  void addToCart(ProductModel product) async {
    emit(AddToCartLoading(productId: product.id));
    final result = await cartRepo.addToCart(product);
    result.fold((failure) => emit(CartFailure(failure.message)), (cartItem) {
      cartItems.add(cartItem);
      totalPrice += cartItem.totalPrice;
      totalItems += cartItem.quantity;
      emit(AddToCartSuccess());
    });
  }

  void removeFromCart(String cartId) async {
    emit(RemoveFromCartLoading(cartId: cartId));
    final result = await cartRepo.removeFromCart(cartId);
    result.fold((failure) => emit(CartFailure(failure.message)), (_) {
      cartItems.removeWhere((item) {
        totalPrice -= item.totalPrice * item.quantity;
        totalItems -= item.quantity;
        return item.id == cartId;
      });
      emit(RemoveFromCartSuccess());
    });
  }

  void increaseCartQuantity(String cartId) async {
    final item = cartItems.firstWhere((item) => item.id == cartId);
    final newQuantity = item.quantity + 1;
    final newTotalPrice = item.totalPrice + item.product.price;
    totalItems += 1;
    emit(IncreaseCartQuantityLoading(cartId: cartId));
    _updateCartQuantity(
      cartId,
      newQuantity,
      IncreaseCartQuantitySuccess(),
      newTotalPrice,
    );
  }

  void decreaseCartQuantity(String cartId) async {
    final item = cartItems.firstWhere((item) => item.id == cartId);
    if (item.quantity > 1) {
      totalItems -= 1;
      final newQuantity = item.quantity - 1;
      final newTotalPrice = item.totalPrice - item.product.price;
      emit(DecreaseCartQuantityLoading(cartId: cartId));
      _updateCartQuantity(
        cartId,
        newQuantity,
        DecreaseCartQuantitySuccess(),
        newTotalPrice,
      );
    } else {
      totalItems -= 1;
      removeFromCart(cartId);
    }
  }

  void _updateCartQuantity(
    String cartId,
    int quantity,
    CartState state,
    double updateTotalPrice,
  ) async {
    final result = await cartRepo.updateCartQuantity(
      cartId,
      quantity,
      updateTotalPrice,
    );
    result.fold((failure) => emit(CartFailure(failure.message)), (_) {
      final index = cartItems.indexWhere((item) => item.id == cartId);
      if (index != -1) {
        final updatedItem = cartItems[index].copyWith(
          quantity: quantity,
          totalPrice: updateTotalPrice,
        );
        cartItems[index] = updatedItem;
        emit(state);
      }
    });
  }
}
