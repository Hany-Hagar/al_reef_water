import 'profile_repo.dart';
import 'package:dartz/dartz.dart';
import '../database/profile_data.dart';
import '../../../../core/failure/failure.dart';
import '../../../auth/data/models/user_model.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileData profileData;

  ProfileRepoImpl({required this.profileData});

  @override
  Future<Either<Failure, UserModel>> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String location,
    required String email,
    required bool isPasswordChanged,
    required String? password,
    required String? confirmPassword,
  }) async {
    try {
      var data = await profileData.updateProfile(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        location: location,
        email: email,
      );
      if (isPasswordChanged) {
        await profileData.updatePassword(password!);
      }
      return Right(UserModel.fromMap(data.data() as Map<String, dynamic>));
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProfile() async {
    try {
      return Right(await profileData.deleteProfile());
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }
}
