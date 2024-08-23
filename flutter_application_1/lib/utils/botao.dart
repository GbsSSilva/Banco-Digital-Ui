import 'package:banking/utils/tema.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  final String titulo;
  // ignore: prefer_typing_uninitialized_variables
  final icone;

  const Button({
    Key? key,
    required this.titulo,
    this.icone,
    required Null Function() onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Tema>(context);

    return Container(
      width: 140,
      height: 50,
      decoration: BoxDecoration(
          color: themeProvider.modoDark ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: themeProvider.modoDark
              ? [
                  const BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.grey.shade800,
                    offset: const Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  )
                ]),
      child: MaterialButton(
        onPressed: () {
          if (kDebugMode) {
            print("eee");
          }
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            titulo,
            style: TextStyle(
                color: themeProvider.modoDark ? Colors.grey : Colors.black),
          ),
          Icon(
            icone,
            color: themeProvider.modoDark ? Colors.grey : Colors.black,
          ),
        ]),
      ),
    );
  }
}
