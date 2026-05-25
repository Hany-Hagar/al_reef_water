import 'package:flutter/material.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: s.forgotPasswordTitle, size: 22.sp, type: Type.header),
          CustomText(
            text: s.forgotPasswordSubtitle,
            size: 16.sp,
            maxLines: 3,
            type: Type.medium,
            opacity: FontOpacity.medium,
          ),
          SizedBox(height: 20.h),
          const _Input(),
          SizedBox(height: 20.h),
          _Button(formKey: formKey),
        ],
      )
    );
  }
}


class _Input extends StatelessWidget {
  const _Input();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = AuthCubit.get(context);
    return Column(
      children: [
                  CustomText(text: s.emailAddress, size: 16.sp, type: Type.overMedium),
          SizedBox(height: 10.h),
          MTextFormField(
            hintText: s.emailAddressHint,
            prefixIcon: IconBroken.Message,
            controller: cubit.resetEmailController,
            keyboardType: TextInputType.emailAddress,
          ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const _Button({required this.formKey});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return CustomButton(
                onPressed: () => AuthCubit.get(context).resetPassword(formKey: formKey),
                text: S.of(context).forgotButton,
                isLoading: state is ResetPasswordLoadingState,
              );
            },
          );
  }
}