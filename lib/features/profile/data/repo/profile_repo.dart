import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../../auth/data/models/user_model.dart';

abstract class ProfileRepo {

  Future<Either<Failure, UserModel>> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
  });


  Future<Either<Failure, void>> deleteProfile();
}
