import 'dart:convert';
import 'package:http/http.dart' as http;
import '../global_var.dart';

class VendorService {
  Future inputKontrakVendor(
      idProyek,
      nomorKontrak,
      namaVendor,
      totalNilaiKontrakyek,
      jenisPekerjaanVendor,
      pekerjaanVendor,
      tanggalMulaiKontrak,
      tanggalBerakhirKontrak,
      tanggalPengiriman,
      tanggalPengerjaanDimulai,
      tanggalPengerjaanSelesai) async {
    var url = Uri.parse("$apiPath/kv/input-kv");
    final response = await http.post(url, body: {
      'id_proyek': idProyek,
      'nomor_kontrak': nomorKontrak,
      'nama_vendor': namaVendor,
      'total_nilai_kontrak': totalNilaiKontrakyek,
      'jenis_pekerjaan_vendor': jenisPekerjaanVendor,
      'pekerjaan_vendor': pekerjaanVendor,
      'tanggal_mulai_kontrak': tanggalMulaiKontrak,
      'tanggal_berakhir_kontrak': tanggalBerakhirKontrak,
      'tanggal_pengiriman': tanggalPengiriman,
      'tanggal_pengerjaan_dimulai': tanggalPengerjaanDimulai,
      'tanggal_pengerjaan_selesai': tanggalPengerjaanSelesai,
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

  Future readPembayaranVendor(uid) async {
    var url = Uri.parse("$apiPath/pv/read-pv?id_kontrak=$uid");
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

  Future inputPembayaranVendor(idKontrak, nomorInvoice, jumlahPembayaran, tanggalPembayaran) async {
    var url = Uri.parse("$apiPath/pv/input-pv");
    final response = await http.post(url, body: {
      'id_kontrak': idKontrak,
      'nomor_invoice': nomorInvoice,
      'jumlah_pembayaran': jumlahPembayaran,
      'tanggal_pembayaran': tanggalPembayaran,
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
