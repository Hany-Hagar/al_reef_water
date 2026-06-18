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
    if (cartItems.isEmpty) emit(CartLoading());
    final result = await cartRepo.getCartItems();
    result.fold((failure) => emit(CartFailure(failure.message)), (data) {
      cartItems = data.items;
      totalPrice = data.total;
      totalItems = data.totalItems;
      emit(CartSuccess());
    });
  }

  String getItemCount({required String cartId}) {
    final item = cartItems.firstWhere(
      (item) => item.id == cartId,
      orElse: () => CartModel.empty(),
    );
    return item.quantity.toString();
  }

  void addToCart({required ProductModel product}) async {
    emit(AddToCartLoading(productId: product.id));
    final result = await cartRepo.addToCart(product: product);
    result.fold((failure) => emit(CartFailure(failure.message)), (cartItem) {
      cartItems.add(cartItem);
      totalPrice += product.price;
      totalItems += 1;
      emit(AddToCartSuccess());
    });
  }

  void removeFromCart({required String cartId, CartState? loadingState}) async {
    emit(loadingState ?? RemoveFromCartLoading(cartId: cartId));
    final result = await cartRepo.removeFromCart(cartId: cartId);
    result.fold((failure) => emit(CartFailure(failure.message)), (_) {
      final removedItem = cartItems.firstWhere((item) => item.id == cartId);
      cartItems.removeWhere((item) => item.id == cartId);
      totalPrice -= removedItem.totalPrice;
      totalItems -= removedItem.quantity;
      emit(RemoveFromCartSuccess());
    });
  }

  Future<void> _updateCartQuantity({
    required CartModel item,
    required int newQuantity,
    required double newTotalPrice,
    required CartState state,
  }) async {
    var data = await cartRepo.updateCartQuantity(
      cartId: item.id,
      quantity: newQuantity,
      totalPrice: newTotalPrice,
    );
    data.fold((l) => emit(CartFailure(l.message)), (r) {
      cartItems = cartItems.map((cartItem) {
        if (cartItem.id == item.id) {
          return cartItem.copyWith(
            quantity: newQuantity,
            totalPrice: newTotalPrice,
          );
        }
        return cartItem;
      }).toList();
      totalPrice += newTotalPrice - item.totalPrice;
      totalItems += newQuantity - item.quantity;
      emit(state);
    });
  }

  void increaseQuantity({required CartModel item}) {
    emit(IncreaseCartQuantityLoading(cartId: item.id));
    _updateCartQuantity(
      item: item,
      newQuantity: item.quantity + 1,
      newTotalPrice: item.totalPrice + (item.totalPrice / item.quantity),
      state: IncreaseCartQuantitySuccess(),
    );
  }

  void decreaseQuantity({required CartModel item}) {
    if (item.quantity > 1) {
      emit(DecreaseCartQuantityLoading(cartId: item.id));
      _updateCartQuantity(
        item: item,
        newQuantity: item.quantity - 1,
        newTotalPrice: item.totalPrice - (item.totalPrice / item.quantity),
        state: DecreaseCartQuantitySuccess(),
      );
    } else {
      removeFromCart(
        cartId: item.id,
        loadingState: DecreaseCartQuantityLoading(cartId: item.id),
      );
    }
  }
}
