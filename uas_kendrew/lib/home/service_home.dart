import 'dart:convert';
import 'package:http/http.dart' as http;
import '../global_var.dart';

class HomeService {
  // Create Project
  Future createProject(
      userID, namaProyek, jumlahLantai, luasTanah, penanggungJawab) async {
    var url = Uri.parse("$apiPath/pryk/input-proyek");
    final response = await http.post(url, body: {
      'id_user': userID,
      'nama_proyek': namaProyek,
      'jumlah_lantai': jumlahLantai,
      'luas_tanah': luasTanah,
      'nama': penanggungJawab,
    });
    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      var message = json.decode(response.body)['message'];
      var body = json.decode(response.body)['data'];
      return [status, message, body];
    } else {
      return "Couldn't connect to the server, failed to fetch API!";
    }
  }

  // Read Project
  Future readProject() async {
    var url = Uri.parse("$apiPath/pryk/Read-Nama");
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

  // Read Detail Project
  Future readDetailProject(uid) async {
    var url = Uri.parse("$apiPath/pryk/Read-proyek?id_proyek=$uid");
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

  // Finish Project
  Future finishProject(projectID) async {
    var url = Uri.parse("$apiPath/pryk/finish-proyek");
    final response = await http.put(url, body: {
      'id_proyek': projectID,
    });
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
