import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final Icon icone;
  final String titulo;
  final String protocolo;
  final bool troca;
  // ignore: prefer_typing_uninitialized_variables
  final switchButton;

  const DetailCard({
    Key? key,
    required this.icone,
    required this.titulo,
    required this.protocolo,
    required this.troca,
    this.switchButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 4,
              ),
              icone,
              const SizedBox(
                width: 10,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  titulo,
                  style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 10,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  protocolo,
                  style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ],
          ),
          if (troca) switchButton,
        ],
      ),
    );
  }
}
