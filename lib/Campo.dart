import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<Campo>> carregarCampos() async {
  String linkJson = await rootBundle.loadString('assets/link.json');
  Map<String, dynamic> dados = jsonDecode(linkJson);

  List<Campo> campos = [];

  dados.forEach((titulo, valor) {
    Map<String, dynamic> campo = valor;
    List<Item> itens = [];
    campo['itens'].forEach((cadeira) {
      itens.add(Item(nome: cadeira, quantidade: 2, descricao: ''));
    });
    campos.add(Campo(
      titulo: titulo,
      imagem: campo['imagem'],
      conteudo: campo['conteúdo'],
      itens: itens,
    ));
  });

  return campos;
}

class Campo {
  String titulo;
  String imagem;
  String conteudo;
  List<Item> itens;

  Campo({
    required this.titulo,
    required this.imagem,
    required this.conteudo,
    required this.itens,
  });
}

// Definindo a classe Item
class Item {
  final String nome;
  final String descricao;
  final int quantidade;

  Item({required this.nome, required this.descricao, required this.quantidade});

  @override
  String toString() {
    return '$nome\n\nDescrição: $descricao\n\nQuantidade: $quantidade';
  }
}

// Exemplo de criação e impressão de um objeto Item
Item cadeira = Item(
  nome: 'Cadeira',
  descricao: 'Uma cadeira de escritório com encosto e apoio para os braços.',
  quantidade: 10,
);

print(cadeira) {
  // TODO: implement print
  throw UnimplementedError();
}
