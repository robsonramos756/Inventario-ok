import 'package:flutter/material.dart';
import 'package:inventario_ok/Feed.dart';

void main() {
  runApp(InventarioApp());
}

class InventarioApp extends StatelessWidget {
  const InventarioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventário OK',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inventário OK'),
        ),
        body: Feed(),
      ),
    );
  }
}
