class Especilidades{
  final int id;
  final String nome;

  const Especilidades({required this.id, required this.nome});

  Map<String,dynamic>toMap(){
    return{
      'id' : id, 
      'nome': nome
    };
  }
  @override 
  String toString() {
    return 'Especialidade{ id: $id, nome: $nome }';
  }
}