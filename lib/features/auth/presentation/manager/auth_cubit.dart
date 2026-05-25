// ignore_for_file: strict_top_level_inference

import 'auth_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/auth_repo.dart';
import '../../data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/server_locator.dart';
import '../../../layout/manager/layout_cubit.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit({required this.authRepo}) : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  UserModel? user;

  // Auto Login
  Future<void> autoLogin() async {
    emit(AutoLoginLoadingState());
    final result = await authRepo.autoLogin();
    result.fold((failure) => emit(AutoLoginFailure(failure.message)), (user) {
      this.user = user;
      emit(AutoLoginSuccessState());
    });
  }

  // Login
  bool loginObscurePassword = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void toggleLoginPasswordVisibility() {
    loginObscurePassword = !loginObscurePassword;
    emit(ChangePasswordVisibilityState());
  }

  Future<void> signIn({required GlobalKey<FormState> formKey}) async {
    if (!formKey.currentState!.validate()) return;
    emit(SignInLoadingState());
    final result = await authRepo.signIn(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((failure) => emit(SignInErrorState(failure.message)), (user) {
      this.user = user;
      emit(SignInSuccessState());
    });
  }

  Future<void> signInWithGoogle() async {
    emit(SignInWithGoogleLoadingState());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SignInWithGoogleErrorState(failure.message)),
      (user) {
        this.user = user;
        emit(SignInWithGoogleSuccessState());
      },
    );
  }

  // Register
  bool registerObscurePassword = true;
  bool registerObscureConfirmPassword = true;
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneController = TextEditingController();
  var registerEmailController = TextEditingController();
  var registerPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  UserModel get _registerUser => UserModel(
    id: '',
    firstName: firstNameController.text,
    lastName: lastNameController.text,
    phone: phoneController.text,
    email: registerEmailController.text,
    password: registerPasswordController.text,
    favorites: [],
  );

  void toggleRegisterPasswordVisibility() {
    registerObscurePassword = !registerObscurePassword;
    emit(ChangePasswordVisibilityState());
  }

  void toggleRegisterConfirmPasswordVisibility() {
    registerObscureConfirmPassword = !registerObscureConfirmPassword;
    emit(ChangeConfirmPasswordVisibilityState());
  }

  Future<void> signUp({required GlobalKey<FormState> formKey}) async {
    if (!formKey.currentState!.validate()) return;
    emit(SignUpLoadingState());
    final result = await authRepo.signUp(user: _registerUser);
    result.fold((failure) => emit(SignUpErrorState(failure.message)), (user) {
      this.user = user;
      emit(SignUpSuccessState());
    });
  }

  // Reset Password
  var resetEmailController = TextEditingController();

  Future<void> resetPassword({required GlobalKey<FormState> formKey}) async {
    if (!formKey.currentState!.validate()) return;
    emit(ResetPasswordLoadingState());
    final result = await authRepo.resetPassword(
      email: resetEmailController.text,
    );
    result.fold(
      (failure) => emit(ResetPasswordErrorState(failure.message)),
      (_) => emit(ResetPasswordSuccessState()),
    );
  }

  // Sign Out
  void clearUserData() {
    user = null;
    emailController.clear();
    passwordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    registerEmailController.clear();
    registerPasswordController.clear();
    confirmPasswordController.clear();
    resetEmailController.clear();
  }

  Future<void> signOut() async {
    emit(SignOutLoadingState());
    Future.delayed(const Duration(seconds: 1));
    final result = await authRepo.signOut();
    result.fold((failure) => emit(SignOutErrorState(failure.message)), (_) {
      getIt<LayoutCubit>().currentIndex = 0;
      emit(SignOutSuccessState());
    });
  }
}
