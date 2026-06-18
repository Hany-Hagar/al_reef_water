import 'package:dartz/dartz.dart';
import '../model/cart_model.dart';
import '../../../../core/failure/failure.dart';
import '../../../home/data/models/product_model.dart';

abstract class CartRepo {
  Future<Either<Failure, ({List<CartModel> items, double total , int totalItems})>> getCartItems();
  Future<Either<Failure, CartModel>> addToCart({required ProductModel product});
  Future<Either<Failure, void>> updateCartQuantity({required String cartId, required int quantity, required double totalPrice});
  Future<Either<Failure, void>> removeFromCart({required String cartId});

}