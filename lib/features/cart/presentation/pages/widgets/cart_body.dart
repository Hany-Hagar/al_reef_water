
import 'cart_item.dart';
import '../../manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import '../../manager/cart_states.dart';
import '../views/order_details_view.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/model/cart_model.dart';
import '../../../../../core/utils/nav_to.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../const_data/app_data.dart';
import '../../../../../const_data/asset_data.dart';
import '../../../../../core/widgets/custom_list.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Title(),
          Expanded(
            child: CustomList(
              isLoading: state is CartLoading,
              isFailure: state is CartFailure,
              emptyAnimation: AssetData.emptyCart,
              items: CartCubit.get(context).cartItems,
              errorMessage: state is CartFailure ? state.message : null,
              emptyItems: List.generate(5, (index) => CartModel.empty()),
              itemBuilder: (context, cart) => GestureDetector(
                onTap: ()=> NavTo.push(context: context, nextPage: OrderDetailsView(order: cart)),
                child: CartItem(isLoading: state is CartLoading, cart: cart),
              ),
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
        text: S.of(context).cartTitle,
        size: 24.sp,
        type: Type.header,
      ),
    );
  }
}
