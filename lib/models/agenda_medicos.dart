class Agenda{
  final int id;
  final String data;
  final String horario_entrada;
  final String horario_saida;
  final int id_med;

  const Agenda({required this.id, required this.data, required this.horario_entrada, required this.horario_saida, required this.id_med});
  

  Map<String, dynamic> toMap(){
    return{'id': id,
     'data': data, 
     'horario_entrada': horario_entrada, 
     'horario_saida': horario_saida ,
     'id_med': id_med};
  }

  @override
  String toString(){
    return 'Agenda{id: $id, data: $data, horario_entrada: $horario_entrada, horario_saida: $horario_saida, id_med: $id_med}';
  }

}