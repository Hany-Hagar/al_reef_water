import 'package:flutter/material.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/services/snack_bar_service.dart';
import '../../../../../generated/l10n.dart';
import '../../../../cart/presentation/manager/cart_cubit.dart';
import '../../manager/orders_states.dart';
import '../widgets/add_order_body.dart';
import '../../manager/orders_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cart/data/model/cart_model.dart';
import '../../../../../core/widgets/custom_background.dart';
import '../../../../auth/presentation/manager/auth_cubit.dart';
import '../../../../locations/presentation/manager/location_cubit.dart';

class AddOrderView extends StatelessWidget {
  final double totalPrice;
  final List<CartModel> cartItems;
  const AddOrderView({
    super.key,
    required this.totalPrice,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<OrdersCubit>()
        ..initializeOrderFromCart(
          cartItems: cartItems,
          totalPrice: totalPrice,
          user: getIt<AuthCubit>().user!,
          selectedLocation: getIt<LocationCubit>().locations.isNotEmpty
              ? getIt<LocationCubit>().locations.first
              : null,
        ),
      child: BlocListener<OrdersCubit, OrdersStates>(
        listener: (context, state) {
          if (state is AddOrderSuccess) {
            getIt<CartCubit>().fetchCartItems();
            Navigator.pop(context);
            SnackBarService.success(
              context: context,
              message: S.of(context).addOrderSuccess,
            );
          }
          if (state is OrdersFailure) {
            SnackBarService.failure(
              context: context,
              message: state.message,
            );
          }
        },
        child: CustomBackground(
          body: const SingleChildScrollView(child: AddOrderBody()),
        ),
      ),
    );
  }
}
