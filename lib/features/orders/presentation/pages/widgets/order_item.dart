import 'overlapping_images.dart';
import 'package:flutter/material.dart';
import '../../manager/orders_cubit.dart';
import '../../manager/orders_states.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../const_data/asset_data.dart';
import '../../../../cart/data/model/cart_model.dart';
import '../../../../../core/widgets/custom_list.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/dialog_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/extensions/order_status_extension.dart';

class OrderItem extends StatelessWidget {
  final OrderModel? order;
  const OrderItem({super.key, this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
          ),
          builder: (context) => _BottomSheet(order),
        );
      },
      child: _Item(order),
    );
  }
}

class _Item extends StatelessWidget {
  final OrderModel? order;
  const _Item(this.order);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      minTileHeight: 50.h,
      leading: _Leading(),
      horizontalTitleGap: 10.w,
      tileColor: Theme.of(context).cardColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      title: _Title(
        totalPrice: order?.totalPrice ?? OrdersCubit.get(context).totalPrice,
      ),
      subtitle: _SubTitle(
        orderStatus: order?.status,
        cartItems: order?.cartItems ?? OrdersCubit.get(context).cartItems,
      ),
      trailing: order != null && order!.status == OrderStatus.pending
          ? _Trailing(order: order!)
          : null,
    );
  }
}

class _Leading extends StatelessWidget {
  const _Leading();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(2.r),
        image: const DecorationImage(
          image: AssetImage(AssetData.logo),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final double totalPrice;
  const _Title({required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Row(
      spacing: 5.w,
      children: [
        CustomText(text: s.total, size: 16.sp, type: Type.header),
        Spacer(),
        CustomText(
          text: totalPrice.toStringAsFixed(2),
          size: 16.sp,
          type: Type.header,
        ),
        CustomText(text: s.riyal, size: 14.sp, type: Type.medium),
      ],
    );
  }
}

class _SubTitle extends StatelessWidget {
  final OrderStatus? orderStatus;
  final List<CartModel> cartItems;
  const _SubTitle({this.orderStatus, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OverlappingImages(
          images: cartItems.map((e) => e.product.images.first).toList(),
        ),
        Spacer(),
        if (orderStatus != null) _Status(orderStatus: orderStatus!),
      ],
    );
  }
}

class _Trailing extends StatelessWidget {
  final OrderModel order;
  const _Trailing({required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersStates>(
      builder: (context, state) {
        var cubit = OrdersCubit.get(context);
        return GestureDetector(
          onTap: () => DialogServices.showDeleteDialog(
            context: context,
            title: S.of(context).deleteOrder,
            description: S.of(context).areYouSureYouWantToDeleteThisOrder,
            onConfirm: () => cubit.cancelOrder(order.id),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delete, size: 24.sp, color: Colors.red),
              SizedBox(height: 4.h),
            ],
          ),
        );
      },
    );
  }
}

class _Status extends StatelessWidget {
  final OrderStatus orderStatus;
  const _Status({required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: orderStatus.value(context).backgroundColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      padding: EdgeInsetsDirectional.only(bottom: 4.h, start: 6.w, end: 6.w),
      child: CustomText(
        text: orderStatus.value(context).name,
        size: 14.sp,
        type: Type.overMedium,
        color: orderStatus.value(context).textColor,
      ),
    );
  }


}

class _BottomSheet extends StatelessWidget {
  final OrderModel? order;
  const _BottomSheet(this.order);

  @override
  Widget build(BuildContext context) {
    return CustomList(
      isLoading: false,
      isFailure: false,
      shrinkWrap: true,
      items: order?.cartItems ?? OrdersCubit.get(context).cartItems,
      itemBuilder: (context, item) => _BottomSheetItem(item: item),
    );
  }
}

class _BottomSheetItem extends StatelessWidget {
  final CartModel item;

  const _BottomSheetItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            spacing: 10.w,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomText(
                  text: item.product.title,
                  size: 16.sp,
                  maxLines: 3,
                  type: Type.overMedium,
                ),
              ),
              CustomText(
                text: (item.quantity * item.product.price).toStringAsFixed(2),
                size: 16.sp,
                type: Type.header,
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(-14.w, -12.h),
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: _ItemCount(count: item.quantity),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemCount extends StatelessWidget {
  final int count;
  const _ItemCount({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.h,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: 4.h, end: 2.w),
          child: CustomText(
            text: count.toString(),
            size: 18.sp,
            type: Type.header,
          ),
        ),
      ),
    );
  }
}
