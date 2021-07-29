import 'package:flutter/material.dart';
import 'package:flutter_alura/components/editor.dart';
import 'package:flutter_alura/models/saldo.dart';
import 'package:flutter_alura/models/transferencia.dart';
import 'package:flutter_alura/models/transferencias.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = "Criando Transferencia";
const _rotuloConta = 'Número da Conta';
const _dicaConta = '0000';
const _rotuloValor = 'Valor';
const _dicaValor = '00.0';
const _tituloConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    final transferenciaValida =
        _validaTransferencia(context, numeroConta, valor);

    if (transferenciaValida) {
      final novaTransferencia = Transferencia(valor!, numeroConta!);
      _atualizaEstado(context, novaTransferencia, valor);
      Navigator.pop(context);
    }
  }

  _atualizaEstado(context, novaTransferencia, valor) {
    Provider.of<Transferencias>(context, listen: false)
        .adiciona(novaTransferencia);

    Provider.of<Saldo>(context, listen: false).subtrai(valor);
  }

  _validaTransferencia(context, numeroConta, valor) {
    final _camposPreenchidos = numeroConta != null && valor != null;
    final _saldoSuficiente =
        valor <= Provider.of<Saldo>(context, listen: false).valor;

    return _camposPreenchidos && _saldoSuficiente;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloConta,
                dica: _dicaConta),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloValor,
                dica: _dicaValor,
                icone: Icons.monetization_on),
            TextButton(
                onPressed: () => _criaTransferencia(context),
                child: Text(_tituloConfirmar))
          ],
        ),
      ),
    );
  }
}
