import 'package:flutter/material.dart';

import '../modelos/financas.dart';
import '../componentes/item_componente.dart';

class PgAcoes extends StatefulWidget {
  const PgAcoes({super.key});

  @override
  State<PgAcoes> createState() => _PgAcoesState();
}

class _PgAcoesState extends State<PgAcoes> {
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
              "Ações",
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
                          child:
                              ItemComponente(item: financas.acoes!.ibovespa)),
                      Expanded(
                          child: ItemComponente(item: financas.acoes!.ifix))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ItemComponente(item: financas.acoes!.nasdaq)),
                      Expanded(
                          child: ItemComponente(item: financas.acoes!.dowjones))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ItemComponente(item: financas.acoes!.cac)),
                      Expanded(
                          child: ItemComponente(item: financas.acoes!.nikkei))
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
                  .pushNamed("/bitcoin", arguments: financas),
              child: Text("Ir para Bitcoin"),
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
