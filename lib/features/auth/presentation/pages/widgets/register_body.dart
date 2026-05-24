import 'auth_form.dart';
import '../../manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import '../../manager/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return AuthForm(
          formKey: formKey,
          isLoading: state is SignUpLoadingState,
          isRegister: true,
          firstNameController: cubit.firstNameController,
          lastNameController: cubit.lastNameController,
          phoneNumberController: cubit.phoneController,
          emailController: cubit.registerEmailController,
          obscurePassword: cubit.registerObscurePassword,
          onPressed: () => cubit.signUp(formKey: formKey),
          passwordController: cubit.registerPasswordController,
          confirmPasswordController: cubit.confirmPasswordController,
          obscureConfirmPassword: cubit.registerObscureConfirmPassword,
          onPasswordSuffixPressed: () => cubit.toggleRegisterPasswordVisibility(),
          onConfirmPasswordSuffixPressed: () => cubit.toggleRegisterConfirmPasswordVisibility(),
          onGooglePressed: () => cubit.signInWithGoogle(),
          googleLoading: state is SignInWithGoogleLoadingState,
        );
      },
    );
  }
}
