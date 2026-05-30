import '../widgets/profile_body.dart';
import 'package:flutter/material.dart';
import '../../manager/profile_cubit.dart';
import '../../manager/profile_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/services/snack_bar_service.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return BlocProvider.value(
      value: getIt<ProfileCubit>()..setTextFormFields(),
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileErrorState) {
            SnackBarService.failure(context: context, message: state.message);
          } else if (state is UpdateProfileSuccess) {
            SnackBarService.success(
              context: context,
              message: s.UpdateProfileSuccess,
            );
          }
        },
        child: CustomBackground(
          top: _Top(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ProfileBody(),
            ),
          ),
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(title: S.of(context).profileTitle);
  }
}
