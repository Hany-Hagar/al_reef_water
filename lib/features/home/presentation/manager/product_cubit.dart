// ignore_for_file: strict_top_level_inference

import 'package:carousel_slider/carousel_slider.dart';

import 'product_states.dart';
import '../../data/repo/product_repo.dart';
import '../../data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {
  final ProductRepo productRepo;

  ProductCubit({required this.productRepo}) : super(ProductInitialState());
  static ProductCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    final result = await productRepo.getProducts();
    result.fold((failure) => emit(ProductFailure(failure.message)), (products) {
      this.products = products;
      emit(ProductSuccess());
    });
  }

  // Product details
  int currentProductImageIndex = 0;
  CarouselSliderController carouselController = CarouselSliderController();

  void updateCurrentProductImageIndex(int index) {
    currentProductImageIndex = index;
    emit(ChangeProductImageIndexState());
  }
}
