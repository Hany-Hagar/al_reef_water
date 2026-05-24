
import 'splash_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/server_locator.dart';
import '../../auth/presentation/manager/auth_cubit.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> autoSignIn() async {
    await Future.delayed(const Duration(seconds: 2));
    await getIt<AuthCubit>().autoLogin();
  }
}