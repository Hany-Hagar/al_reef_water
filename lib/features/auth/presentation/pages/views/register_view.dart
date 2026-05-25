import 'package:flutter/material.dart';
import '../../manager/auth_cubit.dart';
import '../widgets/register_body.dart';
import '../../manager/auth_states.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/nav_to.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_background.dart';
import '../../../../../core/services/snack_bar_service.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpErrorState) {
          SnackBarService.failure(context: context, message: state.error);
        }
        if (state is SignUpSuccessState) {
          AuthCubit.get(context).clearUserData();
          SnackBarService.success(context: context, message: S.of(context).registerSuccess);
          NavTo.pop(context);
        }   
      },
      child: Form(
        key: formKey,
        child: CustomBackground(
          body: RegisterBody()
        ),
      )
    );
  }
}