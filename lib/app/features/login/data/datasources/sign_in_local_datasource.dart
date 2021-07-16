import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopys/app/core/error/exceptions.dart';

import 'package:shopys/app/features/login/data/models/user_model.dart';

abstract class SignInLocalDataSource {
  Future<UserModel> signIn({required String email, required String password});

  Future<void> setCacheLoggedUser(UserModel user);

  Future<UserModel> getCacheLoggedUser();
}

const CACHED_USER = 'CACHED_USER';

class SignInLocalDataSourceImpl implements SignInLocalDataSource {
  final SharedPreferences sharedPreferences;

  SignInLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<UserModel> getCacheLoggedUser() {
    final jsonString = sharedPreferences.getString(CACHED_USER);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<UserModel> signIn({required String email, required String password}) async {
    return UserModel(email: email, password: password, name: "Ok, você está logado!");
  }

  @override
  Future<void> setCacheLoggedUser(UserModel user) {
    return sharedPreferences.setString(
      CACHED_USER,
      json.encode(user.toJson()),
    );
  }
}
