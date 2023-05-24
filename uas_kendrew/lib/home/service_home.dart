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

  Future inputHeaderPenawaran(idProyek, kodeSurat, tanggalDubuat,
      namaPerusahaan, alamatPerusahaan) async {
    var url = Uri.parse("$apiPath/ph/input-ph");
    final response = await http.post(url, body: {
      'id_proyek': idProyek,
      'kode_surat': kodeSurat,
      'id_header_penawaran': tanggalDubuat,
      'nama_perusahaan': namaPerusahaan,
      'alamat_perusahaan': alamatPerusahaan,
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

  Future readHeaderPenawaran(idProyek) async {
    var url = Uri.parse("$apiPath/ph/read-ph?id_proyek=$idProyek");
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

  Future inputPenawaran(idProyek, judul, subPekerjaan, keterangan, jumlah,
      satuan, harga, total) async {
    var url = Uri.parse("$apiPath/pen/input-pen");
    final response = await http.post(url, body: {
      'id_proyek': idProyek,
      'judul': judul,
      'sub_pekerjaan': subPekerjaan,
      'keterangan': keterangan,
      'jumlah': jumlah,
      'satuan': satuan,
      'harga': harga,
      'total': total,
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

  Future readPenawaran(idProyek) async {
    var url = Uri.parse("$apiPath/pen/read-pen?id_proyek=$idProyek");
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

  Future updateStatusPenawaran(idProyek) async {
    var url = Uri.parse("$apiPath/pen/update-status");
    final response = await http.put(url, body: {
      'id_proyek': idProyek,
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

  Future readJudulPenawaran(idProyek) async {
    var url =
        Uri.parse("$apiPath/PJDL/read-judul-penawaran?id_proyek=$idProyek");
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

  Future readTaskPenawaran(idProyek, idPenawaran) async {
    var url = Uri.parse(
        "$apiPath/PJDL/read-task?id_proyek=$idProyek&id_penawaran=$idPenawaran");
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

  Future inputDepedentcies(idPenjadwalan, depedentcies) async {
    var url = Uri.parse("$apiPath/PJDL/input-depedentcies");
    final response = await http.put(url, body: {
      'id_jadwal': idPenjadwalan,
      'depedentcies': depedentcies,
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

  Future inputTaskPenawaran(idPenjadwalan, ipProyek, namaTask, waktuOptimis,
      waktuPesimis, waktuRealistis) async {
    var url = Uri.parse("$apiPath/PJDL/input-task-penjadwalan");
    final response = await http.post(url, body: {
      'id_penawaran': idPenjadwalan,
      'id_proyek': ipProyek,
      'nama_task': namaTask,
      'waktu_optimis': waktuOptimis,
      'waktu_pesimis': waktuPesimis,
      'waktu_realistis': waktuRealistis,
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

  Future readDep(ipProyeks) async {
    var url = Uri.parse("$apiPath/PJDL/read-dep?id_proyek=$ipProyeks");
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

  Future generateJadwal(ipProyeks) async {
    var url = Uri.parse("$apiPath/PJDL/generate-jadwal?id_proyek=$ipProyeks");
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
