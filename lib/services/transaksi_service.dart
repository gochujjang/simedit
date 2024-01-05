import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class TransaksiService {
  final box = GetStorage();

  Future<Map> get() async {
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
    Map obj = response.data;
    return obj;
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
    required int nominal,
    required String tanggal,
    required String keterangan,
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
          "tanggal": tanggal,
          "keterangan": keterangan,
        },
      );
      Map obj = response.data;

      print("Response OBJ = ${obj}");
    } on Exception catch (err) {
      print(err);
    }
  }
}
