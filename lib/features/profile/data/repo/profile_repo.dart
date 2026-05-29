import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../../auth/data/models/user_model.dart';


abstract class ProfileRepo {
  // getProfile
  Future<Either<Failure, UserModel>> getProfile(String uid);

  Future<Either<Failure, void>> updateProfile({required UserModel userModel, required String uid});

  Future<Either<Failure, void>> updatePassword(String newPassword);

  Future<Either<Failure, void>> deleteProfile(String uid);
}
