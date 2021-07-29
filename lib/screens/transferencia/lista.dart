import 'package:flutter/material.dart';
import 'package:flutter_alura/models/transferencia.dart';
import 'package:flutter_alura/models/transferencias.dart';
import 'package:flutter_alura/screens/transferencia/formulario.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = "Transferências";

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: Consumer<Transferencias>(builder: (context, transferencias, child) {
        return ListView.builder(
          itemCount: transferencias.transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = transferencias.transferencias[indice];
            return ItemTransferencia(transferencia);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
        },
      ),
    );
  }

//   void _atualiza(transferenciaRecebida) {
//     if (transferenciaRecebida != null) {
//       setState(() {
//         widget._transferencia.add(transferenciaRecebida);
//       });
//     }
//   }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;
  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.toStringValor()),
        subtitle: Text(_transferencia.toStringConta()),
      ),
    );
  }
}
