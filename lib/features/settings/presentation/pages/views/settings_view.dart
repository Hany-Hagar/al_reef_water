import 'package:flutter/material.dart';
import '../../../../../core/utils/nav_to.dart';
import '../widgets/settings_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/top_settings_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_background.dart';
import '../../../../auth/presentation/manager/auth_cubit.dart';
import '../../../../auth/presentation/manager/auth_states.dart';
import '../../../../auth/presentation/pages/views/login_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignOutSuccessState) {
          AuthCubit.get(context).clearUserData();
          NavTo.pushReplacement(context: context, nextPage: const LoginView());
        }
        // Handle state changes if needed
      },
      child: CustomBackground(
        top: const SettingsTopBackground(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SettingsBody(),
          )
        ),
      )
    );
  }
}
