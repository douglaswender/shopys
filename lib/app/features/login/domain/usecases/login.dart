import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:shopys/app/core/error/failures.dart';
import 'package:shopys/app/core/usecase/usecase.dart';
import 'package:shopys/app/features/login/domain/entities/user.dart';
import 'package:shopys/app/features/login/domain/repositories/login_repository.dart';

class Login implements UseCase<User, Params> {
  final LoginRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.signIn(email: params.email, password: params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
