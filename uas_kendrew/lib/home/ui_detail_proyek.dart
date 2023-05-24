// ignore_for_file: todo
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uas_kendrew/home/service_home.dart';
import 'package:uas_kendrew/home/ui_buatjadwal.dart';
import 'package:uas_kendrew/home/ui_readjadwal.dart';
import 'package:uas_kendrew/laporan/ui_laporan.dart';
import 'package:uas_kendrew/laporan/ui_laporanvendor.dart';
import 'package:uas_kendrew/themes/colors.dart';
import 'package:uas_kendrew/vendor/ui_vendor.dart';

import '../global_var.dart';
import '../themes/floatingactionwidget.dart';

int angkacek = 1;

int _jumlahLantai = 0;
int _luasTanah = 0;
String _penanggungJawab = "";

class DetailPage extends StatefulWidget {
  final String uid;
  final String namaProyek;
  const DetailPage({
    Key? key,
    required this.uid,
    required this.namaProyek,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  HomeService homeService = HomeService();

  @override
  void initState() {
    // TODO: implement initState

    _getDetail(widget.uid).whenComplete(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future _getDetail(uid) async {
    var response = await homeService.readDetailProject(uid);
    if (response[0] != 404) {
      for (var element in response[2]) {
        _jumlahLantai = int.parse("${element['jumlah_lantai']}");
        _luasTanah = int.parse("${element['luas_tanah']}");
        _penanggungJawab = "${element['penangung_jawab']}";
        angkacek = int.parse("${element['status_penawaran']}");
      }
    } else {
      throw "Gagal Mengambil Data";
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
                const SizedBox(width: 10),
                Text(
                  widget.namaProyek,
                  style: GoogleFonts.notoSans(
                    color: darkText,
                    fontWeight: FontWeight.w400,
                    fontSize: 28,
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(50, 25, 50, 25),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Visibility(
                          visible: userStatus != 3 ? true : false,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                      color: cardColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.people_alt),
                                      const SizedBox(width: 15),
                                      Text(
                                        "Tagihan",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: userStatus != 3 ? true : false,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                      color: cardColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.people_alt),
                                      const SizedBox(width: 15),
                                      Text(
                                        "Budgeting",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: userStatus != 3 ? true : false,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VendorPage(
                                        uid: widget.uid,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                      color: cardColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.people_alt),
                                      const SizedBox(width: 15),
                                      Text(
                                        "Vendor",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: true,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LaporanVendorPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                      color: cardColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.people_alt),
                                      const SizedBox(width: 15),
                                      Text(
                                        "Laporan Vendor",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: userStatus != 3 ? true : false,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                      color: cardColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.people_alt),
                                      const SizedBox(width: 15),
                                      Text(
                                        "Analisa",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: userStatus != 3 ? true : false,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                      color: cardColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.people_alt),
                                      const SizedBox(width: 15),
                                      Text(
                                        "Penawaran",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: userStatus != 2 ? true : false,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ReadJadwalPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                      color: cardColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.people_alt),
                                      const SizedBox(width: 15),
                                      Text(
                                        "Jadwal",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: userStatus != 2 ? true : false,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LaporanPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                      color: cardColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.people_alt),
                                      const SizedBox(width: 15),
                                      Text(
                                        "Laporan",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          decoration: const BoxDecoration(
                              color: buttonColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(360),
                                  ),
                                ),
                                child: Image.asset(
                                    "lib/assets/images/defaultprofile.png"),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                widget.namaProyek,
                                style: GoogleFonts.notoSans(
                                  color: lightText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: buttonColor,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Informasi Proyek",
                                style: GoogleFonts.notoSans(
                                  color: darkText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jumlah Lantai",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Luas Tanah",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Penanggung Jawab",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 55),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ": $_jumlahLantai",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        ": $_luasTanah",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        ": $_penanggungJawab",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Visibility(
                visible: angkacek == 0 ? true : false,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(17),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BuatPenawaranPage(uid: widget.uid),
                      ),
                    );
                  },
                  child: Text(
                    "Buat Penawaran",
                    style: GoogleFonts.notoSans(
                      color: lightText,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: angkacek == 1 ? true : false,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(17),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JadwalPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Buat Jadwal",
                    style: GoogleFonts.notoSans(
                      color: lightText,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: angkacek == 2 ? true : false,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(17),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      angkacek == 0;
                    });
                  },
                  child: Text(
                    "Edit Jadwal",
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
    );
  }
}

class BuatPenawaranPage extends StatefulWidget {
  final String uid;
  const BuatPenawaranPage({
    super.key,
    required this.uid,
  });

  @override
  State<BuatPenawaranPage> createState() => _BuatPenawaranPageState();
}

class _BuatPenawaranPageState extends State<BuatPenawaranPage> {
  HomeService homeService = HomeService();

  final controllerKodeSurat = TextEditingController();
  final controllerNamaPerusahaan = TextEditingController();
  final controllerAlamatPerusahaan = TextEditingController();

  DateTime datePenawaran = DateTime.now();
  final datePenawaranStr = TextEditingController();

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

  Future inputHeaderPenawaran(context, idProyek, kodeSurat, tanggalDibuat,
      namaPerusahaan, alamatPerusahaan) async {
    var response = await homeService.inputHeaderPenawaran(
        idProyek,
        kodeSurat.text,
        tanggalDibuat.text,
        namaPerusahaan.text,
        alamatPerusahaan.text);
    if (response[0] == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BuatPenawaran2Page(uid: widget.uid),
        ),
      );
    } else {
      debugPrint("${response[0]}");
    }
  }

  Future inputPenawaran(context, idProyek, judul, subPekerjaan, keterangan,
      jumlah, satuan, harga, total) async {
    var response = await homeService.inputPenawaran(idProyek, judul,
        subPekerjaan, keterangan, jumlah, satuan, harga, total);
    if (response[0] == 200) {
      Navigator.pop(context);
    } else {
      debugPrint("${response[0]}");
    }
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

  TextFieldYa2(controller) {
    return TextField(
      readOnly: false,
      controller: controller,
      keyboardType: TextInputType.number,
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
                              "Masukkan Kode Surat",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa2(controllerKodeSurat),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Penawaran",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            textFieldDate(datePenawaranStr, () {
                              selectDatetime(
                                      context, datePenawaran, datePenawaranStr)
                                  .whenComplete(() => setState(() {}));
                            })
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
                              "Masukkan Nama Perusahaan",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa(controllerNamaPerusahaan),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Alamat Perusahaan",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa(controllerAlamatPerusahaan),
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
                        inputHeaderPenawaran(
                            context,
                            widget.uid,
                            controllerKodeSurat,
                            datePenawaranStr,
                            controllerNamaPerusahaan,
                            controllerAlamatPerusahaan);
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

class BuatPenawaran2Page extends StatefulWidget {
  final String uid;
  const BuatPenawaran2Page({
    super.key,
    required this.uid,
  });

  @override
  State<BuatPenawaran2Page> createState() => _BuatPenawaran2PageState();
}

class _BuatPenawaran2PageState extends State<BuatPenawaran2Page> {
  HomeService homeService = HomeService();
  late Future headerPenawaran;
  late Future childPenawaran;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    headerPenawaran = homeService.readHeaderPenawaran(widget.uid);
    childPenawaran = homeService.readPenawaran(widget.uid);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  DateTime datePenawaran = DateTime.now();
  final datePenawaranStr = TextEditingController();

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

  _showEditPenawaran(dw, dh) {
    showDialog(
      barrierDismissible: false,
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  controller: ScrollController(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Edit Penawaran",
                              style: GoogleFonts.notoSans(
                                color: darkText,
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          height: 20,
                          color: darkText,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nama Sub Judul",
                                          style: GoogleFonts.notoSans(
                                            fontSize: 15,
                                            color: darkText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextFieldYa(),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Jumlah",
                                          style: GoogleFonts.notoSans(
                                            fontSize: 15,
                                            color: darkText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextFieldYa(),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Harga",
                                          style: GoogleFonts.notoSans(
                                            fontSize: 15,
                                            color: darkText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextFieldYa(),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Satuan",
                                          style: GoogleFonts.notoSans(
                                            fontSize: 15,
                                            color: darkText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextFieldYa(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 40),
                                  ElevatedButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 55, vertical: 22),
                                      backgroundColor: navButtonThird,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Submit",
                                      style: GoogleFonts.notoSans(
                                        color: lightText,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: lightText,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 55, vertical: 22),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      side: const BorderSide(
                                          width: 1, // the thickness
                                          color:
                                              colorThird // the color of the border
                                          ),
                                    ),
                                    child: Text(
                                      "Batal",
                                      style: GoogleFonts.notoSans(
                                        color: colorThird,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      setState(() {});
    });
  }

  _showEditHeader(dw, dh) {
    showDialog(
      barrierDismissible: false,
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  controller: ScrollController(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Edit Header Penawaran",
                              style: GoogleFonts.notoSans(
                                color: darkText,
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          height: 20,
                          color: darkText,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Kode Surat",
                                          style: GoogleFonts.notoSans(
                                            fontSize: 15,
                                            color: darkText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextFieldYa(),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Tanggal Penawaran",
                                          style: GoogleFonts.notoSans(
                                            fontSize: 15,
                                            color: darkText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nama Perusahaan",
                                          style: GoogleFonts.notoSans(
                                            fontSize: 15,
                                            color: darkText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextFieldYa(),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Alamat Perusahaan",
                                          style: GoogleFonts.notoSans(
                                            fontSize: 15,
                                            color: darkText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextFieldYa(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 40),
                                  ElevatedButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 55, vertical: 22),
                                      backgroundColor: navButtonThird,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Submit",
                                      style: GoogleFonts.notoSans(
                                        color: lightText,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: lightText,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 55, vertical: 22),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      side: const BorderSide(
                                          width: 1, // the thickness
                                          color:
                                              colorThird // the color of the border
                                          ),
                                    ),
                                    child: Text(
                                      "Batal",
                                      style: GoogleFonts.notoSans(
                                        color: colorThird,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      setState(() {});
    });
  }

  TextFieldYa() {
    return TextField(
      readOnly: false,
      // controller:
      //     _controllerJumlahBarangTambahPenjualan,
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
        child: Text(
          value1,
          style: GoogleFonts.notoSans(
            color: darkText,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Future updateStatusPenawaran(context, idProyek) async {
    var response = await homeService.updateStatusPenawaran(idProyek);
    if (response[0] == 200) {
      Navigator.pop(context);
    } else {
      debugPrint("Gagal");
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: FutureBuilder(
                    future: headerPenawaran,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List snapData = snapshot.data! as List;
                        if (snapData[0] != 404) {
                          return Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Kode Surat",
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Tanggal Penawaran",
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Nama Perusahaan",
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Alamat Perusahaan",
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 55),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ": ${snapData[2][0]['kode_surat']}",
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    ": ${snapData[2][0]['tanggal_dibuat']}",
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    ": ${snapData[2][0]['nama_perusahaan']}",
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    ": ${snapData[2][0]['alamat_perusahaan']}",
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 55),
                              GestureDetector(
                                onTap: () {
                                  _showEditHeader(deviceWidth, deviceHeight);
                                },
                                child: const Icon(Icons.edit),
                              )
                            ],
                          );
                        } else {
                          return const Center(
                            child: Text("No Header Found"),
                          );
                        }
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Expanded(
                  flex: 3,
                  child: FutureBuilder(
                    future: childPenawaran,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List snapData = snapshot.data! as List;
                        if (snapData[0] != 404) {
                          return ListView.builder(
                            shrinkWrap: true,
                            controller: ScrollController(),
                            physics: const ClampingScrollPhysics(),
                            itemCount: snapData[2].length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapData[2][index]['judul'],
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SingleChildScrollView(
                                          physics:
                                              const ClampingScrollPhysics(),
                                          controller: ScrollController(),
                                          scrollDirection: Axis.horizontal,
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                                minWidth: deviceWidth),
                                            child: DataTable(
                                              border: TableBorder.all(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                style: BorderStyle.solid,
                                              ),
                                              headingRowHeight: 50,
                                              dataRowHeight: 50,
                                              columns: [
                                                datCol("Nama Sub Pekerjaan"),
                                                datCol("Jumlah"),
                                                datCol("Harga"),
                                                datCol("Satuan"),
                                                datCol("Sub Total"),
                                                datCol("Keterangan"),
                                              ],
                                              rows: List.generate(
                                                snapData[2][index]
                                                        ['id_sub_pekerjaan']
                                                    .length,
                                                (indexItem) {
                                                  return DataRow(
                                                    cells: [
                                                      datRow1(
                                                          "${snapData[2][index]['sub_pekerjaan'][indexItem]}"),
                                                      datRow1(
                                                          "${snapData[2][index]['jumlah'][indexItem]}"),
                                                      datRow1(
                                                          "${snapData[2][index]['harga'][indexItem]}"),
                                                      datRow1(
                                                          "${snapData[2][index]['satuan'][indexItem]}"),
                                                      datRow1(
                                                          "${snapData[2][index]['total'][indexItem]}"),
                                                      datRow1(
                                                          "${snapData[2][index]['keterangan'][indexItem]}"),
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
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                            bottom: BorderSide(
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                            right: BorderSide(
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                            horizontalInside: BorderSide(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                style: BorderStyle.solid)),
                                        headingRowHeight: 50,
                                        dataRowHeight: 50,
                                        columns: [
                                          datCol(""),
                                        ],
                                        rows: List.generate(
                                          snapData[2][index]['id_sub_pekerjaan']
                                              .length,
                                          (index) {
                                            return DataRow(
                                              cells: [
                                                DataCell(
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          _showEditPenawaran(
                                                              deviceWidth,
                                                              deviceHeight);
                                                        },
                                                        child: Container(
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: darkText,
                                                                width: 0.4,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          height: 40,
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons.edit,
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
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Total: ",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "${snapData[2][index]['sub_total']}",
                                        style: GoogleFonts.notoSans(
                                          color: darkText,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text("No data found"),
                          );
                        }
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 80),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(30, 17, 30, 17),
                            backgroundColor: buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Generate PDF",
                            style: GoogleFonts.notoSans(
                              color: lightText,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(30, 17, 30, 17),
                            backgroundColor: buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BuatPenawaran3Page(uid: widget.uid),
                              ),
                            ).whenComplete(() {
                              headerPenawaran =
                                  homeService.readHeaderPenawaran(widget.uid);
                              childPenawaran =
                                  homeService.readPenawaran(widget.uid);
                            });
                          },
                          child: Text(
                            "Tambah Pekerjaan",
                            style: GoogleFonts.notoSans(
                              color: lightText,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(30, 17, 30, 17),
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        updateStatusPenawaran(context, widget.uid);
                      },
                      child: Text(
                        "Disetujui",
                        style: GoogleFonts.notoSans(
                          color: lightText,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class BuatPenawaran3Page extends StatefulWidget {
  final String uid;
  const BuatPenawaran3Page({
    super.key,
    required this.uid,
  });

  @override
  State<BuatPenawaran3Page> createState() => _BuatPenawaran3PageState();
}

class _BuatPenawaran3PageState extends State<BuatPenawaran3Page> {
  HomeService homeService = HomeService();
  final controllerJudulPekerjaan = TextEditingController();

  final controllerNamaSubJudul = TextEditingController();
  final controllerJumlah = TextEditingController();
  final controllerHarga = TextEditingController();
  final controllerSatuan = TextEditingController();
  List listPekerjaan = List.empty(growable: true);
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

  _showTambahPenawaran(dw, dh) {
    List tempList = [];
    showDialog(
      barrierDismissible: false,
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  controller: ScrollController(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Tambah Penawaran",
                              style: GoogleFonts.notoSans(
                                color: darkText,
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          height: 20,
                          color: darkText,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nama Sub Judul",
                                          style: GoogleFonts.notoSans(
                                            fontSize: 15,
                                            color: darkText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextFieldYa(controllerNamaSubJudul),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Jumlah",
                                          style: GoogleFonts.notoSans(
                                            fontSize: 15,
                                            color: darkText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextFieldYa(controllerJumlah),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Harga",
                                          style: GoogleFonts.notoSans(
                                            fontSize: 15,
                                            color: darkText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextFieldYa(controllerHarga),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Satuan",
                                          style: GoogleFonts.notoSans(
                                            fontSize: 15,
                                            color: darkText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        TextFieldYa(controllerSatuan),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 40),
                                  ElevatedButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 55, vertical: 22),
                                      backgroundColor: navButtonThird,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    onPressed: () {
                                      var total = double.parse(
                                              controllerJumlah.text) *
                                          double.parse(controllerHarga.text);
                                      tempList = [
                                        controllerNamaSubJudul.text,
                                        controllerJumlah.text,
                                        controllerHarga.text,
                                        controllerSatuan.text,
                                        total.toString()
                                      ];
                                      listPekerjaan.add(tempList);
                                      controllerNamaSubJudul.clear();
                                      controllerJumlah.clear();
                                      controllerHarga.clear();
                                      controllerSatuan.clear();
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Submit",
                                      style: GoogleFonts.notoSans(
                                        color: lightText,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: lightText,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 55, vertical: 22),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      side: const BorderSide(
                                          width: 1, // the thickness
                                          color:
                                              colorThird // the color of the border
                                          ),
                                    ),
                                    child: Text(
                                      "Batal",
                                      style: GoogleFonts.notoSans(
                                        color: colorThird,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      setState(() {});
    });
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
        child: Text(
          value1,
          style: GoogleFonts.notoSans(
            color: darkText,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Future postPenawaran(context, uid, judul, listPekerjaan) async {
    String subPekerjaan = "";
    String jumlah = "";
    String satuan = "";
    String harga = "";
    String total = "";
    String keterangan = "";
     for (var element in listPekerjaan) {
      subPekerjaan += "|${element[0]}|";
      jumlah += "|${element[1]}|";
      harga += "|${element[2]}|";
      satuan += "|${element[3]}|";
      total += "|${element[4]}|";
      keterangan += "|ket|";
    }
    debugPrint(
        "Sub Pekerjaan: $subPekerjaan\nJumlah: $jumlah\nHarga: $harga\nSatuan: $satuan\nTotal: $total\nKeterangan: $keterangan\n");

    var response = await homeService.inputPenawaran(uid, judul.text,
        subPekerjaan, keterangan, jumlah, satuan, harga, total);
    if (response[0] == 200) {
      Navigator.pop(context);
    } else {
      debugPrint("Gagal");
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
            padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Masukkan Judul Pekerjaan",
                  style: GoogleFonts.notoSans(
                    color: darkText,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: deviceWidth / 2,
                  child: TextField(
                    readOnly: false,
                    controller: controllerJudulPekerjaan,
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
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
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
                const SizedBox(height: 40),
                Text(
                  "Masukkan Sub Pekerjaan",
                  style: GoogleFonts.notoSans(
                    color: darkText,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: buttonColor,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
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
                                      datCol("Nama Sub Pekerjaan"),
                                      datCol("Jumlah"),
                                      datCol("Harga"),
                                      datCol("Satuan"),
                                      datCol("Total"),
                                    ],
                                    rows: List.generate(
                                      listPekerjaan.length,
                                      (index) {
                                        return DataRow(
                                          cells: [
                                            datRow1(
                                                "${listPekerjaan[index][0]}"),
                                            datRow1(
                                                "${listPekerjaan[index][1]}"),
                                            datRow1(
                                                "${listPekerjaan[index][2]}"),
                                            datRow1(
                                                "${listPekerjaan[index][3]}"),
                                            datRow1(
                                                "${listPekerjaan[index][4]}"),
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
                                listPekerjaan.length,
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
                        const SizedBox(height: 40),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 17, 30, 17),
                              backgroundColor: buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              _showTambahPenawaran(deviceWidth, deviceHeight);
                            },
                            child: Text(
                              "Tambah",
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
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(30, 17, 30, 17),
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      postPenawaran(context, widget.uid,
                          controllerJudulPekerjaan, listPekerjaan);
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
