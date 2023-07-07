import 'package:flutter/material.dart';


class Usuario {
  int id;
  String nome;
  String foto;
  String email;
  int telefone;
  String senha;

  Usuario({
    required this.id,
    required this.nome,
    required this.foto,
    required this.email,
    required this.telefone,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'foto': foto,
      'email': email,
      'telefone': telefone,
      'senha': senha,
    };
  }

  static Usuario fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      foto: map['foto'],
      email: map['email'],
      telefone: map['telefone'],
      senha: map['senha'],
    );
  }
}
