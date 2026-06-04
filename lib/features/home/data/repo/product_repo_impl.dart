
import 'product_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/product_model.dart';
import '../database/product_data.dart';
import '../../../../core/failure/failure.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductData productData;
  ProductRepoImpl({required this.productData});

  @override
  Future<
    Either<
      Failure,
      ({
        List<ProductModel> user,
        List<ProductModel> mosque,
        List<ProductModel> company,
      })
    >
  >
  getProducts() async {
    try {
      final List<ProductModel> userProducts = [];
      final List<ProductModel> mosqueProducts = [];
      final List<ProductModel> companyProducts = [];

      final querySnapshot = await productData.fetchProducts();

      for (final doc in querySnapshot.docs) {
        final product = ProductModel.fromFirestore(doc);
        if (product.offerType == OfferType.user) {
          userProducts.add(product);
        } else if (product.offerType == OfferType.mosque) {
          mosqueProducts.add(product);
        } else {
          companyProducts.add(product);
        }
      }

      return Right((
        user: userProducts,
        mosque: mosqueProducts,
        company: companyProducts,
      ));
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }
}
