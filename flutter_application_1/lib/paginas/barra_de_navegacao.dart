import 'package:banking/paginas/perfil.dart';
import 'package:banking/paginas/principal.dart';
import 'package:banking/paginas/transferencias.dart';
import 'package:banking/paginas/cotacao.dart';
import 'package:flutter/material.dart';

class Barra extends StatefulWidget {
  const Barra({Key? key}) : super(key: key);

  @override
  State<Barra> createState() => _HomeState();
}

class _HomeState extends State<Barra> {
  int indiceAtual = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indiceAtual,
          onTap: (index) {
            setState(() {
              indiceAtual = index;
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            });
          },
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
              fontFamily: "Inter", fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: const TextStyle(
              fontFamily: "Inter", fontWeight: FontWeight.bold, fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.dashboard_outlined, color: Colors.red),
              icon: Icon(
                Icons.dashboard_outlined,
                color: Color.fromARGB(251, 52, 45, 45),
              ),
              label: "Principal",
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.payments_outlined, color: Colors.red),
                icon: Icon(
                  Icons.payments_outlined,
                  color: Color.fromARGB(251, 52, 45, 45),
                ),
                label: "Transferencias"),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.attach_money_rounded, color: Colors.red),
                icon: Icon(
                  Icons.attach_money_rounded,
                  color: Color.fromARGB(251, 52, 45, 45),
                ),
                label: "Cotações"),
            BottomNavigationBarItem(
                activeIcon:
                    Icon(Icons.person_outline_outlined, color: Colors.red),
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: Color.fromARGB(251, 52, 45, 45),
                ),
                label: "Perfil"),
          ]),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            indiceAtual = index;
          });
        },
        children: const [
          Painel(),
          Transferencias(),
          Cotacao(),
          Perfil(),
        ],
      ),
    );
  }
}
