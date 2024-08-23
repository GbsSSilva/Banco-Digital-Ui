import 'package:banking/utils/mudar_modo.dart';
import 'package:banking/utils/detalhes_do_cartao.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _ChatState();
}

class _ChatState extends State<Perfil> {
  int indexAtual = 0;

  final _controlador = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 73,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/imgs/Mauricio.png"),
                      radius: 70,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Maurício Aldenor",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Detalhes",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 330,
              height: 183,
              child: PageView(controller: _controlador, children: const [
                Column(
                  children: [
                    DetailCard(
                      icone: Icon(Icons.account_balance_outlined, size: 24),
                      titulo: "Nome do Banco:",
                      protocolo: "Nubank",
                      troca: false,
                    ),
                    DetailCard(
                      icone: Icon(Icons.perm_contact_cal_outlined, size: 24),
                      titulo: "Nome:",
                      protocolo: "Fabio Feitosa",
                      troca: false,
                    ),
                    DetailCard(
                      icone: Icon(Icons.numbers_outlined, size: 24),
                      titulo: "Protocolo:",
                      protocolo: "10345564475611412",
                      troca: false,
                    ),
                  ],
                ),
                Column(
                  children: [
                    DetailCard(
                      icone: Icon(Icons.account_balance_outlined, size: 24),
                      titulo: "Nome do Banco:",
                      protocolo: "Banco do Brasil",
                      troca: false,
                    ),
                    DetailCard(
                      icone: Icon(Icons.perm_contact_cal_outlined, size: 24),
                      titulo: "Nome:",
                      protocolo: "Gabriel Correa",
                      troca: false,
                    ),
                    DetailCard(
                      icone: Icon(Icons.numbers_outlined, size: 24),
                      titulo: "Protocolo:",
                      protocolo: "10345564475611412",
                      troca: false,
                    ),
                  ],
                ),
                Column(
                  children: [
                    DetailCard(
                      icone: Icon(Icons.account_balance_outlined, size: 24),
                      titulo: "Nome do Banco:",
                      protocolo: "Bradesco",
                      troca: false,
                    ),
                    DetailCard(
                      icone: Icon(Icons.perm_contact_cal_outlined, size: 24),
                      titulo: "Nome:",
                      protocolo: "Gabriel Santos",
                      troca: false,
                    ),
                    DetailCard(
                      icone: Icon(Icons.numbers_outlined, size: 24),
                      titulo: "Protocolo:",
                      protocolo: "10345564475611412",
                      troca: false,
                    ),
                  ],
                ),
                Column(
                  children: [
                    DetailCard(
                      icone: Icon(Icons.account_balance_outlined, size: 24),
                      titulo: "Nome do Banco:",
                      protocolo: "Santander",
                      troca: false,
                    ),
                    DetailCard(
                      icone: Icon(Icons.perm_contact_cal_outlined, size: 24),
                      titulo: "Nome:",
                      protocolo: "Léo Davis",
                      troca: false,
                    ),
                    DetailCard(
                      icone: Icon(Icons.numbers_outlined, size: 24),
                      titulo: "Protocolo:",
                      protocolo: "10345564475611412",
                      troca: false,
                    ),
                  ],
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            SmoothPageIndicator(
              controller: _controlador,
              count: 4,
              effect: const ExpandingDotsEffect(activeDotColor: Colors.red),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Configurações",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  DetailCard(
                    icone: Icon(Icons.dark_mode),
                    titulo: "Dark Mode",
                    protocolo: "",
                    troca: true,
                    switchButton: MudarModoNoturno(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
