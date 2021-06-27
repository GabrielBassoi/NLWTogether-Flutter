import 'package:flutter/cupertino.dart';
import 'package:nlw_together/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletos => boletosNotifier.value;
  set boletos(List<BoletoModel> value) => boletosNotifier.value = value;

  final notPaidLenghtNotifier = ValueNotifier<int>(0);
  int get getnotPaidLenght => notPaidLenghtNotifier.value;
  set setnotPaidlenght(int value) => notPaidLenghtNotifier.value = value;

  final paidLenghtNotifier = ValueNotifier<int>(0);
  int get getpaidlenght => paidLenghtNotifier.value;
  set setpaidLenght(int value) => paidLenghtNotifier.value = value;

  BoletoListController() {
    getBoletos();
  }

  // int gettnotPaidLenght() {
  //   int i = 0;
  //   boletos.map((e) {
  //     if (e.paid == false) {
  //       i++;
  //     }
  //   });
  //   notPaidLenghtNotifier.value = i;
  //   return getnotPaidLenght;
  // }

  // int gettPaidLenght() {
  //   int i = 0;
  //   boletos.map((e) {
  //     if (e.paid == true) {
  //       i++;
  //     }
  //   });
  //   paidLenghtNotifier.value = i;
  //   return getnotPaidLenght;
  // }

  Future<void> getBoletos() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos") ?? <String>[];
      boletos = response.map((e) => BoletoModel.fromJson(e)).toList();
    } catch (e) {
      boletos = <BoletoModel>[];
    }
  }

  Future<void> deleteBoleto(int index) async {
    try {
      final instance = await SharedPreferences.getInstance();
      final boletoss = instance.getStringList("boletos") ?? <String>[];
      boletoss.removeAt(index);
      boletos = boletoss.map((e) => BoletoModel.fromJson(e)).toList();
      await instance.setStringList("boletos", boletoss);
    } catch (e) {
      print(e);
    }
  }

  Future<void> setBoletIsPaid(int index, bool paid) async {
    try {
      final instance = await SharedPreferences.getInstance();
      boletos[index].paid = paid;
      boletosNotifier.notifyListeners();
      final boletoss = boletos.map((e) => e.toJson()).toList();
      await instance.setStringList("boletos", boletoss);
    } catch (e) {
      print(e);
    }
  }
}
