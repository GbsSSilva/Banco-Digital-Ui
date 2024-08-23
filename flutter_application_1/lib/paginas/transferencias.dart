import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:share_plus/share_plus.dart'; // Adicionado para compartilhar

import '../utils/limite.dart';
import '../utils/cartao_visualizacao.dart';

import 'principal.dart';

class Transferencias extends StatefulWidget {
  const Transferencias({Key? key}) : super(key: key);

  @override
  State<Transferencias> createState() => _PagamentosState();
}

class _PagamentosState extends State<Transferencias> {
  void _compartilhar() {
    Share.share("Veja suas transações no nosso aplicativo!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.account_balance_rounded),
                  Text(
                    "TRANSAÇÕES",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/imgs/Mauricio.png"),
                    radius: 20,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 36),
              child: BarraDeLimite(
                titulo: 'Limite Disponível',
                icone: Icons.money,
                limite: "10,000",
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 36.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Histórico",
                    style: TextStyle(fontFamily: "Inter", fontSize: 13),
                  ),
                  Row(
                    children: [
                      const Text(
                        "\$",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      McCountingText(
                        begin: 0,
                        end: custoDeTrasacao,
                        precision: 2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear,
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Flexible(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                children: transferencias
                    .map((Transacao) => Cartao(
                          icon: Transacao.titulo,
                          title: Transacao.titulo,
                          date: Transacao.data,
                          cost: Transacao.preco,
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _compartilhar,
        backgroundColor: Colors.red,
        child: const Icon(Icons.share),
      ),
    );
  }
}
