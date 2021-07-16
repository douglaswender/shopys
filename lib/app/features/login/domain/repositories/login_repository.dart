import 'package:dartz/dartz.dart';
import 'package:shopys/app/core/error/failures.dart';
import 'package:shopys/app/features/login/domain/entities/user.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> signIn({required String email, required String password});
}
