
import 'package:clinica_medica/models/especialidade.dart';
import 'package:clinica_medica/models/medico.dart';
import 'package:clinica_medica/models/agenda_medicos.dart';
import 'package:clinica_medica/models/pacientes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class Banco_Dados{
  Banco_Dados._();
  static final Banco_Dados instance = Banco_Dados._();
  
  static Database? _bancodeDados;
  
  get bancodedados async {
    if (_bancodeDados != null) return _bancodeDados;

    return await _intBanco();
  }

  _intBanco() async{
    return await openDatabase(
      join(await getDatabasesPath(), 'clinica.db'),
      version: 2,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async{
    await db.execute(
      """
        CREATE TABLE especialidade(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL
      );
      """
    );

    await db.execute(
    """
      CREATE TABLE medico(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      crm TEXT NOT NULL, 
      email TEXT NOT NULL, 
      telefone TEXT NOT NULL, 
      id_Esp INTEGER NOT NULL,
      FOREIGN KEY(id_Esp) REFERENCES especialidade(id)
    );

    """
  );

  await db.execute(
    """
      CREATE TABLE agenda(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      data TEXT NOT NULL,
      horario_entrada TEXT NOT NULL,
      horario_saida TEXT NOT NULL, 
      id_med INTEGER NOT NULL,
      FOREIGN KEY(id_med) REFERENCES medico (id)
    );
    """
  );

   await db.execute(
     """
      CREATE TABLE pacientes(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      nome TEXT NOT NULL, 
      cpf TEXT NOT NULL, 
      email TEXT NOT NULL,
      sexo TEXT NOT NULL,
      telefone  TEXT NOT NULL,
      id_Agenda INTEGER NOT NULL,
      FOREIGN KEY(id_Agenda) REFERENCES agenda (id)
    );
    """
   );

  }

   Future<void> Adicionar_Especialidade(Especialidades, especialidade) async {
    final Database db = await instance.bancodedados;
    await db.insert(
      'especialidade',
      especialidade.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  } 

  Future<void> Adicionar_Medico(Medico, medico) async {
    final Database db = await instance.bancodedados;
    await db.insert('medico', medico.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  
  Future<void> Adicionar_Agenda(Agenda, agenda) async {
    final Database db = await instance.bancodedados;
    await db.insert(
      'agenda',
      agenda.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> Adicionar_Pacientes(Pacientes, pacientes) async {
    final Database db = await instance.bancodedados;
    await db.insert(
      'pacientes',
      pacientes.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  } 

  Future<List<Especilidades>> ListaEspecialidade() async {
    final Database db = await instance.bancodedados;
    final List<Map<String, dynamic>> maps = await db.query('especialidade');
    return List.generate(maps.length, (i) {
      return Especilidades(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
      );
    });
  }
  
  Future<List<Medico>> ListaMedico() async {
    final Database db = await instance.bancodedados;
    final List<Map<String, dynamic>> maps = await db.query('medico');
    return List.generate(maps.length, (i) {
      return Medico(
          id: maps[i]['id'],
          nome: maps[i]['nome'],
          crm: maps[i]['crm'],
          email: maps[i]['email'],
          telefone: maps[i]['telefone'],
          id_Esp: maps[i]['id_Esp'],
        );
    });
  }

  Future<List<Agenda>> ListaAgendas() async{
    final Database db = await instance.bancodedados;
    final List<Map<String, dynamic>> maps = await db.query('agenda');
    return List.generate(maps.length, (i) {
      return Agenda(
          id:maps[i]['id'],
          data:maps[i]['data'], 
          horario_entrada:maps[i]['horario_entrada'],
          horario_saida:maps[i]['horario_saida'],
          id_med:maps[i]['id_med'],
        ); 
    }); 
  }
  Future<List<Pacientes>> ListaPacientes() async{
    final Database db = await instance.bancodedados;
    final List<Map<String, dynamic>> maps = await db.query('pacientes');
    return List.generate(maps.length, (i) {
      return Pacientes(
          id:maps[i]['id'], 
          nome:maps[i]['nome'], 
          cpf:maps[i]['cpf'], 
          email:maps[i]['email'], 
          sexo:maps[i]['sexo'], 
          telefone:maps[i]['telefone'],
          id_Agenda:maps[i]['id_Agenda'],
        );
    });
  }
  
  Future<void> AtualizarEspecialidade(Especilidades especialidade) async {
    final db = await instance.bancodedados;
    await db.update(
      'especialidade',
      especialidade.toMap(),
      where: 'id = ?',
      whereArgs: [especialidade.id],
    );
  }

  Future<void> AtualizarMedico(Medico medico) async {
    final db = await instance.bancodedados;
    await db.update(
      'medico',
      medico.toMap(),
      where: 'id = ?',
      whereArgs: [medico.id],
    );
  }

  Future<void> AtualizarAgenda(Agenda agenda) async {
    final db = await instance.bancodedados;
    await db.update(
      'agenda',
      agenda.toMap(),
      where: 'id = ?',
      whereArgs: [agenda.id],
    );
  }

  Future<void> AtualizarPacientes(Pacientes pacientes) async {
    final db = await instance.bancodedados;
    await db.update(
      'pacientes',
      pacientes.toMap(),
      where: 'id = ?',
      whereArgs: [pacientes.id],
    );
  }

  Future<void> ApagarEspecialidade(int id) async {
    final db = await bancodedados;
    await db.delete(
      'especialidade',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> ApagarMedico(int id) async {
    final db = await bancodedados;
    await db.delete(
      'medico',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> ApagarAgenda(int id) async {
    final db = await bancodedados;
    await db.delete(
      'agenda',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> ApagarPacientes(int id) async {
    final db = await bancodedados;
    await db.delete(
      'pacientes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future FecharBancodeDados() async {
    final db = await instance.bancodedados;
    db.close();
  }

}