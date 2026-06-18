// ignore_for_file: strict_top_level_inference
import 'product_states.dart';
import '../../data/repo/product_repo.dart';
import '../../data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/server_locator.dart';
import '../../../favourites/presentation/manager/fav_cubit.dart';

class ProductCubit extends Cubit<ProductStates> {
  final ProductRepo productRepo;

  ProductCubit({required this.productRepo}) : super(ProductInitialState());
  static ProductCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];
  List<ProductModel> userProducts = [];
  List<ProductModel> mosqueProducts = [];
  List<ProductModel> companyProducts = [];

  Future<void> fetchProducts() async {
    if(products.isNotEmpty) return;
    emit(ProductLoading());
    final result = await productRepo.getProducts();
    result.fold((failure) => emit(ProductFailure(failure.message)), (products) {
      userProducts = products.user;
      mosqueProducts = products.mosque;
      companyProducts = products.company;
      this.products = [...userProducts, ...mosqueProducts, ...companyProducts];
      getIt<FavCubit>().fetchFavoriteProduct();
      emit(ProductSuccess());
    });
  }
}
