import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopys/app/features/login/data/datasources/sign_in_local_datasource.dart';
import 'package:shopys/app/features/login/data/models/user_model.dart';

main() {
  test("Test sign in local datasource", () async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final signInLocalDatasource = SignInLocalDataSourceImpl(sharedPreferences: sharedPreferences);

    UserModel user = await signInLocalDatasource.signIn(email: "email", password: "password");

    expect(user.email, "email");
    expect(user.password, "password");
  });
}
