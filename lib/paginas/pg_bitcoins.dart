import 'package:flutter/material.dart';

import '../componentes/item_componente.dart';
import '../modelos/financas.dart';

class PgBitcoin extends StatefulWidget {
  const PgBitcoin({super.key});

  @override
  State<PgBitcoin> createState() => _PgBitcoinState();
}

class _PgBitcoinState extends State<PgBitcoin> {
  @override
  Widget build(BuildContext context) {
    final financas = ModalRoute.of(context)!.settings.arguments as Financas;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Finanças de Hoje"),
        backgroundColor: Color.fromARGB(255, 53, 87, 54),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 30),
          const Center(
            child: Text(
              "BitCoin",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: ItemComponente(
                              item: financas.bitcoins!.blockchain)),
                      Expanded(
                          child:
                              ItemComponente(item: financas.bitcoins!.coinbase))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ItemComponente(
                              item: financas.bitcoins!.bitstamp)),
                      Expanded(
                          child:
                              ItemComponente(item: financas.bitcoins!.foxbit))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child:
                              ItemComponente(item: financas.bitcoins!.bitcoin)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .pushNamed("/principaisMoedas", arguments: financas),
              child: Text("Página Principal"),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 53, 87, 54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
