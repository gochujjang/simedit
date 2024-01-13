import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  final box = GetStorage();
  static String? token;
  login({
    required String username,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "https://medit.kreatifsolusindo.id/api/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "username": username,
          "password": password,
        },
      );
      Map obj = response.data;
      token = obj["access_token"];
      Map data = obj["data"];
      box.write("token", token);
      box.write("data", data);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  // register
  register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "https://medit.kreatifsolusindo.id/api/register",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "name": name,
          "username": username,
          "email": email,
          "password": password,
        },
      );
      Map obj = response.data;
      return true;
    } on Exception catch (err) {
      print(err);
      return false;
    }
  }

  //logout
  logout() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://medit.kreatifsolusindo.id/api/logout",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );

    Map obj = response.data;
    return true;
  }
}
