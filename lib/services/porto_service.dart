import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';

class PortoService {
  final box = GetStorage();

  Future<List> get() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://medit.kreatifsolusindo.id/api/portofolio",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    String jsonString = jsonEncode(response.data);
    Map obj = jsonDecode(jsonString);
    List data = obj["data"];
    print(data);
    return data;
  }

  Future<int> getTotalPorto() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://medit.kreatifsolusindo.id/api/total-terkumpul",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    int obj = response.data;
    return obj;
  }

  Future<int> getTotalTarget() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://medit.kreatifsolusindo.id/api/total-target",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    int obj = response.data;
    return obj;
  }

  createPorto({
    required String title,
    required String target,
  }) async {
    String? token = box.read("token");
    try {
      var response = await Dio().post(
        "https://medit.kreatifsolusindo.id/api/portofolio",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "title": title,
          "target": target,
        },
      );
      Map obj = response.data;
      print("Request payload : $title, $target");
      print("Response OBJ = ${obj}");
      return true;
    } on Exception catch (err) {
      print(err);
      return false;
    }
  }

  tambah({
    required String status,
    required int nominal,
    required String porto,
  }) async {
    String? token = box.read("token");
    try {
      var response = await Dio().post(
        "https://reqres.in/api/users",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "status": status,
          "nominal": nominal,
          "porto": porto,
        },
      );
      Map obj = response.data;
      print("Response OBJ = ${obj}");
    } on Exception catch (err) {
      print(err);
    }
  }
}
