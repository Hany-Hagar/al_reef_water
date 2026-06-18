// ignore_for_file: unused_element_parameter
import 'order_item.dart';
import 'package:flutter/material.dart';
import '../../manager/orders_cubit.dart';
import '../../manager/orders_states.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/nav_to.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_drop_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../locations/presentation/manager/location_cubit.dart';
import '../../../../locations/presentation/manager/location_states.dart';
import '../../../../locations/presentation/pages/views/add_edit_location_view.dart';

class AddOrderBody extends StatelessWidget {
  const AddOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var padding = MediaQuery.of(context).padding;
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: padding.top + 5.h,
        start: 12.w,
        end: 12.w,
      ),
      child: Form(
        key: formKey,
        child: Column(
          spacing: 12.h,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Title(),
            _Divider(title: S.of(context).orderProducts),
            const OrderItem(
              
            ),
            _Divider(title: S.of(context).orderDeliveryInfo),
            _Name(),
            _Phone(),
            _Location(),
            _AddOrder(formKey: formKey),
          ],
        ),
          )
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
        Row(
          children: [
            GestureDetector(
              onTap: () => NavTo.pop(context),
              child: Icon(
                Icons.close,
                size: 25.sp,
                color: Theme.of(context).hintColor,
              ),
            ),
            Spacer(flex: 2),
            CustomText(text: s.orderDetails, size: 24.sp, type: Type.header),
            Spacer(flex: 3),
          ],
        ),
        CustomText(
          text: s.orderDetailsSubtitle,
          size: 14.sp,
          maxLines: 2,
          type: Type.medium,
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  final String title;
  const _Divider({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        CustomText(text: title, size: 15.sp, type: Type.overMedium),
        Expanded(
          child: Divider(height: 1.h, color: Theme.of(context).dividerColor),
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final Widget? bottomWidget;
  final bool? readOnly;
  final IconData? icon;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const _Item({
    required this.title,
    this.trailing,
    this.bottomWidget,
    this.icon,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final field = bottomWidget;
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: title, type: Type.overMedium, size: 15.sp),
            ?trailing,
          ],
        ),
        field ??
            (controller == null
                ? const SizedBox.shrink()
                : MTextFormField(
                    readOnly: readOnly ?? false,
                    hintText: hintText,
                    prefixIcon: icon,
                    controller: controller!,
                    keyboardType: keyboardType,
                    inputStyle: Styles.textStyle400.copyWith(
                      fontSize: 17.sp,
                      color: Theme.of(context).hintColor,
                    ),
                    hintStyle: Styles.textStyle400.copyWith(
                      height: 3,
                      fontSize: 14.sp,
                      color: Theme.of(context).hintColor.withValues(alpha: 0.8),
                    ),
                  )),
      ],
    );
  }
}

class _Name extends StatelessWidget {
  const _Name();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _Item(
            title: S.of(context).firstName,
            icon: Icons.person,
            hintText: S.of(context).firstNameHint,
            controller: OrdersCubit.get(context).firstNameController,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _Item(
            title: S.of(context).lastName,
            icon: Icons.person,
            hintText: S.of(context).lastNameHint,
            controller: OrdersCubit.get(context).lastNameController,
          ),
        ),
      ],
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return _Item(
      title: S.of(context).phoneNumber,
      icon: Icons.phone,
      hintText: S.of(context).phoneNumberHint,
      controller: OrdersCubit.get(context).phoneController,
      keyboardType: TextInputType.phone,
    );
  }
}

class _Location extends StatelessWidget {
  const _Location();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var locations = getIt<LocationCubit>().locations;
    return _Item(
      title: s.deliveryAddress,
      trailing: GestureDetector(
        onTap: () => NavTo.push(
          context: context,
          nextPage: AddEditLocationView(isEdit: false),
        ),
        child: CustomText(
          text: s.addLocationButton,
          size: 14.sp,
          type: Type.medium,
          color: Theme.of(context).primaryColor,
        ),
      ),
      bottomWidget: BlocBuilder<LocationCubit, LocationState>(
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
    );
  }
}

class _AddOrder extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const _AddOrder({required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersStates>(
      builder: (context, state) {
        return CustomButton(
          isLoading: state is AddOrderLoading,
          onPressed: () => OrdersCubit.get(context).addOrder(formKey: formKey),
          text: S.of(context).addOrder,
        );
      },
    );
  }
}
