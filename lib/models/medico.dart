import 'package:flutter/material.dart';

class Medico{
  final int id;
  final String nome;
  final String crm;
  final String email;
  final String telefone;
  final int id_Esp;
  const Medico ({required this.id, required this.nome, required this.crm, required this.email, required this.telefone, required this.id_Esp});
  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'nome': nome,
      'crm': crm,
      'email':email,
      'telefone': telefone,
      'id_Esp': id_Esp
    };
  }
  @override
  String toString(){
    return 'Medoco{ id: $id, nome: $nome, crm: $crm, email: $email, telefone: $telefone, id_Esp: $id_Esp}';
  }

  }


