import '../../../home/data/models/product_model.dart';
import 'cart_states.dart';
import '../../data/repo/cart_repo.dart';
import '../../data/model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit({ required this.cartRepo }) : super(CartInitial());

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

  void addToCart(ProductModel product) async {
    emit(AddToCartLoading());
    final result = await cartRepo.addToCart(product);
    result.fold((failure) => emit(CartFailure(failure.message)), (cartItem) {
      cartItems.add(cartItem);
      emit(AddToCartSuccess());
    });
  }

  void removeFromCart(String cartId) async {
    emit(RemoveFromCartLoading());
    final result = await cartRepo.removeFromCart(cartId);
    result.fold((failure) => emit(CartFailure(failure.message)), (_) {
      cartItems.removeWhere((item) => item.id == cartId);
      emit(RemoveFromCartSuccess());
    });
  }
}