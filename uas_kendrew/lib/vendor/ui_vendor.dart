// ignore_for_file: todo
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uas_kendrew/themes/colors.dart';

import '../themes/floatingactionwidget.dart';
import 'service_vendor.dart';

int angkacek = 0;

class VendorPage extends StatefulWidget {
  final String uid;
  const VendorPage({
    super.key,
    required this.uid,
  });

  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  VendorService vendorService = VendorService();
  late Future futureReadKV;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureReadKV = vendorService.readKontrakVendor(widget.uid);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  datCol(value) {
    return DataColumn(
      label: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                value,
                style: GoogleFonts.notoSans(
                  color: darkText,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  datRow1(
    value1,
  ) {
    return DataCell(
      GestureDetector(
        child: Center(
          child: Text(
            value1,
            style: GoogleFonts.notoSans(
              color: darkText,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Future deleteKontrakVendor(context, uid) async {
    var response = await vendorService.deleteKontrakVendor(uid);
    if (response[0] == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response[1],
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      );
      futureReadKV = await vendorService.readKontrakVendor(widget.uid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response[1],
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BuatVendorPage(
                uid: widget.uid,
              ),
            ),
          ).then((value) {
            futureReadKV = vendorService
                .readKontrakVendor(widget.uid)
                .whenComplete(() => setState(() {}));
          });
          ;
        },
        backgroundColor: buttonColor,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: lightText,
        //diisi warna nek wes sesuai
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: darkText,
                    size: 50,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kendrew Tandiono",
                      style: GoogleFonts.notoSans(
                        color: darkText,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Felmel@gmail.com",
                      style: GoogleFonts.notoSans(
                        color: darkText,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 14),
                ),
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(360),
                    ),
                  ),
                  child: Image.asset("lib/assets/images/defaultprofile.png"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
              ],
            ),
          ],
        ),
        //elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Divider(
            thickness: 3,
            color: darkText,
          ),
        ),
      ),
      body: FutureBuilder(
        future: futureReadKV,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List snapData = snapshot.data! as List;
            if (snapData[0] != 404) {
              return ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            controller: ScrollController(),
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                                border: TableBorder.all(
                                  color: Colors.black.withOpacity(0.5),
                                  style: BorderStyle.solid,
                                ),
                                headingRowHeight: 50,
                                dataRowHeight: 50,
                                columns: [
                                  datCol("Id Vendor"),
                                  datCol("Nomor Kontrak"),
                                  datCol("Nama Vendor"),
                                  datCol("Total Nilai Kontrak"),
                                  datCol("Nominal Pembayaran"),
                                  datCol("Jenis Pekerjaan"),
                                  datCol("Tanggal Mulai Kontrak"),
                                  datCol("Tanggal Berakhir Kontrak"),
                                  datCol("Sisa Pembayaran"),
                                ],
                                rows:
                                    List.generate(snapData[2].length, (index) {
                                  return DataRow(cells: [
                                    datRow1(
                                        "${snapData[2][index]['id_kontak']}"),
                                    datRow1(
                                        "${snapData[2][index]['nomor_kontrak']}"),
                                    datRow1(
                                        "${snapData[2][index]['nama_vendor']}"),
                                    datRow1(
                                        "${snapData[2][index]['total_nilai_kontrak']}"),
                                    datRow1(
                                        "${snapData[2][index]['nomial_pembayaran']}"),
                                    datRow1(
                                        "${snapData[2][index]['jenis_pekerjaan']}"),
                                    datRow1(
                                        "${snapData[2][index]['tanggal_mulai_kontrak']}"),
                                    datRow1(
                                        "${snapData[2][index]['tanggal_berakhir_kontrak']}"),
                                    datRow1(
                                        "${snapData[2][index]['sisa_pembayaran']}")
                                  ]);
                                })),
                          ),
                        ),
                        DataTable(
                          border: TableBorder(
                              top: BorderSide(
                                  color: Colors.black.withOpacity(0.5)),
                              bottom: BorderSide(
                                  color: Colors.black.withOpacity(0.5)),
                              right: BorderSide(
                                  color: Colors.black.withOpacity(0.5)),
                              horizontalInside: BorderSide(
                                  color: Colors.black.withOpacity(0.5),
                                  style: BorderStyle.solid)),
                          headingRowHeight: 50,
                          dataRowHeight: 50,
                          columns: [
                            datCol(""),
                          ],
                          rows: List.generate(
                            snapData[2].length,
                            (index) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            deleteKontrakVendor(
                                                context,
                                                snapData[2][index]
                                                    ['id_kontak']);
                                          },
                                          child: Container(
                                            width: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: darkText,
                                                  width: 0.4,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            height: 40,
                                            child: const Center(
                                              child: Icon(
                                                Icons.delete,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PembayaranPage(
                                                  uid: snapData[2][index]
                                                      ['id_kontak'],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: darkText,
                                                  width: 0.4,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            height: 40,
                                            child: const Center(
                                              child: Icon(
                                                Icons.wallet,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //datRow3(2, context)
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text("No Data Found"),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class BuatVendorPage extends StatefulWidget {
  final String uid;
  const BuatVendorPage({
    super.key,
    required this.uid,
  });

  @override
  State<BuatVendorPage> createState() => _BuatVendorPageState();
}

class _BuatVendorPageState extends State<BuatVendorPage> {
  VendorService vendorService = VendorService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final controllerNoKontrak = TextEditingController();
  final controllerNamaVendor = TextEditingController();
  final controllerNilaiKontrak = TextEditingController();
  final controllerJenisPekerjaan = TextEditingController();
  final controllerPekerjaan = TextEditingController();

  DateTime dateMulaiKontrak = DateTime.now();
  final dateMulaiKontrakStr = TextEditingController();
  DateTime dateBerakhirKontrak = DateTime.now();
  final dateBerakhirKontrakStr = TextEditingController();
  DateTime dateMulaiPengerjaan = DateTime.now();
  final dateMulaiPengerjaanStr = TextEditingController();
  DateTime dateBerakhirPengerjaan = DateTime.now();
  final dateBerakhirPengerjaanStr = TextEditingController();
  DateTime datePengiriman = DateTime.now();
  final datePengirimanStr = TextEditingController();

  Future<void> selectDatetime(context, selectedDate, stringDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 10, 1, 1),
      lastDate: DateTime(DateTime.now().year + 10, 12, 31),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xff13293D),
                onPrimary: lightText,
                onSurface: darkText,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xff13293D), // button text color
                ),
              ),
            ),
            child: child!);
      },
    );
    if (picked != null && picked != selectedDate) {
      if (mounted) {
        selectedDate = picked;
        String temp = DateFormat('dd-MM-yyyy').format(selectedDate);
        stringDate.text = temp;

        setState(() {});
      }
    }
  }

  TextFieldYa(controller) {
    return TextField(
      readOnly: false,
      controller: controller,
      showCursor: true,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: lightText,
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 1.5,
            color: darkText,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
      ),
    );
  }

  textFieldDate(controller, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          showCursor: true,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: lightText,
            suffixIcon: const Icon(Icons.calendar_month),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1.5,
                color: darkText,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: darkText,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: darkText,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future inputKontrakVendor(
      context,
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
    var response = await vendorService.inputKontrakVendor(
        idProyek,
        nomorKontrak.text,
        namaVendor.text,
        totalNilaiKontrakyek.text,
        jenisPekerjaanVendor.text,
        pekerjaanVendor.text,
        tanggalMulaiKontrak.text,
        tanggalBerakhirKontrak.text,
        tanggalPengiriman.text,
        tanggalPengerjaanDimulai.text,
        tanggalPengerjaanSelesai.text);
    if (response[0] == 200) {
      Navigator.pop(context);
    } else {
      debugPrint("${response[0]}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightText,
        //diisi warna nek wes sesuai
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: darkText,
                    size: 50,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kendrew Tandiono",
                      style: GoogleFonts.notoSans(
                        color: darkText,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Felmel@gmail.com",
                      style: GoogleFonts.notoSans(
                        color: darkText,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 14),
                ),
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(360),
                    ),
                  ),
                  child: Image.asset("lib/assets/images/defaultprofile.png"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
              ],
            ),
          ],
        ),
        //elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Divider(
            thickness: 3,
            color: darkText,
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masukkan Nomor Kontrak",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFieldYa(controllerNoKontrak),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masukkan Nama Vendor",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFieldYa(controllerNamaVendor),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masukkan Total Nilai Kontrak",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFieldYa(controllerNilaiKontrak),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masukkan Pekerjaan Vendor",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFieldYa(controllerPekerjaan),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masukkan Jenis Pekerjaan",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFieldYa(controllerJenisPekerjaan),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Mulai Kontrak",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          textFieldDate(dateMulaiKontrakStr, () {
                            selectDatetime(context, dateMulaiKontrak,
                                    dateMulaiKontrakStr)
                                .whenComplete(() => setState(() {}));
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Berakhir Kontrak",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          textFieldDate(dateBerakhirKontrakStr, () {
                            selectDatetime(context, dateBerakhirKontrak,
                                    dateBerakhirKontrakStr)
                                .whenComplete(() => setState(() {}));
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Pengiriman",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          textFieldDate(datePengirimanStr, () {
                            selectDatetime(
                                    context, datePengiriman, datePengirimanStr)
                                .whenComplete(() => setState(() {}));
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Pengerjaan Dimulai",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          textFieldDate(dateMulaiPengerjaanStr, () {
                            selectDatetime(context, dateMulaiPengerjaan,
                                    dateMulaiPengerjaanStr)
                                .whenComplete(() => setState(() {}));
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Pengerjaan Selesai",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          textFieldDate(dateBerakhirPengerjaanStr, () {
                            selectDatetime(context, dateBerakhirPengerjaan,
                                    dateBerakhirPengerjaanStr)
                                .whenComplete(() => setState(() {}));
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(30, 17, 30, 17),
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      inputKontrakVendor(
                          context,
                          widget.uid,
                          controllerNoKontrak,
                          controllerNamaVendor,
                          controllerNilaiKontrak,
                          controllerJenisPekerjaan,
                          controllerPekerjaan,
                          dateMulaiKontrakStr,
                          dateBerakhirKontrakStr,
                          datePengirimanStr,
                          dateMulaiPengerjaanStr,
                          dateBerakhirPengerjaanStr);
                    },
                    child: Text(
                      "Submit",
                      style: GoogleFonts.notoSans(
                        color: lightText,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PembayaranPage extends StatefulWidget {
  final String uid;
  const PembayaranPage({
    super.key,
    required this.uid,
  });

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  VendorService vendorService = VendorService();
  late Future listPembayaran;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listPembayaran = vendorService.readPembayaranVendor(widget.uid);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  datCol(value) {
    return DataColumn(
      label: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                value,
                style: GoogleFonts.notoSans(
                  color: darkText,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  datRow1(
    value1,
  ) {
    return DataCell(
      GestureDetector(
        child: Center(
          child: Text(
            value1,
            style: GoogleFonts.notoSans(
              color: darkText,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BuatVendorPembayaranPage(uid: widget.uid),
            ),
          ).then((value) {
            listPembayaran = vendorService
                .readPembayaranVendor(widget.uid)
                .whenComplete(() => setState(() {}));
          });
        },
        backgroundColor: buttonColor,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: lightText,
        //diisi warna nek wes sesuai
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: darkText,
                    size: 50,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kendrew Tandiono",
                      style: GoogleFonts.notoSans(
                        color: darkText,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Felmel@gmail.com",
                      style: GoogleFonts.notoSans(
                        color: darkText,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 14),
                ),
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(360),
                    ),
                  ),
                  child: Image.asset("lib/assets/images/defaultprofile.png"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
              ],
            ),
          ],
        ),
        //elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Divider(
            thickness: 3,
            color: darkText,
          ),
        ),
      ),
      body: FutureBuilder(
        future: listPembayaran,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List snapData = snapshot.data! as List;
            if (snapData[0] != 404) {
              return ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse
                    }),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            controller: ScrollController(),
                            scrollDirection: Axis.horizontal,
                            child: ConstrainedBox(
                              constraints:
                                  BoxConstraints(minWidth: deviceWidth),
                              child: DataTable(
                                border: TableBorder.all(
                                  color: Colors.black.withOpacity(0.5),
                                  style: BorderStyle.solid,
                                ),
                                headingRowHeight: 50,
                                dataRowHeight: 50,
                                columns: [
                                  datCol("Id Pembayaran"),
                                  datCol("Nomor Invoice"),
                                  datCol("Tanggal Pembayaran"),
                                  datCol("Jumlah Pembayaran"),
                                  datCol("Foto"),
                                ],
                                rows: List.generate(
                                  snapData[2].length,
                                  (index) {
                                    return DataRow(
                                      cells: [
                                        datRow1(
                                            "${snapData[2][index]['id_pv']}"),
                                        datRow1(
                                            "${snapData[2][index]['nomor_invoice']}"),
                                        datRow1(
                                            "${snapData[2][index]['jumlah_pembayaran']}"),
                                        datRow1(
                                            "${snapData[2][index]['tanggal_pembayaran']}"),
                                        datRow1(
                                            "${snapData[2][index]['foto_invoice']}"),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        DataTable(
                          border: TableBorder(
                              top: BorderSide(
                                  color: Colors.black.withOpacity(0.5)),
                              bottom: BorderSide(
                                  color: Colors.black.withOpacity(0.5)),
                              right: BorderSide(
                                  color: Colors.black.withOpacity(0.5)),
                              horizontalInside: BorderSide(
                                  color: Colors.black.withOpacity(0.5),
                                  style: BorderStyle.solid)),
                          headingRowHeight: 50,
                          dataRowHeight: 50,
                          columns: [
                            datCol(""),
                          ],
                          rows: List.generate(
                            snapData[2].length,
                            (index) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: darkText,
                                                  width: 0.4,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            height: 40,
                                            child: const Center(
                                              child: Icon(
                                                Icons.delete,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ImagePembayaranPage(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: darkText,
                                                  width: 0.4,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            height: 40,
                                            child: const Center(
                                              child: Icon(
                                                Icons.add_a_photo,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //datRow3(2, context)
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text("No payment found"),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class BuatVendorPembayaranPage extends StatefulWidget {
  final String uid;
  const BuatVendorPembayaranPage({
    super.key,
    required this.uid,
  });

  @override
  State<BuatVendorPembayaranPage> createState() =>
      _BuatVendorPembayaranPageState();
}

class _BuatVendorPembayaranPageState extends State<BuatVendorPembayaranPage> {
  VendorService vendorService = VendorService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final controllerNoInvoice = TextEditingController();
  final controllerJumlahPembayaran = TextEditingController();

  DateTime dateTanggalPembayaran = DateTime.now();
  final dateTanggalPembayaranStr = TextEditingController();

  Future<void> selectDatetime(context, selectedDate, stringDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 10, 1, 1),
      lastDate: DateTime(DateTime.now().year + 10, 12, 31),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xff13293D),
                onPrimary: lightText,
                onSurface: darkText,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xff13293D), // button text color
                ),
              ),
            ),
            child: child!);
      },
    );
    if (picked != null && picked != selectedDate) {
      if (mounted) {
        selectedDate = picked;
        String temp = DateFormat('dd-MM-yyyy').format(selectedDate);
        stringDate.text = temp;

        setState(() {});
      }
    }
  }

  Future inputPembayaran(context, idKontrak, nomorInvoice, jumlahPembayaran,
      tanggalPembayaran) async {
    var response = await vendorService.inputPembayaranVendor(idKontrak,
        nomorInvoice.text, jumlahPembayaran.text, tanggalPembayaran.text);
    if (response[0] == 200) {
      Navigator.pop(context);
    } else {
      debugPrint("${response[0]}");
    }
  }

  TextFieldYa(controller) {
    return TextField(
      readOnly: false,
      controller: controller,
      showCursor: true,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: lightText,
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 1.5,
            color: darkText,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
      ),
    );
  }

  textFieldDate(controller, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          showCursor: true,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: lightText,
            suffixIcon: const Icon(Icons.calendar_month),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1.5,
                color: darkText,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: darkText,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: darkText,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightText,
          //diisi warna nek wes sesuai
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: darkText,
                      size: 50,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kendrew Tandiono",
                        style: GoogleFonts.notoSans(
                          color: darkText,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Felmel@gmail.com",
                        style: GoogleFonts.notoSans(
                          color: darkText,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 14),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(360),
                      ),
                    ),
                    child: Image.asset("lib/assets/images/defaultprofile.png"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                  ),
                ],
              ),
            ],
          ),
          //elevation: 0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: Divider(
              thickness: 3,
              color: darkText,
            ),
          ),
        ),
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nomor Invoice",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa(controllerNoInvoice),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jumlah Pembayaran",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa(controllerJumlahPembayaran),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Pembayaran",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            textFieldDate(dateTanggalPembayaranStr, () {
                              selectDatetime(context, dateTanggalPembayaran,
                                      dateTanggalPembayaranStr)
                                  .whenComplete(() => setState(() {}));
                            })
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: lightText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              readOnly: true,
                              showCursor: false,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                fillColor: lightText,
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    width: 1.5,
                                    color: lightText,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: lightText,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: lightText,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(30, 17, 30, 17),
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        inputPembayaran(
                            context,
                            widget.uid,
                            controllerNoInvoice,
                            controllerJumlahPembayaran,
                            dateTanggalPembayaranStr);
                      },
                      child: Text(
                        "Submit",
                        style: GoogleFonts.notoSans(
                          color: lightText,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ImagePembayaranPage extends StatefulWidget {
  const ImagePembayaranPage({super.key});

  @override
  State<ImagePembayaranPage> createState() => _ImagePembayaranPageState();
}

class _ImagePembayaranPageState extends State<ImagePembayaranPage> {
  File? _selectedImage;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightText,
          //diisi warna nek wes sesuai
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: darkText,
                      size: 50,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kendrew Tandiono",
                        style: GoogleFonts.notoSans(
                          color: darkText,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Felmel@gmail.com",
                        style: GoogleFonts.notoSans(
                          color: darkText,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 14),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(360),
                      ),
                    ),
                    child: Image.asset("lib/assets/images/defaultprofile.png"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                  ),
                ],
              ),
            ],
          ),
          //elevation: 0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: Divider(
              thickness: 3,
              color: darkText,
            ),
          ),
        ),
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: deviceWidth,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              width: 350,
                              height: 350,
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: _selectedImage != null
                                  ? Image.file(_selectedImage!,
                                      fit: BoxFit.cover)
                                  : const Center(
                                      child: Text('No image selected')),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(15),
                                backgroundColor: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: _pickImage,
                              child: Text(
                                "Upload Gambar",
                                style: GoogleFonts.notoSans(
                                  color: lightText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Simpan",
                      style: GoogleFonts.notoSans(
                        color: lightText,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
