import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inchallahlist/models/task.dart';
import 'package:inchallahlist/utils/util.dart';

class TaskApi {
  static Future<http.Response> createTask(String task) async {
    var response;

    await getToken().then((token) async {
      // 1 url
      var url = Uri.parse('https://api-nodejs-todolist.herokuapp.com/task');
      // 2 headers
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      // 3 body
      var body = {
        "description": task,
      };
      // 4 method type (POST or GET)
      response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
    });
    return response;
  }

  static Future<List<Task>> getAllTasks() async {
    http.Response response;
    List<Task> tasks = [];

    await getToken().then((token) async {
      // 1 url
      var url = Uri.parse('https://api-nodejs-todolist.herokuapp.com/task');
      // 2 headers
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      // 3 method type (POST or GET)
      response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);

        for (Map myJosn in body['data']) {
          Task myTaskConverted = Task.fromJson(myJosn);
          tasks.add(myTaskConverted);
        }
      }
    });
    return tasks;
  }
}
