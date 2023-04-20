import 'package:flutter/material.dart';
import 'package:inventario_ok/CampoItem.dart';
import 'package:inventario_ok/Campo.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Campo>>(
      future: carregarCampos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Feed()),
              );
            },
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CampoItem(campo: snapshot.data![index]);
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar os dados.'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
