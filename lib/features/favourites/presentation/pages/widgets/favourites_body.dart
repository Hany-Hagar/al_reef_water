import '../../manager/fav_cubit.dart';
import '../../manager/fav_states.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../const_data/app_data.dart';
import '../../../../../const_data/asset_data.dart';
import '../../../../../core/widgets/custom_list.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../home/data/models/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../home/presentation/pages/widgets/favourite_icon.dart';

class FavouritesBody extends StatelessWidget {
  const FavouritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Title(),
          Expanded(
            child: CustomList(
              isLoading: state is FavLoading,
              isFailure: state is FavFailure,
              emptyAnimation: AssetData.emptyFav,
              items: FavCubit.get(context).favoriteProducts,
              errorMessage: state is FavFailure ? state.message : null,
              itemBuilder: (context, product) => _Item(product: product),
              emptyItems: List.generate(5, (index) => ProductModel.empty()),
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultAppBarPadding(context),
      child: CustomText(
        text: S.of(context).favouritesTitle,
        size: 24.sp,
        type: Type.header,
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final ProductModel product;
  const _Item({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          _Image(imageUrl: product.images.first, productId: product.id),
          SizedBox(height: 8.h),
          Expanded(child: _ItemBody(product: product)),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final String imageUrl;
  final String productId;
  const _Image({required this.imageUrl, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 110.w,
          child: Container(
            color: Colors.white,
            child: Image.network(
              imageUrl,
              width: 110.w,
              height: 100.h,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 8.h,
          right: 8.w,
          child: FavouriteIcon(productId: productId),
        ),
      ],
    );
  }
}

class _ItemBody extends StatelessWidget {
  final ProductModel product;
  const _ItemBody({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: product.title,
            size: 14.sp,
            maxLines: 4,
            type: Type.overMedium,
          ),
          CustomText(
            text: "${product.price.toStringAsFixed(2)} ر.س",
            size: 12.sp,
            type: Type.overMedium,
          ),
        ],
      ),
    );
  }
}
