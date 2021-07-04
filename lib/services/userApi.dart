import 'dart:convert';

import 'package:http/http.dart' as http;

class UserAPi {
  static Future<http.Response> login(String email, String password) async {
    //// REQUEST ////
    // 1 url
    var url = Uri.parse('https://api-nodejs-todolist.herokuapp.com/user/login');
    // 2 headers
    var headers = {'Content-Type': 'application/json'};
    // 3 body
    var body = {
      "email": email,
      "password": password,
    };
    // 4 method type (POST or GET)
    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    //// RESPONSE ////
    //response.body
    //response.statusCode
    return response;
  }

  static Future<http.Response> register(
      String email, String password, String username) async {
    var headers = {'Content-Type': 'application/json'};
    var url =
        Uri.parse('https://api-nodejs-todolist.herokuapp.com/user/register');
    var body = {
      "name": username,
      "email": email,
      "password": password,
      "age": 99
    };

    var reponse = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );
    return reponse;
  }
}
