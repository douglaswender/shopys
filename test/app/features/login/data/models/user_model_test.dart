import 'package:flutter_test/flutter_test.dart';
import 'package:shopys/app/features/login/data/models/user_model.dart';

main() {
  test('Test UserModel - fromJson', () {
    final json = {
      "email": "email",
      "password": "password",
    };
    final user = UserModel.fromJson(json);

    expect(user.email, "email");
    expect(user.password, "password");
  });
  test('Test UserModel - toJson', () {
    UserModel user = UserModel(email: "email", password: "password");

    final json = user.toJson();

    expect(json['email'], "email");
    expect(json['password'], "password");
  });
}
