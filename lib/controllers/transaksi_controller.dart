import 'package:SiMedit/services/transaksi_service.dart';
import 'package:get/get.dart';

class TransaksiController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    doTotalUang();
    doIncome();
    doExpense();
    getTransaksi();
    update();
  }

  RxList<dynamic> latestTransaksi = <dynamic>[].obs;
  RxList<dynamic> allTransaksi = <dynamic>[].obs;
  Future<void> getTransaksi() async {
    try {
      allTransaksi.assignAll(await TransaksiService().get());
      latestTransaksi.assignAll(await TransaksiService().getLatest());
    } on Exception catch (err) {
      print(err);
    }
  }

  var totalUang = 0.obs;
  doTotalUang() async {
    try {
      totalUang.value = await TransaksiService().getTotalUang();
    } on Exception catch (err) {
      print(err);
    }
  }

// method income
  var income = 0.obs;
  doIncome() async {
    try {
      income.value = await TransaksiService().getIncome();
    } on Exception catch (err) {
      print(err);
    }
  }

// method expense
  var expense = 0.obs;
  doExpense() async {
    try {
      expense.value = await TransaksiService().getExpense();
    } on Exception catch (err) {
      print(err);
    }
  }
}
