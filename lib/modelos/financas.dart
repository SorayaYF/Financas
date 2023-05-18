import 'acoes.dart';
import 'bitcoin.dart';
import 'moedas.dart';

class Financas {
  Moedas? moedas;
  Acoes? acoes;
  Bitcoin? bitcoins;

  Financas(this.moedas, this.acoes, this.bitcoins);

  Financas.iniciar() {
    moedas = Moedas.iniciar();
    acoes = Acoes.iniciar();
    bitcoins = Bitcoin.iniciar();
  }
}
