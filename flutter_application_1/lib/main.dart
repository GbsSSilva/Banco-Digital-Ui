import 'package:banking/paginas/login.dart';
import 'package:banking/paginas/perfil.dart';
import 'package:banking/paginas/barra_de_navegacao.dart';
import 'package:banking/paginas/transferencias.dart';
import 'package:banking/paginas/cotacao.dart';
import 'package:banking/utils/tema.dart';
import 'package:flutter/material.dart';

import 'package:banking/paginas/carregamento_app.dart';
import 'package:banking/paginas/principal.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => Tema(),
    builder: (context, _) {
      final themeProvider = Provider.of<Tema>(context);
      return MaterialApp(
        themeMode: themeProvider.modoDeTema,
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        initialRoute: "/",
        routes: {
          "/": (context) => const MyLogin(),
          "/carregar": (context) => const Carregar(),
          "/barra": (context) => const Barra(),
          "/painel": (context) => const Painel(),
          "/tranferencias": (context) => const Transferencias(),
          "/cotacao": (context) => const Cotacao(),
          "/perfil": (context) => const Perfil(),
        },
      );
    }));
