import 'profile_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/data/models/user_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit({required this.profileRepo}) : super(ProfileInitialState());
  // ignore: strict_top_level_inference
  static ProfileCubit get(context) => BlocProvider.of(context);

  late UserModel user;

  var passwordValidationKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  var emailController = TextEditingController();
  bool passwordObscure = true;
  var passwordController = TextEditingController();
  var confirmPasswordObscure = true;
  var confirmPasswordController = TextEditingController();
  var passwordAutoValidate = AutovalidateMode.disabled;

  void setTextFormFields() {
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    phoneController.text = user.phone;
    emailController.text = user.email;
    passwordController.text = "";
    confirmPasswordController.text = "";
  }

  bool havePasswordChanged() {
    return passwordController.text.isNotEmpty ||
        confirmPasswordController.text.isNotEmpty;
  }

  void togglePasswordObscure() {
    passwordObscure = !passwordObscure;
    emit(TogglePasswordObscureState());
  }

  void toggleConfirmPasswordObscure() {
    confirmPasswordObscure = !confirmPasswordObscure;
    emit(TogglePasswordObscureState());
  }

  void saveProfile() async {
    if (havePasswordChanged()) {
      final isPasswordFormValid =
          passwordValidationKey.currentState?.validate() ?? false;
      if (!isPasswordFormValid) {
        return;
      }
    }
    emit(UpdateProfileLoading());
    var result = await profileRepo.updateProfile(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phone: phoneController.text,
      location: locationController.text,
      email: emailController.text,
    );
    result.fold((failure) => emit(ProfileErrorState(failure.message)), (data) {
      user = data;
      emit(UpdateProfileSuccess());
    });
  }

  void deleteProfile() async {
    emit(ProfileDeleteLoading());
    var result = await profileRepo.deleteProfile();
    result.fold(
      (failure) => emit(ProfileErrorState(failure.message)),
      (_) => emit(ProfileDeleteSuccess()),
    );
  }
}
