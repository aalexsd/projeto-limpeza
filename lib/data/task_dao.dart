import 'package:clean_project/components/task.dart';
import 'package:clean_project/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao{
  static const String tableSql = 'CREATE TABLE $_tablename'
      '($_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

// Essa variável é criada para caso queira altera o nome da tabela futuramente ser possivel
  static const String _tablename = 'taskTAble';

// Esses são os campos da tabela
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  Future<List<Task>> findAll() async {
    print('Estamos acessando o findAll: ');
    // abrindo banco de dados
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
    await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List: ');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }

}

