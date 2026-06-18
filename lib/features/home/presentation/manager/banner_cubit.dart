// ignore_for_file: strict_top_level_inference

import 'banner_states.dart';
import '../../data/repo/banner_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerCubit extends Cubit<BannerStates> {
  final BannerRepo bannerRepo;

  BannerCubit({required this.bannerRepo}) : super(BannerInitial());

  static BannerCubit get(context) => BlocProvider.of(context);

  List<String> banners = [];

  Future<void> fetchBanners() async {
    if (banners.isNotEmpty) return;
    emit(BannerLoading());
    final result = await bannerRepo.getBanners();
    result.fold((failure) => emit(BannerFailure(failure.message)), (banners) {
      this.banners = banners;
      emit(BannerSuccess());
    });
  }

  int currentBannerIndex = 0;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  void updateCurrentBannerIndex(int index) {
    currentBannerIndex = index;
    emit(BannerIndexUpdated());
  }
}
