import 'package:dartz/dartz.dart';
import '../models/user_model.dart';
import '../../../../core/failure/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> autoLogin();
  Future<Either<Failure, UserModel>> signIn({required String email, required String password});
  Future<Either<Failure, UserModel>> signInWithGoogle();
  Future<Either<Failure, UserModel>> signUp({required UserModel user});
  Future<Either<Failure, void>> resetPassword({required String email});
  Future<Either<Failure, void>> signOut();
}