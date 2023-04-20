import 'package:flutter/material.dart';
import 'package:inventario_ok/DetalheCampo.dart';
import 'Campo.dart';

class CampoItem extends StatelessWidget {
  final Campo campo;

  const CampoItem({required this.campo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalheCampo(campo: campo),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(campo.imagem),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                campo.titulo,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
