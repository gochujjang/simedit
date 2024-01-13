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
  String? filter;
  RxList<Map<String, dynamic>> filteredTransaksi = <Map<String, dynamic>>[].obs;
  Future<void> getTransaksi() async {
    try {
      allTransaksi.assignAll(await TransaksiService().get());
      latestTransaksi.assignAll(await TransaksiService().getLatest());
      filterTransactions();
      update();
    } on Exception catch (err) {
      print(err);
    }
  }

  void filterTransactions() {
    // Perform filtering based on the selected time range
    if (filter == "Hari ini") {
      filteredTransaksi.assignAll(allTransaksi
          .where((transaction) => isToday(transaction['tgl']))
          .cast<Map<String, dynamic>>()
          .toList());
    } else if (filter == "Bulan ini") {
      filteredTransaksi.assignAll(allTransaksi
          .where((transaction) => isThisMonth(transaction['tgl']))
          .cast<Map<String, dynamic>>()
          .toList());
    } else {
      // If no filter is selected, show all transactions
      filteredTransaksi
          .assignAll(allTransaksi.cast<Map<String, dynamic>>().toList());
    }
  }

  bool isToday(String createdAt) {
    DateTime now = DateTime.now();
    DateTime date = DateTime.parse(createdAt);
    return now.day == date.day &&
        now.month == date.month &&
        now.year == date.year;
  }

  bool isThisMonth(String createdAt) {
    DateTime now = DateTime.now();
    DateTime date = DateTime.parse(createdAt);
    return now.month == date.month && now.year == date.year;
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
