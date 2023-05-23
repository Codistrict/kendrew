import 'dart:convert';
import 'package:http/http.dart' as http;

var _linkPath = "http://kostsoda.onthewifi.com:38600/";

class ServicesHome {
  //Home
  //TODO: Input Proyek
  Future inputProyek(
      id_user,
      nama_proyek,
      jumlah_lantai,
      luas_tanah,
      nama,) async {
    final response = await http.post(
      Uri.parse(
          "${_linkPath}pryk/input-proyek?nama_proyek=$nama_proyek&id_user=$id_user&jumlah_lantai=$jumlah_lantai&luas_tanah=$luas_tanah&nama=$nama"),
    );
    if (response.statusCode == 200) {
      var jsonRespStatus = json.decode(response.body)['status'];
      var jsonRespMessage = json.decode(response.body)['message'];
      return [jsonRespStatus, jsonRespMessage];
    } else {
      throw Exception("Gagal mengambil data");
    }
  }

  //TODO: Get Proyek
  Future getProyek() async {
    final response = await http.get(
      Uri.parse("${_linkPath}pryk/Read-Nama"),
    );
    if (response.statusCode == 200) {
      var jsonRespStatus = json.decode(response.body)['status'];
      var jsonRespData = json.decode(response.body)['data'];
      return [jsonRespStatus, jsonRespData];
    } else {
      throw Exception("Gagal mengambil data");
    }
  }

  //TODO: Get Detail Proyek
  Future getDetailProyek(id_proyek) async {
    final response = await http.get(
      Uri.parse("${_linkPath}pryk/Read-proyek?id_proyek=$id_proyek"),
    );
    if (response.statusCode == 200) {
      var jsonRespStatus = json.decode(response.body)['status'];
      var jsonRespData = json.decode(response.body)['data'];
      return [jsonRespStatus, jsonRespData];
    } else {
      throw Exception("Gagal mengambil data");
    }
  }
}