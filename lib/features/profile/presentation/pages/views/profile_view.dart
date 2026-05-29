
import '../widgets/profile_body.dart';
import 'package:flutter/material.dart';
import '../../manager/profile_cubit.dart';
import '../../../../../core/utils/nav_to.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../const_data/app_data.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_background.dart';
import '../../../../auth/presentation/manager/auth_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var user = AuthCubit.get(context).user;
    return BlocProvider.value(
      value: getIt<ProfileCubit>()..setTextFormFields(user: user!),
      child: CustomBackground(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: defaultAppBarPadding(context),
                child: ProfileBody(),
              ),
            ),
            _Top(),
          ],
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultAppBarPadding(context),
      child: GestureDetector(
        onTap: () => NavTo.pop(context),
        child: Icon(
          IconBroken.Arrow___Right,
          size: 25.sp,
          color: Theme.of(context).hintColor,
        ),
      ),
    );
  }
}
