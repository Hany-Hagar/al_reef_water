import 'package:flutter/material.dart';

import 'profile_states.dart';
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
  
  


  void getProfile(String uid) async {
    emit(ProfileLoadingState());
    var result = await profileRepo.getProfile(uid);
    result.fold((failure) => emit(ProfileErrorState(failure.message)), (data) {
      profile = data;
      emit(ProfileLoadedState());
    });
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
