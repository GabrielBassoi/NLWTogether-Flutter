import 'package:flutter/cupertino.dart';
import 'package:nlw_together/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletos => boletosNotifier.value;
  set boletos(List<BoletoModel> value) => boletosNotifier.value = value;

  final notPaidNotifier = ValueNotifier<int>(0);
  int get notPaid => notPaidNotifier.value;
  set notPaid(int value) => notPaidNotifier.value = value;

  final paidNotifier = ValueNotifier<int>(0);
  int get paid => paidNotifier.value;
  set paid(int value) => paidNotifier.value = value;

  BoletoListController() {
    getBoletos();
  }

  void getNotPaidLenght() {
    int i = 0;
    for (BoletoModel boleto in boletos) {
      if (boleto.paid == false) {
        i++;
      }
    }
    notPaid = i;
  }

  void getPaidLenght() {
    int i = 0;
    for (BoletoModel boleto in boletos) {
      if (boleto.paid == true) {
        i++;
      }
    }
    paid = i;
  }

  Future<void> getBoletos() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos") ?? <String>[];
      print(response);
      boletos = response.map((e) => BoletoModel.fromJson(e)).toList();
    } catch (e) {
      boletos = <BoletoModel>[];
    }
    getNotPaidLenght();
    getPaidLenght();
  }

  Future<void> deleteBoleto(int index) async {
    try {
      final instance = await SharedPreferences.getInstance();
      final boletoss = instance.getStringList("boletos") ?? <String>[];
      boletoss.removeAt(index);
      boletos = boletoss.map((e) => BoletoModel.fromJson(e)).toList();
      await instance.setStringList("boletos", boletoss);
      boletosNotifier.notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setBoletIsPaid(int index, bool paid) async {
    try {
      final instance = await SharedPreferences.getInstance();
      boletos[index].paid = paid;
      final boletoss = boletos.map((e) => e.toJson()).toList();
      await instance.setStringList("boletos", boletoss);
      boletosNotifier.notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
