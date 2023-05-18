import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../modelos/item.dart';

class ItemComponente extends StatelessWidget {
  final Item? item;
  const ItemComponente({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${item!.nome}'),
          Row(
            children: [
              Text(
                '${item!.valor}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: item!.variacao > 0 ? Colors.blue : Colors.red,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('${item!.variacao}',
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
