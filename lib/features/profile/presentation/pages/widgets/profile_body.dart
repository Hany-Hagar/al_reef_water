// ignore_for_file: unused_element_parameter

import 'profile_data.dart';
import 'package:flutter/material.dart';
import '../../manager/profile_cubit.dart';
import '../../manager/profile_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    var dataFormKey = GlobalKey<FormState>();
    return Column(
      spacing: 10.h,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        ProfileData(formKey: dataFormKey),
        //ProfileAccount(accountFormKey: cubit.passwordValidationKey),
        SizedBox(height: 15.h),
        _Actions(),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Row(
          children: [
            Expanded(
              flex: 5,
              child: CustomButton(
                isLoading: state is UpdateProfileLoading,
                text: S.of(context).save,
                onPressed: () => cubit.saveProfile(),
                width: double.infinity,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              flex: 3,
              child: CustomButton(
                isLoading: state is ProfileDeleteLoading,
                text: s.deleteAccount,
                onPressed: () {},
                textSize: 18.sp,
                color: Colors.red,
                width: double.infinity,
                enableBorderColor: true,
              ),
            ),
          ],
        );
      },
    );
  }
}
