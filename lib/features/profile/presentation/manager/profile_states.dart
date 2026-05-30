sealed class ProfileState {}

class ProfileInitialState extends ProfileState {}

class TogglePasswordObscureState extends ProfileState {}

class HidePasswordValidationState extends ProfileState {}

class UpdateProfileLoading extends ProfileState {}

class UpdateProfileSuccess extends ProfileState {}

class ProfileDeleteLoading extends ProfileState {}

class ProfileDeleteSuccess extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String message;

  ProfileErrorState(this.message);
}