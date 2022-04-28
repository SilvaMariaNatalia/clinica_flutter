import 'package:clinica_medica/models/especialidade.dart';
import 'package:flutter/material.dart';
import 'package:clinica_medica/models/especialidade.dart';
import 'package:clinica_medica/models/medico.dart';
import 'package:clinica_medica/models/pacientes.dart';
import 'package:clinica_medica/models/agenda_medicos.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Banco_Sqlite/banco.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  var ortopedista = const Especilidades(id: 1,nome:'Ortopedista');
  var pediatra = const Especilidades(id: 2,nome:'pediatra');
  var cardiologista = const Especilidades(id: 3,nome:'cardiologista');
  var ginecologista = const Especilidades(id: 4,nome:'ginecologista');

  Banco_Dados.instance.Adicionar_Especialidade(Especilidades, ortopedista);
  Banco_Dados.instance.Adicionar_Especialidade(Especilidades, pediatra);
  Banco_Dados.instance.Adicionar_Especialidade(Especilidades, cardiologista);
  Banco_Dados.instance.Adicionar_Especialidade(Especilidades, ginecologista);
  
  print(await Banco_Dados.instance.ListaEspecialidade());

  var maria = const Medico(
    id: 1, nome:'Maria',crm: '4576', email:'silva@gmail.com',telefone: '99 9999-9999',id_Esp: 1);

  var davi = const Medico(
    id: 2, nome:'Davi',crm: '432', email:'davi@gmail.com',telefone: '89 4534-9876',id_Esp: 2);

  var joao = const Medico(
    id: 3, nome:'Joao',crm: '12', email:'joao@gmail.com',telefone: '89 3423-3432',id_Esp: 3);
  
  Banco_Dados.instance.Adicionar_Medico(Medico,maria);
  Banco_Dados.instance.Adicionar_Medico(Medico,davi);
  Banco_Dados.instance.Adicionar_Medico(Medico,joao);

  print(await Banco_Dados.instance.ListaMedico());

  var agendaMaria = const Agenda(id: 1, data: '12/05/2022', horario_entrada: '8:00', horario_saida: '11:00', id_med: 1);
  var agendaDavi = const Agenda(id: 2, data: '14/07/2022', horario_entrada: '13:00', horario_saida: '14:00', id_med: 2);
  var agendaJoao = const Agenda(id: 3, data: '16/08/2022', horario_entrada: '16:00', horario_saida: '18:00', id_med: 3);

  Banco_Dados.instance.Adicionar_Agenda(Agenda,agendaMaria);
  Banco_Dados.instance.Adicionar_Agenda(Agenda,agendaDavi);
  Banco_Dados.instance.Adicionar_Agenda(Agenda,agendaJoao);

  print( await Banco_Dados.instance.ListaAgendas());

   var luisa = const Pacientes(
     id:1, nome: ' Luisa', 
     cpf: '034.567.234-45',
      email: 'luisa@gmail.com', 
      sexo: 'F', 
      telefone: '89 7643-0987', 
      id_Agenda: 1);

  var jessica_vaz = const Pacientes(
     id:2, nome: ' Jessica Vaz', 
     cpf: '034.567.234-09',
      email: 'jessik@gmail.com', 
      sexo: 'F', 
      telefone: '76 9876-7653', 
      id_Agenda: 2);
  
  var manuela_alves = const Pacientes(
     id:3, nome: ' Manuela Alves', 
     cpf: '987.321.345-22',
      email: 'manuela@gmail.com', 
      sexo: 'M', 
      telefone: '89 3423-245', 
      id_Agenda: 3);

  
  Banco_Dados.instance.Adicionar_Pacientes(Pacientes, luisa);
  Banco_Dados.instance.Adicionar_Pacientes(Pacientes, jessica_vaz);
  Banco_Dados.instance.Adicionar_Pacientes(Pacientes, manuela_alves);
  
  print(await Banco_Dados.instance.ListaPacientes());


  var manuela_alves2 = const Pacientes(
     id:3, nome: ' Manuela Alves', 
     cpf: '987.321.345-22',
      email: 'manuela@gmail.com', 
      sexo: 'F', 
      telefone: '89 3423-245', 
      id_Agenda: 3);

  await Banco_Dados.instance.AtualizarPacientes(manuela_alves2);
  print(await Banco_Dados.instance.ListaPacientes());

  await Banco_Dados.instance.ApagarEspecialidade(4);
  print(await Banco_Dados.instance.ListaEspecialidade());



}

