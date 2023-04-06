import 'package:clean_project/components/task.dart';
import 'package:clean_project/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao{
  static const String tableSql = 'CREATE TABLE $_tablename'
      '($_name TEXT, '
      '$_quantity INTEGER, '
      '$_image TEXT)';

// Essa variável é criada para caso queira altera o nome da tabela futuramente ser possivel
  static const String _tablename = 'taskTAble';

// Esses são os campos da tabela
  static const String _name = 'name';
  static const String _quantity = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async {
    print('Iniciando o save');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('A tarefa não existia.');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print('A tarefa já existia.');
      return await bancoDeDados.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nome]);
    }
  }

  Future<List<Task>> findAll() async {
    print('Estamos acessando o findAll: ');
    // abrindo banco de dados
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
    await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }
  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List: ');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_quantity]);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }
  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo tarefa em Map.');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_quantity] = tarefa.quantidade;
    mapaDeTarefas[_image] = tarefa.foto;
    print('Mapa de tarefas é $mapaDeTarefas');
    return mapaDeTarefas;
  }
}

