import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../manager/product_cubit.dart';
import '../../manager/product_states.dart';
import '../widgets/favourite_icon.dart';
import '../widgets/product_body.dart';
import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../../core/widgets/custom_background.dart';

class ProductView extends StatelessWidget {
  final ProductModel product;
  const ProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      top: _Top(images: product.images, productId: product.id),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: ProductBody(product: product),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  final String productId ;
  final List<String> images;
  const _Top({required this.images, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        return Column(
          children: [
            Stack(
              children: [
                _Images(images: images),
                CustomAppBar(
                  title:  "",
                  backgroundColor: Colors.transparent,
                  action: FavouriteIcon(productId: productId),  
                  iconColor: Colors.black,
                ),
              ]
            ),
            SizedBox(height: 12.h),
            _Indicator(banners: images),
          ],
        );
      },
    );
  }
}

class _Images extends StatelessWidget {
  final List<String> images;
  const _Images({required this.images});

  @override
  Widget build(BuildContext context) {
    var cubit = ProductCubit.get(context);
    return CarouselSlider.builder(
      itemCount: images.length,
      carouselController: cubit.carouselController,
      itemBuilder: (context, index, realIndex) =>
          _Item(imageUrl: images[index]),
      options: CarouselOptions(
        padEnds: true,
        autoPlay: false,
        viewportFraction: 1,
        height: MediaQuery.of(context).size.height * 0.4,
        onPageChanged: (index, reason) => cubit.updateCurrentProductImageIndex(index),
      ),
      
    );
  }
}

class _Item extends StatelessWidget {
  final String imageUrl;

  const _Item({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.only(
        bottomStart: Radius.circular(24.r),
        bottomEnd: Radius.circular(24.r),
      ),
      child: ColoredBox(
        color: Colors.white,
        child: Image.network(
          imageUrl,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  final List<String> banners;
  const _Indicator({required this.banners});

  @override
  Widget build(BuildContext context) {
    var cubit = ProductCubit.get(context);
    var theme = Theme.of(context);
    if (banners.isEmpty) {
      return const SizedBox.shrink();
    }
    return AnimatedSmoothIndicator(
      activeIndex: cubit.currentProductImageIndex,
      count: banners.length,
      onDotClicked: (index) {
        cubit.carouselController.animateToPage(index);
        cubit.updateCurrentProductImageIndex(index);
      },
      effect: ExpandingDotsEffect(
        dotHeight: 8.h,
        dotWidth: 8.w,
        expansionFactor: 3,
        activeDotColor: theme.primaryColor,
        dotColor: theme.scaffoldBackgroundColor,
      ),
    );
  }
}
