import 'dart:developer';

import 'package:al_reef_app/core/services/snack_bar_service.dart';
import 'package:flutter/material.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_states.dart';
import '../widgets/forget_password_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_background.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordErrorState) {
          log(state.error);
          SnackBarService.failure(context: context, message: state.error);

        }
        if (state is ResetPasswordSuccessState) {
          SnackBarService.success(context: context, message: "the reset password link has been sent to your email");
          }
      },
      child: CustomBackground(
        top: CustomAppBar(title: "", backgroundColor: Colors.transparent),
        body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: formKey,
          child: ForgetPasswordBody(formKey: formKey)
        )
      ))
    );
  }
}