import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';
import 'order_item.dart';
import 'package:flutter/material.dart';
import '../../manager/orders_cubit.dart';
import '../../manager/orders_states.dart';
import '../../../data/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_list.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit,OrdersStates>(
      builder: (context, state) {
        var cubit = OrdersCubit.get(context);
        return CustomList(
          items: cubit.orders,
          isLoading: state is OrdersLoading,
          isFailure: state is OrdersFailure,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
          emptyItems: List.generate(5, (index) => OrderModel.empty()),
          emptyAnimation: "assets/lotties/emptyCart.json",
          emptyMessage: S.of(context).noOrdersYet,
          failureMessage: state is OrdersFailure ? state.message : null,
          itemBuilder: (context, order) => OrderItem(order: order),
        );
      }
    );
  }
}
