sealed class AuthState {}

class AuthInitialState extends AuthState {}

class ProfileUpdatedState extends AuthState {}

class ChangePasswordVisibilityState extends AuthState {}

class ChangeConfirmPasswordVisibilityState extends AuthState {}

// Auto Login
class AutoLoginLoadingState extends AuthState {}

class AutoLoginSuccessState extends AuthState {}

class AutoLoginFailure extends AuthState {
  final String error;
  AutoLoginFailure(this.error);
}

// SignIn
class SignInLoadingState extends AuthState {}

class SignInSuccessState extends AuthState {}

class SignInErrorState extends AuthState {
  final String error;
  SignInErrorState(this.error);
}

// SignIn with Google
class SignInWithGoogleLoadingState extends AuthState {}

class SignInWithGoogleSuccessState extends AuthState {}

class SignInWithGoogleErrorState extends AuthState {
  final String error;
  SignInWithGoogleErrorState(this.error);
}

// SignUp
class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpErrorState extends AuthState {
  final String error;
  SignUpErrorState(this.error);
}

// Reset Password
class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordErrorState extends AuthState {
  final String error;
  ResetPasswordErrorState(this.error);
}

// SignOut
class SignOutLoadingState extends AuthState {}

class SignOutSuccessState extends AuthState {}

class SignOutErrorState extends AuthState {
  final String error;
  SignOutErrorState(this.error);
}
