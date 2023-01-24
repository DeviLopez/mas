import 'package:examen_practic/models/despeses_model.dart';
import 'package:examen_practic/providers/despeses_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final despesesListProvider =
        Provider.of<DespesesListProvider>(context).carregadespesas();
    final despesa = despesesListProvider.despesa;
    print(despesa.length);
    return ListView.builder(
      itemCount: despesa.length,
      itemBuilder: (_, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
          child: Align(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.delete_forever),
            ),
          ),
          alignment: Alignment.centerRight,
        ),
        onDismissed: (DismissDirection direccio) {
          Provider.of<DespesesListProvider>(context, listen: false)
              .esborrarDespesa(despesa[index].id!);
        },
        child: ListTile(
          leading: Icon(Icons.games),
          title: Text(despesa[index].titol),
          subtitle: Text(despesa[index].quantitat.toString()),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
