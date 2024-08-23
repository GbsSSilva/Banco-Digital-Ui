import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const Cotacao(),
    );
  }
}

class Cotacao extends StatefulWidget {
  const Cotacao({Key? key}) : super(key: key);

  @override
  State<Cotacao> createState() => _CotacaoState();
}

class _CotacaoState extends State<Cotacao> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  double dolar = 0.0;
  double euro = 0.0;

  Future<Map> getData() async {
    var url =
        Uri.parse('https://api.hgbrasil.com/finance?format=json&key=0f1a45cb');
    http.Response response = await http.get(url);
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    return json.decode(response.body);
  }

  VoidCallback? _realChanged(String text) {
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
    return null;
  }

  VoidCallback? _dolarChanged(String text) {
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
    return null;
  }

  VoidCallback? _euroChanged(String text) {
    var parse = double.parse(text);
    double euro = parse;
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.account_balance_rounded),
                  Text(
                    "Cotação",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/imgs/Mauricio.png"),
                    radius: 20,
                  )
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<Map>(
                future: getData(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Center(
                        child: Text(
                          "Aguarde...",
                          style: TextStyle(color: Colors.red, fontSize: 30.0),
                          textAlign: TextAlign.center,
                        ),
                      );
                    default:
                      if (snapshot.hasError) {
                        String? erro = snapshot.error.toString();
                        return Center(
                          child: Text(
                            "Ops, houve uma falha ao buscar os dados : $erro",
                            style: const TextStyle(
                                color: Colors.red, fontSize: 25.0),
                            textAlign: TextAlign.center,
                          ),
                        );
                      } else {
                        dolar = snapshot.data!["results"]["currencies"]["USD"]
                            ["buy"];
                        euro = snapshot.data!["results"]["currencies"]["EUR"]
                            ["buy"];
                        return SingleChildScrollView(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              campoTexto("Reais", "R\$ ", realController,
                                  _realChanged),
                              const Divider(),
                              campoTexto(
                                  "Euros", "€ ", euroController, _euroChanged),
                              const Divider(),
                              campoTexto("Dólares", "US\$ ", dolarController,
                                  _dolarChanged),
                            ],
                          ),
                        );
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget campoTexto(
      String label, String prefix, TextEditingController c, Function? f) {
    return TextField(
      controller: c,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.red),
        border: const OutlineInputBorder(),
        prefixText: prefix,
      ),
      style: const TextStyle(color: Colors.red, fontSize: 25.0),
      onChanged: (value) => {f!(value)},
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}
