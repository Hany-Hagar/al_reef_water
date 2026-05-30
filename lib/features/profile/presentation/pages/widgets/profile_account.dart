import 'profile_item.dart';
import 'package:flutter/material.dart';
import '../../manager/profile_cubit.dart';
import '../../manager/profile_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/icon_broken.dart';

class ProfileAccount extends StatelessWidget {
  final GlobalKey<FormState> accountFormKey;
  const ProfileAccount({super.key, required this.accountFormKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Form(
          key: accountFormKey,
          autovalidateMode: ProfileCubit.get(context).passwordAutoValidate,
          child: Column(
            spacing: 10,
            children: [
              _Email(),
              _Password(passwordKey: accountFormKey),
              _ConfirmPassword(passwordKey: accountFormKey),
            ],
          ),
        );
      },
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

class _Password extends StatelessWidget {
  final GlobalKey<FormState> passwordKey;
  const _Password({required this.passwordKey});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = ProfileCubit.get(context);
    return ProfileItem(
      title: s.password,
      hint: s.passwordHint,
      obscureText: cubit.passwordObscure,
      prefixIcon: IconBroken.Lock,
      controller: cubit.passwordController,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      suffixIcon: cubit.passwordObscure ? IconBroken.Show : IconBroken.Hide,
      onSuffixPressed: () => cubit.togglePasswordObscure(),
    );
  }
}

class _ConfirmPassword extends StatelessWidget {
  final GlobalKey<FormState> passwordKey;
  const _ConfirmPassword({required this.passwordKey});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = ProfileCubit.get(context);
    return ProfileItem(
      obscureText: cubit.confirmPasswordObscure,
      prefixIcon: IconBroken.Lock,
      title: s.confirmPassword,
      hint: s.confirmPasswordHint,
      passwordController: cubit.passwordController,
      controller: cubit.confirmPasswordController,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      suffixIcon: cubit.confirmPasswordObscure
          ? IconBroken.Show
          : IconBroken.Hide,
      onSuffixPressed: () => cubit.toggleConfirmPasswordObscure(),
    );
  }
}
