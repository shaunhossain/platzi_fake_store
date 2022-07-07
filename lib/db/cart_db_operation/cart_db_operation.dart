import 'dart:developer';

class CartDbOperation{
  CartDbOperation._privateConstructor();

  static final CartDbOperation instance =  CartDbOperation._privateConstructor();

// Future<List<Todo>> getTodosList({required int status}) async {
//   final db = await DatabaseHelper.instance.database;
//   var todos = await db.query('todoTable',where: 'status =?', whereArgs: [status]);
//   List<Todo> todosList = todos.isNotEmpty
//       ? todos.map((c)=> Todo.fromJson(c)).toList()
//       : [];
//   return todosList;
// }
//
// Future <int> add(Todo todo) async {
//   final db = await DatabaseHelper.instance.database;
//   return await db.insert('todoTable',todo.toJson());
// }
//
// Future<int> remove(int id) async {
//   final db = await DatabaseHelper.instance.database;
//   return await db.delete('todoTable',where: 'id = ?', whereArgs: [id]);
// }
//
// Future<int> update(Todo todo) async{
//   log('update called');
//   final db = await DatabaseHelper.instance.database;
//   return db.update('todoTable',todo.toJson(),where: 'id =?',whereArgs: [todo.id]);
// }
//
// Future<Todo?> getSingleTodo(int id) async{
//   final db = await DatabaseHelper.instance.database;
//   List<Map> maps = await db.query('todoTable',
//       where: 'id = ?',
//       whereArgs: [id]);
//   if (maps.length > 0) {
//     return Todo.fromJson(maps.first);
//   }
//   return null;
// }
}