import 'profile_item.dart';
import 'package:flutter/material.dart';
import '../../manager/profile_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/services/icon_broken.dart';
import '../../../../../core/widgets/profile_widget.dart';
import '../../../../../core/services/location_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileData extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const ProfileData({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 10.h,
        children: [
          ProfileWidget(radius: 60.0),
          SizedBox(height: 10.h),
          const _Name(),
          const _Phone(),
          const _Email(),
          //const _Location(),
        ],
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = ProfileCubit.get(context);
    return Column(
      spacing: 10.h,
      children: [
        ProfileItem(
          title: s.firstName,
          hint: s.firstNameHint,
          prefixIcon: IconBroken.User,
          keyboardType: TextInputType.name,
          controller: cubit.firstNameController,
          textInputAction: TextInputAction.next,
        ),

        SizedBox(width: 10.w),
        ProfileItem(
          title: s.lastName,
          hint: s.lastNameHint,
          prefixIcon: IconBroken.User,
          keyboardType: TextInputType.name,
          controller: cubit.lastNameController,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = ProfileCubit.get(context);
    return ProfileItem(
      title: s.phoneNumber,
      hint: s.phoneNumberHint,
      prefixIcon: IconBroken.Call,
      keyboardType: TextInputType.phone,
      controller: cubit.phoneController,
      textInputAction: TextInputAction.next,
    );
  }
}

class _Email extends StatelessWidget {
  const _Email();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = ProfileCubit.get(context);
    return ProfileItem(
      readOnly: true,
      title: s.emailAddress,
      prefixIcon: Icons.email,
      hint: s.emailAddressHint,
      controller: cubit.emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}

class _Location extends StatelessWidget {
  const _Location();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = ProfileCubit.get(context);
    return ProfileItem(
      title: s.address,
      hint: s.addressHint,
      suffixIcon: Icons.map,
      prefixIcon: IconBroken.Location,
      controller: cubit.locationController,
      keyboardType: TextInputType.streetAddress,
      onSuffixPressed: () {
        LocationService.openLocationPicker(
          context: context,
          onLocationPicked: (pickedData) {},
        );
      },
      textInputAction: TextInputAction.done,
    );
  }
}
