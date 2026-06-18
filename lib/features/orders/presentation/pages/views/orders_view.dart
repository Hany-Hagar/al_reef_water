import '../../../../../core/services/snack_bar_service.dart';
import '../../../../../core/utils/nav_to.dart';
import '../widgets/orders_body.dart';
import 'package:flutter/material.dart';
import '../../manager/orders_cubit.dart';
import '../../manager/orders_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_background.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return BlocProvider.value(
      value: getIt<OrdersCubit>()..fetchOrders(),
      child: BlocListener<OrdersCubit, OrdersStates>(
        listener: (context, state) {
          if (state is CancelOrderSuccess) {
            NavTo.pop(context);
            SnackBarService.success(
              context: context,
              message: s.deleteOrderSuccess,
            );
          } else if (state is CancelOrderFailure) {
            NavTo.pop(context);
            SnackBarService.failure(context: context, message: state.message);
          }
        },
        child: CustomBackground(top: const _Top(), body: const OrdersBody()),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(title: S.of(context).ordersTitle);
  }
}
