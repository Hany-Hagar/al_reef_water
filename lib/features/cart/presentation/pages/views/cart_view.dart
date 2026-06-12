import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../widgets/cart_body.dart';
import 'package:flutter/material.dart';
import '../../manager/cart_cubit.dart';
import '../../manager/cart_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/services/snack_bar_service.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CartCubit>()..fetchCartItems(),
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartFailure) {
            SnackBarService.failure(context: context, message: state.message);
          }
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  centerTitle: true,
                  title: S.of(context).cartTitle,
                  leadingWidget: SizedBox.shrink(),
                ),
                Expanded(child: SingleChildScrollView(child: CartBody())),
              ],
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return state is CartLoading ||
                        CartCubit.get(context).cartItems.isEmpty
                    ? SizedBox.shrink()
                    : _AddOrder();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AddOrder extends StatelessWidget {
  const _AddOrder();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = CartCubit.get(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5.h),
          Row(
            children: [
              CustomText(text: s.total, size: 16.sp, type: Type.header),
              Spacer(),
              CustomText(
                text: "${cubit.totalPrice.toStringAsFixed(2)} ${s.riyal}",
                size: 16.sp,
                type: Type.header,
              ),
            ],
          ),
          SizedBox(height: 18.h),
          CustomButton(
            height: 45.h,
            text: s.completeOrder,
            textSize: 18.sp,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
