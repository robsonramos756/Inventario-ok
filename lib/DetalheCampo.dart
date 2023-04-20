import 'package:flutter/material.dart';
import 'Campo.dart';

class DetalheCampo extends StatelessWidget {
  final Campo campo;

  const DetalheCampo({required this.campo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(campo.titulo),
      ),
      body: ListView.builder(
        itemCount: campo.itens.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(campo.itens[index].nome),
          );
        },
      ),
    );
  }
}
