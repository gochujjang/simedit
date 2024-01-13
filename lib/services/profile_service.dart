import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ProfileService {
  final box = GetStorage();

  Future<Map> get() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://medit.kreatifsolusindo.id/api/user",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    Map obj = response.data;
    return obj;
  }

  update({
    required String name,
    required String email,
    required String username,
  }) async {
    try {
      String? token = box.read("token");

      var response = await Dio().post(
        "https://medit.kreatifsolusindo.id/api/update-profile",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "name": name,
          "email": email,
          "username": username,
        },
      );
      Map obj = response.data;
    } on Exception catch (err) {
      print(err);
    }
  }

  resetpass({
    required String password,
    required String password_confirmation,
    required String current_password,
  }) async {
    try {
      String? token = box.read("token");
      var response = await Dio().post(
        "https://medit.kreatifsolusindo.id/api/reset-password",
        options: Options(
          headers: {
            "Accept": "*/*",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "password": password,
          "password_confirmation": password_confirmation,
          "current_password": current_password,
        },
      );
      Map obj = response.data;

      return obj["msg"];
    } on Exception catch (err) {
      print(err);
      return;
    }
  }
}
