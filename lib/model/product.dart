import 'package:flutter/material.dart';

class Produto {
  int id;
  String nome;
  String foto;
  String descricao;
  double valor;
  int idUsuario;

  Produto({
    required this.id,
    required this.nome,
    required this.foto,
    required this.descricao,
    required this.valor,
    required this.idUsuario,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'foto': foto,
      'descricao': descricao,
      'valor': valor,
      'idUsuario': idUsuario,
    };
  }

  static Produto fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'],
      nome: map['nome'],
      foto: map['foto'],
      descricao: map['descricao'],
      valor: map['valor'],
      idUsuario: map['idUsuario'],
    );
  }
}
