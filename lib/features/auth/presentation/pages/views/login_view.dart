import '../widgets/login_body.dart';
import 'package:flutter/material.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_states.dart';
import '../../../../../core/utils/nav_to.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../layout/pages/views/layout_view.dart';
import '../../../../../core/widgets/custom_background.dart';
import '../../../../../core/services/snack_bar_service.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInErrorState) {
          SnackBarService.failure(context: context, message: state.error);
        }
        if (state is SignInWithGoogleErrorState) {
          SnackBarService.failure(context: context, message: state.error);
        }
        if (state is SignInSuccessState ||
            state is SignInWithGoogleSuccessState) {
          NavTo.pushReplacement(context: context, nextPage: const LayoutView());
        }
      },
      child: CustomBackground(body: LoginBody())
    );
  }
}
