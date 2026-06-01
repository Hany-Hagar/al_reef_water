import 'package:dartz/dartz.dart';
import '../model/cart_model.dart';
import '../../../../core/failure/failure.dart';
import '../../../home/data/models/product_model.dart';

abstract class CartRepo {
  Future<Either<Failure, List<CartModel>>> getCartItems();
  Future<Either<Failure, CartModel>> addToCart(ProductModel product);
  Future<Either<Failure, void>> updateCartQuantity(String cartId, int quantity, double totalPrice);
  Future<Either<Failure, void>> removeFromCart(String cartId);
}