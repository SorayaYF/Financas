import 'package:financas/paginas/pg_acoes.dart';
import 'package:financas/paginas/pg_bitcoins.dart';
import 'package:financas/paginas/pg_principais_moedas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/principaisMoedas',
      routes: {
        '/principaisMoedas':(context) => PgPrincipaisMoedas(),
        '/acoes':(context) => PgAcoes(),
        '/bitcoin': (context) => PgBitcoin(),
      }
    );
  }
}
