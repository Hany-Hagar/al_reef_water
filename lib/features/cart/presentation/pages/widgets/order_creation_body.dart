import 'package:flutter/material.dart';
import '../../manager/cart_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/model/cart_model.dart';
import '../../../../../core/utils/nav_to.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_drop_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_delete_icon.dart';
import '../../../../auth/presentation/manager/auth_cubit.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../locations/presentation/manager/location_cubit.dart';
import '../../../../locations/presentation/manager/location_states.dart';
import '../../../../locations/presentation/pages/views/add_edit_location_view.dart';

class OrderCreationBody extends StatelessWidget {
  const OrderCreationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(20.r),
          topEnd: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            _Title(),
            SizedBox(height: 12.h),
            _List(),
            SizedBox(height: 12.h),
            _Phone(),
            SizedBox(height: 12.h),
            _Location(),
            SizedBox(height: 16.h),
            _End(),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      spacing: 8.h,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity),
        CustomText(text: s.orderDetails, size: 16.sp, type: Type.header),
        CustomText(
          text: s.orderDetailsSubtitle,
          size: 14.sp,
          maxLines: 2,
          type: Type.medium,
        ),
      ],
    );
  }
}

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    var carts = CartCubit.get(context).cartItems;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: carts.length,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _Item(cart: carts[index]),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final CartModel cart;
  const _Item({required this.cart});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0.w,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(vertical: -4),
      title: CustomText(
        text: cart.product.title,
        size: 14.sp,
        maxLines: 2,
        type: Type.medium,
      ),
      trailing: CustomDeleteIcon(isLoading: false, onTap: () {}),
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: S.of(context).phoneNumber,
          size: 16.sp,
          type: Type.header,
        ),
        SizedBox(height: 10.h),
        MTextFormField(
          keyboardType: TextInputType.phone,
          hintText: S.of(context).phoneNumberHint,
          controller: TextEditingController(
            text: getIt<AuthCubit>().user?.phone ?? '',
          ),
        ),
      ],
    );
  }
}

class _Location extends StatelessWidget {
  const _Location();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var locations = getIt<LocationCubit>().locations;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(text: s.deliveryAddress, size: 16.sp, type: Type.header),
            Spacer(),
            GestureDetector(
              onTap: () => NavTo.push(
                context: context,
                nextPage: AddEditLocationView(isEdit: false),
              ),
              child: CustomText(
                text: s.addNew,
                size: 14.sp,
                type: Type.overMedium,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            return CustomDropMenu(
              items: locations,
              hintText: s.locationsTitle,
              itemLabel: (item) => item.name,
              value: locations.isNotEmpty ? locations[0] : null,
              onChanged: (value) {},
            );
          },
        ),
      ],
    );
  }
}

class _End extends StatelessWidget {
  const _End();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      children: [
        Divider(height: 1.h),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: s.total, size: 16.sp, type: Type.header),
            CustomText(text: 'EGP 1000', size: 16.sp, type: Type.header),
          ],
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}
