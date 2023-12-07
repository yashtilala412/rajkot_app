import 'dart:convert';
import 'package:http/http.dart' as http;

class APICalls {
  static addTodo() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://rapidapi.com/apidojo/api/yummly2'));
    request.body = json
        .encode({"id": DateTime.now().microsecondsSinceEpoch, "task": "task"});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static fetchTodos() async {
    http.Response responce =
        await http.get(Uri.parse("https://rapidapi.com/apidojo/api/yummly2"));
    if (responce.statusCode == 200) {
      print(responce.body);
    }
  }

  static updateTodo(int id, bool isCompleted) async {
    var headers = {'Content-Type': 'application/json'};
    http.Response response = await http.put(
        Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/$id'),
        body: json.encode({"completed": isCompleted}),
        headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
    }
  }

  static deleteTodo(int id) async {
    http.Response responce = await http
        .delete(Uri.parse("https://node-todo-api-yjo3.onrender.com/todos/$id"));
    if (responce.statusCode == 200) {
      print(responce.body);
    }
  }
}
