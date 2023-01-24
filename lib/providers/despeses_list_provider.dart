import 'package:examen_practic/models/despeses_model.dart';
import 'package:examen_practic/providers/db_provider.dart';
import 'package:flutter/cupertino.dart';

class DespesesListProvider extends ChangeNotifier {
  List<DespesesModel> despesa = [];

  Future<DespesesModel> nouDespesa(String titol) async {
    final nouDespesa = DespesesModel(titol: titol);
    final id = await DBProvider.db.insertDespesa(nouDespesa);
    nouDespesa.id = id;

    this.despesa.add(nouDespesa);
    notifyListeners();
    return nouDespesa;
  }

  carregadespesas() async {
    final despesa = await DBProvider.db.getAllDespeses();
    this.despesa = [...despesa];
    notifyListeners();
  }

  esborrarTots() async {
    final despesa = await DBProvider.db.deleteAllDespeses();
    this.despesa = [];
    notifyListeners();
  }

  esborrarDespesa(int id) async {
    final despesa = await DBProvider.db.deleteDespeses(id);
    this.despesa.removeAt(despesa);
    notifyListeners();
  }
}
