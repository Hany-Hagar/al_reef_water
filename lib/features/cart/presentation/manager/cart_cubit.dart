import '../../../home/data/models/product_model.dart';
import 'cart_states.dart';
import '../../data/repo/cart_repo.dart';
import '../../data/model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit({required this.cartRepo}) : super(CartInitial());

  // ignore: strict_top_level_inference
  static CartCubit get(context) => BlocProvider.of(context);

  List<CartModel> cartItems = [];

  void fetchCartItems() async {
    emit(CartLoading());
    final result = await cartRepo.getCartItems();
    result.fold((failure) => emit(CartFailure(failure.message)), (items) {
      cartItems = items;
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
      emit(AddToCartSuccess());
    });
  }

  void removeFromCart(String cartId) async {
    emit(RemoveFromCartLoading(cartId: cartId));
    final result = await cartRepo.removeFromCart(cartId);
    result.fold((failure) => emit(CartFailure(failure.message)), (_) {
      cartItems.removeWhere((item) => item.id == cartId);
      emit(RemoveFromCartSuccess());
    });
  }

  void increaseCartQuantity(String cartId) async {
    final item = cartItems.firstWhere((item) => item.id == cartId);
    final newQuantity = item.quantity + 1;
    emit(IncreaseCartQuantityLoading(cartId: cartId));
    _updateCartQuantity(cartId, newQuantity, IncreaseCartQuantitySuccess());
  }

  void decreaseCartQuantity(String cartId) async {
    final item = cartItems.firstWhere((item) => item.id == cartId);
    if (item.quantity > 1) {
      final newQuantity = item.quantity - 1;
      emit(DecreaseCartQuantityLoading(cartId: cartId));
      _updateCartQuantity(cartId, newQuantity, DecreaseCartQuantitySuccess());
    } else {
      removeFromCart("cartId");
    }
  }

  void _updateCartQuantity(String cartId, int quantity, CartState state) async {
    final result = await cartRepo.updateCartQuantity(cartId, quantity);
    result.fold((failure) => emit(CartFailure(failure.message)), (_) {
      final index = cartItems.indexWhere((item) => item.id == cartId);
      if (index != -1) {
        final updatedItem = cartItems[index].copyWith(quantity: quantity);
        cartItems[index] = updatedItem;
        emit(state);
      }
    });
  }
}
