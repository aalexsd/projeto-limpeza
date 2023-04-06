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

}

