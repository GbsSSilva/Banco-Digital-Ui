import 'package:banking/utils/cartao_visualizacao.dart';
import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:provider/provider.dart';

import '../utils/botao.dart';
import '../utils/limite.dart';
import '../utils/tema.dart';

class Painel extends StatefulWidget {
  const Painel({Key? key}) : super(key: key);

  @override
  State<Painel> createState() => _HomeState();
}

List<Transacao> getTransakce() {
  return [];
}

double custoDeTrasacao = 0;

List<Transacao> transferencias = [
  Transacao(titulo: "SHEIN", data: "Abr 10, 2024", preco: 19.99),
  Transacao(titulo: "Adobe", data: "Mar 27, 2024", preco: 34.99),
  Transacao(titulo: "Alza", data: "Mar 8, 2024", preco: 12.99),
  Transacao(titulo: "YouTube", data: "Fev 18, 2024", preco: 9.99),
  Transacao(titulo: "CZC", data: "Fev 12, 2024", preco: 15.99),
  Transacao(titulo: "DPD", data: "Jan 19, 2024", preco: 8.99),
  Transacao(titulo: "CK GANG", data: "Jan 9, 2024", preco: 36.99),
];

class _HomeState extends State<Painel> {
  int indiceAtual = 0;

  void countTransaction() {
    custoDeTrasacao = 0;
    // ignore: non_constant_identifier_names
    for (var Transacao in transferencias) {
      custoDeTrasacao += Transacao.preco;
    }
    // ignore: avoid_print
    print(custoDeTrasacao.toInt() / 100);
  }

  @override
  Widget build(BuildContext context) {
    countTransaction();
    Provider.of<Tema>(context);
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
                    "CONTA",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/imgs/Mauricio.png"),
                    radius: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$",
                  style: TextStyle(
                      fontFamily: "Inter",
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                      fontSize: 50),
                ),
                McCountingText(
                  begin: 3.000,
                  end: 3.000,
                  precision: 3,
                  style: TextStyle(
                      fontFamily: "Inter",
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              "Limite disponível",
              style: TextStyle(fontFamily: "Inter"),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  titulo: "Pix",
                  icone: Icons.pix,
                  onPressed: () {
                    Navigator.pushNamed(context, '/pix');
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                Button(
                  titulo: "Pagar",
                  icone: Icons.crop_free,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 36),
              child: BarraDeLimite(
                titulo: 'Limite Diário',
                icone: Icons.money,
                limite: "2,000",
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 36.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Trasações",
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
                        begin: custoDeTrasacao,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(children: [
                for (var i = 0; i < transferencias.length; i++)
                  if (i < 1)
                    Cartao(
                        icon: transferencias[i].titulo,
                        title: transferencias[i].titulo,
                        date: transferencias[i].data,
                        cost: transferencias[i].preco)
                  else if (i == 3)
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mais Transações",
                          style: TextStyle(fontFamily: "Inter"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward_outlined),
                      ],
                    ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
