import 'cart_repo.dart';
import 'package:dartz/dartz.dart';
import '../model/cart_model.dart';
import '../database/cart_data.dart';
import '../../../../core/failure/failure.dart';
import '../../../home/data/models/product_model.dart';

class CartRepoImpl implements CartRepo {
  final CartData cartData;

  CartRepoImpl({required this.cartData});

  @override
  Future<Either<Failure, ({List<CartModel> items, double total , int totalItems})>>
  getCartItems() async {
    try {
      final data = await cartData.fetchCartProducts();
      var total = 0.0;
      var totalItems = 0;
      final cartItems = data.docs.map((doc) {
        final item = CartModel.fromFirestore(
          doc.data() as Map<String, dynamic>,
        ).copyWith(id: doc.id);
        total += item.totalPrice * item.quantity;
        totalItems += item.quantity;
        return item;
      }).toList();
      return Right((items: cartItems, total: total, totalItems: totalItems));
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
  Future<Either<Failure, void>> updateCartQuantity(
    String cartId,
    int quantity,
    double totalPrice,
  ) async {
    try {
      await cartData.updateCartQuantity(cartId, quantity, totalPrice);
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
