import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';

class PortoService {
  final box = GetStorage();

  tambah({
    required String status,
    required int nominal,
    required String 
  }) async {
    try {
      var response = await Dio().post(
        "https://reqres.in/api/users",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "name": "morpheus",
          "job": "programmer",
        },
      );
      Map obj = response.data;
    } on Exception catch (err) {
      print(err);
    }
  }
}
