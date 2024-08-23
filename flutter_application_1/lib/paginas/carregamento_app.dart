import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Carregar extends StatefulWidget {
  const Carregar({Key? key}) : super(key: key);

  @override
  State<Carregar> createState() => _LoadingState();
}

class _LoadingState extends State<Carregar> {
  void setup() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, "/barra");
  }

  @override
  void initState() {
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitFoldingCube(
        color: Colors.red,
      ),
    );
  }
}
