import 'package:flutter/material.dart';
import 'package:flutter_alura/screens/dashboard/saldo.dart';
import 'package:flutter_alura/screens/deposito/formulario.dart';
import 'package:flutter_alura/screens/transferencia/formulario.dart';
import 'package:flutter_alura/screens/transferencia/lista.dart';
import 'package:flutter_alura/screens/transferencia/ultimas.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bytebank'),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormularioDeposito();
                  }));
                },
                child: Text('Receber depósito'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormularioTransferencia();
                  }));
                },
                child: Text('Nova transferencia'),
              ),
            ],
          ),
          UltimasTransferencias(),
        ],
      ),
    );
  }
}
