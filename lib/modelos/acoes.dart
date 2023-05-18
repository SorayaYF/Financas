import 'item.dart';

class Acoes {
  Item? ibovespa;
  Item? ifix;
  Item? nasdaq;
  Item? dowjones;
  Item? cac;
  Item? nikkei;

  Acoes(this.ibovespa, this.ifix, this.nasdaq, this.dowjones, this.cac, this.nikkei);

  Acoes.iniciar() {
    ibovespa = Item.iniciar();
    ifix = Item.iniciar();
    nasdaq = Item.iniciar();
    dowjones = Item.iniciar();
    cac = Item.iniciar();
    nikkei = Item.iniciar();
  }
}