import 'profile_repo.dart';
import 'package:dartz/dartz.dart';
import '../database/profile_data.dart';
import '../../../../core/failure/failure.dart';
import '../../../auth/data/models/user_model.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileData profileData;

  ProfileRepoImpl({required this.profileData});

  @override
  Future<Either<Failure, UserModel>> getProfile(String uid) async {
    try {
      var result = await profileData.getProfile(uid);

      if (result.exists) {
        final data = result.data();
        if (data is Map<String, dynamic>) {
          return Right(UserModel.fromMap(data));
        }
      }
      return Right(UserModel.fromMap({}));
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile({
    required UserModel userModel,
    required String uid,
  }) async {
    try {
      return Right(
        await profileData.updateProfile(data: userModel.toMap(), uid: uid),
      );
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword(String newPassword) async {
    try {
      return Right(await profileData.updatePassword(newPassword));
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProfile(String uid) async {
    try {
      return Right(await profileData.deleteProfile(uid));
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }
}
