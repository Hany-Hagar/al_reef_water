import 'auth_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/user_model.dart';
import '../database/auth_data.dart';
import '../../../../core/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthData authData;
  AuthRepoImpl({required this.authData});

  @override
  Future<Either<Failure, UserModel>> autoLogin() async {
    try {
      final user = authData.currentUser;
      if (user == null) {
        return Left(Failure.handle('No user logged in'));
      }
      final userDoc = await authData.getUserData(user.uid);
      if (userDoc.exists) {
        final data = userDoc.data();
        if (data is Map<String, dynamic>) {
          return Right(UserModel.fromMap(data));
        }
      }
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await authData.signIn(email, password);
      final user = userCredential.user;
      if (user == null) {
        return Left(Failure.handle('User not found'));
      }
      final userDoc = await authData.getUserData(user.uid);
      if (userDoc.exists) {
        final data = userDoc.data();
        if (data is Map<String, dynamic>) {
          return Right(UserModel.fromMap(data));
        }
      }
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithGoogle() async {
    try {
      final OAuthCredential credential = await authData.signInWithGoogle();
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        return Left(Failure.handle('User not found'));
      }

      final userDoc = await authData.getUserData(firebaseUser.uid);

      if (userDoc.exists) {
        final data = userDoc.data();
        if (data is Map<String, dynamic>) {
          return Right(UserModel.fromMap(data));
        }
        return Right(UserModel.fromFirebaseUser(firebaseUser));
      } else {
        final fullName = firebaseUser.displayName ?? '';
        final nameParts = fullName.trim().split(' ');
        final firstName = nameParts.isNotEmpty ? nameParts.first : '';
        final lastName = nameParts.length > 1
            ? nameParts.sublist(1).join(' ')
            : '';

        final newUser = UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          firstName: firstName,
          lastName: lastName,
          location: [],
          phone: firebaseUser.phoneNumber ?? '',
          favorites: const [],
        );

        // إنشاء وحفظ بيانات المستخدم الجديد في الفايرستور
        await authData.addUserData(uid: firebaseUser.uid, userModel: newUser);
        return Right(newUser);
      }
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp({required UserModel user}) async {
    try {
      final userCredential = await authData.signUp(
        user.email,
        user.password ?? '',
      );
      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        return Left(Failure.handle('User not created'));
      }
      await authData.addUserData(
        uid: firebaseUser.uid,
        userModel: user.copyWith(id: firebaseUser.uid),
      );
      return Right(user.copyWith(id: firebaseUser.uid));
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await authData.resetPassword(email);
      return Right(null);
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await authData.signOut();
      return Right(null);
    } catch (e) {
      return Left(Failure.handle(e.toString()));
    }
  }
}
