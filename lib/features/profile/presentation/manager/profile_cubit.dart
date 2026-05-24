import 'profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/data/models/user_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());
  // ignore: strict_top_level_inference
  static ProfileCubit get(context) => BlocProvider.of(context);

  late UserModel profile;

  void updateProfile() {
    emit(ProfileLoadingState());
    // Simulate a delay for updating profile
    Future.delayed(const Duration(seconds: 2), () {
      // Here you would typically make an API call to update the profile
      // For this example, we'll just emit a loaded state with the same profile
      emit(ProfileLoadedState());
    });
  }
}
