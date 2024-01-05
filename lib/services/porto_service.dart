import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';

class PortoService {
  final box = GetStorage();

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
