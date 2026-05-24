// ignore_for_file: use_build_context_synchronously

import '../widgets/splash_body.dart';
import 'package:flutter/material.dart';
import '../../manager/splash_cubit.dart';
import '../../../../core/utils/nav_to.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/pages/views/layout_view.dart';
import '../../../auth/presentation/manager/auth_cubit.dart';
import '../../../auth/presentation/manager/auth_states.dart';
import '../../../auth/presentation/pages/views/login_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => SplashCubit()..autoSignIn(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AutoLoginFailure) {
            NavTo.pushReplacement(
              context: context,
              nextPage: const LoginView(),
            );
          } else if (state is AutoLoginSuccessState) {
            NavTo.pushReplacement(
              context: context,
              nextPage: const LayoutView(),
            );
          }
        },
        child: Scaffold(body: SplashBody()),
      ),
    );
  }
}
