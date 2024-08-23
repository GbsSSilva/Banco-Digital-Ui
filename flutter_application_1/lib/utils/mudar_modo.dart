import 'package:banking/utils/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MudarModoNoturno extends StatelessWidget {
  const MudarModoNoturno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provedorDeTema = Provider.of<Tema>(context);

    return Switch.adaptive(
      value: provedorDeTema.modoDark,
      onChanged: (value) {
        final fonercedor = Provider.of<Tema>(context, listen: false);
        fonercedor.alternarTema(value);
      },
    );
  }
}
