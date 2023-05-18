import 'item.dart';

class Bitcoin {
  Item? blockchain;
  Item? coinbase;
  Item? bitstamp;
  Item? foxbit;
  Item? bitcoin;

  Bitcoin(this.blockchain, this.coinbase, this.bitstamp, this.foxbit, this.bitcoin);

  Bitcoin.iniciar() {
    blockchain = Item.iniciar();
    coinbase = Item.iniciar();
    bitstamp = Item.iniciar();
    foxbit = Item.iniciar();
    bitcoin = Item.iniciar();
  }
}