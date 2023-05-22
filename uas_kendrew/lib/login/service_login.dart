import 'dart:convert';
import 'package:http/http.dart' as http;
import '../global_var.dart';

class AuthService {
  // Login
  Future login(username, password) async {
    var url = Uri.parse(
        "$apiPath/um/login-user?username=$username&password=$password");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      var message = json.decode(response.body)['message'];
      var body = json.decode(response.body)['data'];
      return [status, message, body];
    } else {
      return "Couldn't connect to the server, failed to fetch API!";
    }
  }
}
