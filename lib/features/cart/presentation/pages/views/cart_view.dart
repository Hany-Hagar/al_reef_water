import '../widgets/cart_body.dart';
import 'package:flutter/material.dart';
import '../../manager/cart_cubit.dart';
import '../../manager/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
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
        child: CartBody(),
      ),
    );
  }
}
