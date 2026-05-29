import 'dart:developer';

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

  late UserModel profile;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  void setTextFormFields({required UserModel user}) {
    log("User:${user.toMap().toString()}");
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    phoneController.text = user.phone;
    locationController.text = user.location;
    emailController.text = user.email;
  }

  void updateProfile({
    required UserModel userModel,
    required String uid,
  }) async {
    emit(ProfileLoadingState());
    var result = await profileRepo.updateProfile(
      userModel: userModel,
      uid: uid,
    );
    result.fold(
      (failure) => emit(ProfileErrorState(failure.message)),
      (_) => emit(ProfileUpdatedState()),
    );
  }

  void deleteProfile(String uid) async {
    emit(ProfileLoadingState());
    var result = await profileRepo.deleteProfile(uid);
    result.fold(
      (failure) => emit(ProfileErrorState(failure.message)),
      (_) => emit(ProfileDeletedState()),
    );
  }

  void updatePassword(String newPassword) async {
    emit(ProfileLoadingState());
    var result = await profileRepo.updatePassword(newPassword);
    result.fold(
      (failure) => emit(ProfileErrorState(failure.message)),
      (_) => emit(ProfilePasswordUpdatedState()),
    );
  }
}
