// ignore_for_file: strict_top_level_inference

import 'fav_states.dart';
import '../../data/repo/fav_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/server_locator.dart';
import '../../../home/data/models/product_model.dart';
import '../../../home/presentation/manager/product_cubit.dart';

class FavCubit extends Cubit<FavState> {
  final FavRepo favRepo;

  FavCubit({ required this.favRepo }) : super(FavInitialState());

  static FavCubit get(context) => BlocProvider.of(context);

  List<ProductModel> get products => getIt<ProductCubit>().products;
  List<ProductModel> favoriteProducts = [];

  Future<void> fetchFavoriteProduct() async {
    if(favoriteProducts.isNotEmpty) return;
    emit(FavLoading());
    final result = await favRepo.getFavoriteProductIds();
    result.fold((failure) => emit(FavFailure(failure.message)), (ids) {
      favoriteProducts = products
          .where((product) => ids.contains(product.id))
          .toList();
      emit(FavSuccess());
    });
  }

  bool isFav(String productId) {
    var favs = favoriteProducts.map((product) => product.id).toList();
    return favs.contains(productId);
  }

  void toggleFav(String productId) {
    if (isFav(productId)) {
      favoriteProducts.removeWhere((product) => product.id == productId);
      _removeFromFav(productId);
    } else {
      favoriteProducts.add(
        products.firstWhere((product) => product.id == productId),
      );
      _addToFav(productId);
    }
  }

  Future<void> _addToFav(String productId) async {
    emit(FavLoading());
    final result = await favRepo.addToFav(productId);
    result.fold((failure) {
      emit(FavFailure(failure.message));
      favoriteProducts.removeWhere((product) => product.id == productId);
    }, (_) => emit(FavSuccess()));
  }

  Future<void> _removeFromFav(String productId) async {
    emit(FavLoading());
    final result = await favRepo.removeFromFav(productId);
    result.fold((failure) {
      emit(FavFailure(failure.message));
      favoriteProducts.add(
        products.firstWhere((product) => product.id == productId),
      );
    }, (_) => emit(FavSuccess()));
  }
}
