import 'auth_form.dart';
import '../../manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import '../../manager/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return AuthForm(
          formKey: formKey,
          isRegister: false,
          isLoading: state is SignInLoadingState,
          emailController: cubit.emailController,
          obscurePassword: cubit.loginObscurePassword,
          passwordController: cubit.passwordController,
          onPressed: () => cubit.signIn(formKey: formKey),
          obscureConfirmPassword: cubit.registerObscureConfirmPassword,
          onPasswordSuffixPressed: () => cubit.toggleLoginPasswordVisibility(),
          onGooglePressed: () => cubit.signInWithGoogle(),
          googleLoading: state is SignInWithGoogleLoadingState,
        );
      },
    );
  }
}
