import 'package:banking/utils/tema.dart';
import 'package:flutter/material.dart';

import 'package:banking/paginas/principal.dart';
import 'package:provider/provider.dart';

class BarraDeLimite extends StatelessWidget {
  final String titulo;
  // ignore: prefer_typing_uninitialized_variables
  final icone;
  final String limite;

  const BarraDeLimite({
    Key? key,
    required this.titulo,
    this.icone,
    required this.limite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provedorDeTema = Provider.of<Tema>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icone),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  titulo,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Text("\$2,000"),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TweenAnimationBuilder<double>(
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
          tween: Tween<double>(
            begin: 0,
            end: custoDeTrasacao.toInt() / 10000,
          ),
          builder: (context, value, _) => LinearProgressIndicator(
            value: value,
            color: Colors.red,
            backgroundColor: provedorDeTema.modoDark
                ? const Color(0xFF373737)
                : Colors.grey.shade300,
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
