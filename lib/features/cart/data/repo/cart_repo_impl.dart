import 'cart_repo.dart';
import 'package:dartz/dartz.dart';
import '../model/cart_model.dart';
import '../database/cart_data.dart';
import '../../../../core/failure/failure.dart';
import '../../../home/data/models/product_model.dart';

class CartRepoImpl implements CartRepo {
  final CartData cartData;

  CartRepoImpl({ required this.cartData });

  @override
  Future<Either<Failure, List<CartModel>>> getCartItems() async {
    try {
      final cartItems = await cartData.fetchCartProducts();
      return Right(cartItems);
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartModel>> addToCart(ProductModel product) async {
    try {
      final cartItem = await cartData.addToCart(product);
      return Right(cartItem);
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCartQuantity(String cartId, int quantity) async {
    try {
      await cartData.updateCartQuantity(cartId, quantity);
      return const Right(null);
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart(String cartId) async {
    try {
      await cartData.removeFromCart(cartId);
      return const Right(null);
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }
}
