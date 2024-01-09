import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class TransaksiService {
  final box = GetStorage();

  Future<List> get() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://medit.kreatifsolusindo.id/api/transaction",
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
    return data;
  }

  Future<List> getLatest() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://medit.kreatifsolusindo.id/api/latestTransaction",
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
    return data;
  }

  Future<int> getTotalUang() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://medit.kreatifsolusindo.id/api/total-money",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    Map obj = response.data;
    int total = obj["data"];
    return total;
  }

  Future<int> getIncome() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://medit.kreatifsolusindo.id/api/income",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    Map obj = response.data;
    int income = obj["data"];
    return income;
  }

  Future<int> getExpense() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://medit.kreatifsolusindo.id/api/expense",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    Map obj = response.data;
    int expense = obj["data"];
    return expense;
  }

  create({
    required String status,
    required String nominal,
    required String tanggal,
    required String keterangan,
  }) async {
    String? token = box.read("token");
    try {
      var response = await Dio().post(
        "https://medit.kreatifsolusindo.id/api/transaction",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "status": status,
          "nominal": nominal,
          "tgl": tanggal,
          "Keterangan": keterangan,
        },
      );
      Map obj = response.data;
      print("Request payload : $status, $nominal, $tanggal, $keterangan");
      print("Response OBJ = ${obj}");
      return true;
    } on Exception catch (err) {
      print(err);
      return false;
    }
  }
}
