import 'dart:convert';

import 'package:financas/modelos/acoes.dart';
import 'package:financas/modelos/bitcoin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../componentes/item_componente.dart';
import '../modelos/financas.dart';
import '../modelos/item.dart';
import '../modelos/moedas.dart';

class PgPrincipaisMoedas extends StatefulWidget {
  const PgPrincipaisMoedas({super.key});

  @override
  State<PgPrincipaisMoedas> createState() => _PgPrincipaisMoedasState();
}

class _PgPrincipaisMoedasState extends State<PgPrincipaisMoedas> {
  Financas financas = Financas.iniciar();

  principaisMoedas() async {
    final String urlViaReal =
        await 'https://api.hgbrasil.com/finance?format=json-cors&key=b8a1b478';
    Response resposta = await get(Uri.parse(urlViaReal));
    Map money = json.decode(resposta.body);

    //Moeda e suas Variações
    Item dolar = Item("Dólar", money['results']['currencies']['USD']['buy'],
        money['results']['currencies']['USD']['variation']);
    Item euro = Item("Euro", money['results']['currencies']['EUR']['buy'],
        money['results']['currencies']['EUR']['variation']);
    Item peso = Item("Peso", money['results']['currencies']['ARS']['buy'],
        money['results']['currencies']['ARS']['variation']);
    Item yen = Item("Yen", money['results']['currencies']['JPY']['buy'],
        money['results']['currencies']['JPY']['variation']);
    Moedas moedas = Moedas(dolar, euro, peso, yen);

    //Ações e suas Variações
    Item ibovespa = Item(
        "IBOVESPA",
        money['results']['stocks']['IBOVESPA']['points'],
        money['results']['stocks']['IBOVESPA']['variation']);
    Item ifix = Item("IFIX", money['results']['stocks']['IFIX']['points'],
        money['results']['stocks']['IFIX']['variation']);
    Item nasdaq = Item("NASDAQ", money['results']['stocks']['NASDAQ']['points'],
        money['results']['stocks']['NASDAQ']['variation']);
    Item dowjones = Item(
        "DOWJONES",
        money['results']['stocks']['DOWJONES']['points'],
        money['results']['stocks']['DOWJONES']['variation']);
    Item cac = Item("CAC", money['results']['stocks']['CAC']['points'],
        money['results']['stocks']['CAC']['variation']);
    Item nikkei = Item("NIKKEI", money['results']['stocks']['NIKKEI']['points'],
        money['results']['stocks']['NIKKEI']['variation']);
    Acoes acoes = Acoes(ibovespa, ifix, nasdaq, dowjones, cac, nikkei);

    //BitCoin e suas Variações
    Item blockchain = Item(
        "BlockChain.info",
        money['results']['bitcoin']['blockchain_info']['last'],
        money['results']['bitcoin']['blockchain_info']['variation']);
    Item coinbase = Item(
        "CoinBase",
        money['results']['bitcoin']['coinbase']['last'],
        money['results']['bitcoin']['coinbase']['variation']);
    Item bitstamp = Item(
        "BitStamp",
        money['results']['bitcoin']['bitstamp']['last'],
        money['results']['bitcoin']['bitstamp']['variation']);
    Item foxbit = Item("FoxBit", money['results']['bitcoin']['foxbit']['last'],
        money['results']['bitcoin']['foxbit']['variation']);
    Item bitcoin = Item(
        "Mercado BitCoin",
        money['results']['bitcoin']['mercadobitcoin']['last'],
        money['results']['bitcoin']['mercadobitcoin']['variation']);
    Bitcoin bitcoins = Bitcoin(blockchain, coinbase, bitstamp, foxbit, bitcoin);

    setState(() {});
    financas = Financas(moedas, acoes, bitcoins);
  }

  @override
  Widget build(BuildContext context) {
    principaisMoedas();
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
              "MOEDAS",
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
                          child: ItemComponente(item: financas.moedas!.dolar)),
                      Expanded(
                          child: ItemComponente(item: financas.moedas!.euro)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ItemComponente(item: financas.moedas!.peso)),
                      Expanded(
                          child: ItemComponente(item: financas.moedas!.yen))
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
                  .pushNamed("/acoes", arguments: financas),
              child: Text("Ir para Ações"),
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
