import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/l10n.dart';
import 'cart_item.dart';
import '../../manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import '../../manager/cart_states.dart';
import '../../../data/model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../const_data/asset_data.dart';
import '../../../../../core/widgets/custom_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomList(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsetsDirectional.only(
              top: 10.h,
              bottom: 5.h,
              start: 12.w,
              end: 12.w,
            ),
            isLoading: state is CartLoading,
            isFailure: state is CartFailure,
            emptyAnimation: AssetData.emptyCart,
            items: CartCubit.get(context).cartItems,
            animationTopPadding: screenHeight * 0.26,
            emptyMessage: S.of(context).noProductsInCart,
            emptyItems: List.generate(5, (index) => CartModel.empty()),
            failureMessage: (state is CartFailure) ? state.message : null,
            itemBuilder: (context, cart) =>
                CartItem(isLoading: state is CartLoading, cart: cart),
          ),
          if (CartCubit.get(context).totalItems > 0) _OrderSummary(),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}

class _OrderSummary extends StatelessWidget {
  const _OrderSummary();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Column(
        spacing: 5.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_SummaryTitle(), _SummaryBody()],
      ),
    );
  }
}

class _SummaryTitle extends StatelessWidget {
  const _SummaryTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: S.of(context).orderSummary,
          size: 16.sp,
          type: Type.overMedium,
        ),
        Divider(),
      ],
    );
  }
}

class _SummaryBody extends StatelessWidget {
  const _SummaryBody();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cartCubit = CartCubit.get(context);
    return Column(
      spacing: 8.h,
      children: [
        _SummaryBodyItem(
          title: s.productsTotal,
          value: cartCubit.totalItems.toString(),
        ),
        _SummaryBodyItem(
          title: s.productsPrice,
          value: cartCubit.totalPrice.toStringAsFixed(2),
          value2: " ${s.riyal}",
        ),
      ],
    );
  }
}

class _SummaryBodyItem extends StatelessWidget {
  final String title;
  final String value;
  final String value2;
  const _SummaryBodyItem({
    required this.title,
    required this.value,
    this.value2 = '',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: title, size: 16.sp, type: Type.header),
        Spacer(),
        CustomText(text: value, size: 16.sp, type: Type.header),
        if (value2.isNotEmpty)
          CustomText(text: value2, size: 16.sp, type: Type.header),
      ],
    );
  }
}
