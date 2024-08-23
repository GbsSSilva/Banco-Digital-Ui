import 'package:flutter/material.dart';

class Transacao {
  String titulo;
  String data;
  double preco;

  Transacao({
    required this.titulo,
    required this.data,
    required this.preco,
  });
}

class Cartao extends StatelessWidget {
  final String title;
  // ignore: prefer_typing_uninitialized_variables
  final date;
  // ignore: prefer_typing_uninitialized_variables
  final cost;
  final String icon;
  // ignore: prefer_typing_uninitialized_variables
  final widget;

  const Cartao({
    Key? key,
    required this.icon,
    required this.title,
    required this.date,
    this.cost,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black12,
                backgroundImage:
                    AssetImage("assets/imgs/${icon.toLowerCase()}.png"),
                radius: 24,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  date,
                  style:
                      const TextStyle(fontFamily: "Inter", color: Colors.grey),
                ),
              ]),
            ],
          ),
          if (cost != null)
            Text(
              "\$$cost",
              style: const TextStyle(fontWeight: FontWeight.w700),
            )
          else
            widget
        ],
      ),
    );
  }
}
