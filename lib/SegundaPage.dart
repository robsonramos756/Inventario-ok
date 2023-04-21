import 'package:flutter/material.dart';

class SegundaPage extends StatelessWidget {
  final ImageProvider image;
  final String message;

  SegundaPage({required this.image, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conteúdo da categoria'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: image),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              message,
              style: TextStyle(fontSize: 60),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
