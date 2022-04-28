class Pacientes{
  final int id;
  final String nome;
  final String cpf;
  final String email;
  final String sexo;
  final String telefone;
  final int id_Agenda;

  const Pacientes ({required this.id, required this.nome, required this.cpf, required this.email, required this.sexo, required this.telefone, required this.id_Agenda});

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'email': email,
      'sexo': sexo,
      'telefone': telefone,
      'id_Agenda':id_Agenda
    };
  }
  @override
  String toString(){
  return 'Pacientes{ id: $id, nome $nome, cpf: $cpf, email: $email, sexo: $sexo, telefone: $telefone, id_Agenda: $id_Agenda}';
  

}
}