import 'package:flutter/material.dart';
import '../../manager/banner_cubit.dart';
import '../../manager/banner_states.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../data/models/banner_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanners extends StatelessWidget {
  const HomeBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<BannerCubit>()..fetchBanners(),
      child: BlocBuilder<BannerCubit, BannerStates>(
        builder: (context, state) {
          final cubit = BannerCubit.get(context);
          final banners = cubit.banners;

          if (banners.isEmpty) {
            return const SizedBox.shrink();
          }

          return Column(
            children: [
              Skeletonizer(
                ignoreContainers: true,
                enabled: state is BannerLoading,
                child: state is BannerLoading
                    ? _Item(banner: BannerModel.empty())
                    : _Banners(banners: banners),
              ),
              SizedBox(height: 14.h),
              if (state is! BannerLoading) _Indicator(banners: banners),
            ],
          );
        },
      ),
    );
  }
}

class _Banners extends StatelessWidget {
  final List<BannerModel> banners;
  const _Banners({required this.banners});

  @override
  Widget build(BuildContext context) {
    var cubit = BannerCubit.get(context);
    return CarouselSlider.builder(
      itemCount: banners.length,
      carouselController: cubit.carouselController,
      itemBuilder: (context, index, realIndex) {
        return _Item(banner: banners[index]);
      },
      options: CarouselOptions(
        height: 160.h,
        autoPlay: false,
        viewportFraction: 0.92,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          cubit.updateCurrentBannerIndex(index);
        },
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  final List<BannerModel> banners;
  const _Indicator({required this.banners});

  @override
  Widget build(BuildContext context) {
    var cubit = BannerCubit.get(context);
    var theme = Theme.of(context);
    if (banners.isEmpty) {
      return const SizedBox.shrink();
    }
    return AnimatedSmoothIndicator(
      activeIndex: cubit.currentBannerIndex,
      count: banners.length,
      onDotClicked: (index) {
        cubit.carouselController.animateToPage(index);
        cubit.updateCurrentBannerIndex(index);
      },
      effect: ExpandingDotsEffect(
        dotHeight: 10.h,
        dotWidth: 8.w,
        expansionFactor: 3,
        activeDotColor: theme.primaryColor,
        dotColor: theme.scaffoldBackgroundColor,
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final BannerModel banner;

  const _Item({required this.banner});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.grey,
      ),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: banner.imageUrl,
        errorWidget: (context, url, error) => Icon(
          Icons.broken_image_outlined,
          size: 60,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}
