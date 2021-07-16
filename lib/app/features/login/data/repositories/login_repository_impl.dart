import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:shopys/app/core/error/exceptions.dart';

import 'package:shopys/app/core/error/failures.dart';
import 'package:shopys/app/core/network/network_info.dart';
import 'package:shopys/app/features/login/data/datasources/sign_in_local_datasource.dart';
import 'package:shopys/app/features/login/domain/entities/user.dart';
import 'package:shopys/app/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final NetworkInfo networkInfo;
  final SignInLocalDataSource dataSource;

  LoginRepositoryImpl({
    required this.networkInfo,
    required this.dataSource,
  });

  @override
  Future<Either<Failure, User>> signIn({required String email, required String password}) async {
    if (await networkInfo.isConnected != ConnectivityResult.none) {
      try {
        final user = await dataSource.signIn(email: email, password: password);
        dataSource.setCacheLoggedUser(user);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final user = await dataSource.getCacheLoggedUser();
        return Right(user);
      } on CacheException {
        return left(CacheFailure());
      }
    }
  }
}
