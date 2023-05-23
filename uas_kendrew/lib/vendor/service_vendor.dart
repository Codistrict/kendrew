import 'dart:convert';
import 'package:http/http.dart' as http;
import '../global_var.dart';

class VendorService {
  Future readKontrakVendor(uid) async {
    var url = Uri.parse("$apiPath/kv/read-kv?id_proyek=$uid");
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

  Future deleteKontrakVendor(uid) async {
    var url = Uri.parse("$apiPath/kv/delete-kontrak");
    final response = await http.delete(url, body: {
      'id_proyek': uid,
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
