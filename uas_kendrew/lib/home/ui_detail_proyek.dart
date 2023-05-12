// ignore_for_file: todo
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uas_kendrew/themes/colors.dart';
import 'package:uas_kendrew/vendor/ui_vendor.dart';

import '../themes/floatingactionwidget.dart';

int angkacek = 0;

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                const SizedBox(width: 10),
                Text(
                  "PT.Softindo Putra Perkasa",
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
                    SizedBox(height: 5),
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
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              Icon(Icons.people_alt),
                              SizedBox(width: 15),
                              Text(
                                "Tagihan",
                                style: GoogleFonts.notoSans(
                                  color: darkText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              Icon(Icons.people_alt),
                              SizedBox(width: 15),
                              Text(
                                "Budgeting",
                                style: GoogleFonts.notoSans(
                                  color: darkText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VendorPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                                color: cardColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Row(
                              children: [
                                Icon(Icons.people_alt),
                                SizedBox(width: 15),
                                Text(
                                  "Vendor",
                                  style: GoogleFonts.notoSans(
                                    color: darkText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              Icon(Icons.people_alt),
                              SizedBox(width: 15),
                              Text(
                                "Laporan",
                                style: GoogleFonts.notoSans(
                                  color: darkText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              Icon(Icons.people_alt),
                              SizedBox(width: 15),
                              Text(
                                "Analisa",
                                style: GoogleFonts.notoSans(
                                  color: darkText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                              SizedBox(width: 20),
                              Text(
                                "PT. Softindo Putra Perkasa",
                                style: GoogleFonts.notoSans(
                                  color: lightText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: buttonColor,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
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
                              SizedBox(height: 20),
                              Text(
                                "Lorem ipsum dolor sit amet consectetur. Quis aliquam faucibus blandit habitant. Habitant viverra ultricies enim odio proin fermentum nibh. Tempus faucibus vehicula aliquam ut morbi. Purus aliquam potenti sit gravida. Aenean gravida egestas mi enim in. Pharetra sed leo dolor morbi posuere sapien. Nulla ut faucibus purus hac quis. Risus ornare adipiscing elit augue lobortis eget volutpat imperdiet sem. At sit egestas id vel erat.",
                                style: GoogleFonts.notoSans(
                                  color: darkText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
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
                    padding: EdgeInsets.all(17),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BuatPenawaranPage(),
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
                    padding: EdgeInsets.all(17),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      angkacek == 2;
                    });
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
                    padding: EdgeInsets.all(17),
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
  const BuatPenawaranPage({super.key});

  @override
  State<BuatPenawaranPage> createState() => _BuatPenawaranPageState();
}

class _BuatPenawaranPageState extends State<BuatPenawaranPage> {
  DateTime _selectedDate1 = DateTime.now();
  String _formattedDate1 = "";
  String _date1 = "";

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

  TextFieldYa2() {
    return TextField(
      readOnly: false,
      // controller:
      //     _controllerJumlahBarangTambahPenjualan,
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

  Future<void> selectFilterDate1(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate1,
      firstDate: DateTime(DateTime.now().year - 10, 1, 1),
      lastDate: DateTime(DateTime.now().year + 10, 12, 31),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(0xff13293D),
                onPrimary: lightText,
                onSurface: darkText,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xff13293D), // button text color
                ),
              ),
            ),
            child: child!);
      },
    );
    if (picked != null && picked != _selectedDate1) {
      if (mounted) {
        _selectedDate1 = picked;
        _formattedDate1 = DateFormat('dd-MM-yyyy').format(_selectedDate1);
        _date1 = _formattedDate1;

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
                      SizedBox(height: 5),
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
                            SizedBox(height: 5),
                            TextFieldYa2(),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Tanggal Penawaran",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: darkText,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(9),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _date1,
                                      style: GoogleFonts.notoSans(
                                        color: darkText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          selectFilterDate1(context)
                                              .whenComplete(
                                                  () => setState(() {}));
                                        },
                                        child:
                                            const Icon(Icons.calendar_month)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
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
                            SizedBox(height: 5),
                            TextFieldYa(),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
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
                            SizedBox(height: 5),
                            TextFieldYa(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(30, 17, 30, 17),
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BuatPenawaran2Page(),
                          ),
                        );
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
  const BuatPenawaran2Page({super.key});

  @override
  State<BuatPenawaran2Page> createState() => _BuatPenawaran2PageState();
}

class _BuatPenawaran2PageState extends State<BuatPenawaran2Page> {
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
                            padding: EdgeInsets.all(8),
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
                                        SizedBox(height: 5),
                                        TextFieldYa(),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 15),
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
                                        SizedBox(height: 5),
                                        TextFieldYa(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
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
                                        SizedBox(height: 5),
                                        TextFieldYa(),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 15),
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
                                        SizedBox(height: 5),
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
                      SizedBox(height: 5),
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
                children: [
                  Row(
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
                          SizedBox(height: 10),
                          Text(
                            "Tanggal Penawaran",
                            style: GoogleFonts.notoSans(
                              color: darkText,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Nama Perusahaan",
                            style: GoogleFonts.notoSans(
                              color: darkText,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 10),
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
                            ": 1453",
                            style: GoogleFonts.notoSans(
                              color: darkText,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            ": 18/05/2023",
                            style: GoogleFonts.notoSans(
                              color: darkText,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            ": PT.Indah Mulia",
                            style: GoogleFonts.notoSans(
                              color: darkText,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            ": Semarang Tengah No.21",
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
                  SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nyemen",
                        style: GoogleFonts.notoSans(
                          color: darkText,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
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
                                    rows: List.generate(3, (index) {
                                      return DataRow(cells: [
                                        datRow1("fwfawgawgagaha"),
                                        datRow1("100"),
                                        datRow1("10000"),
                                        datRow1("kg"),
                                        datRow1("100000"),
                                      ]);
                                    })),
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
                              3,
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
                                              _showEditPenawaran(
                                                  deviceWidth, deviceHeight);
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
                    ],
                  ),
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(30, 17, 30, 17),
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
                      SizedBox(width: 15),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(30, 17, 30, 17),
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BuatPenawaran3Page(),
                            ),
                          );
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
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class BuatPenawaran3Page extends StatefulWidget {
  const BuatPenawaran3Page({super.key});

  @override
  State<BuatPenawaran3Page> createState() => _BuatPenawaran3PageState();
}

class _BuatPenawaran3PageState extends State<BuatPenawaran3Page> {
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
                            padding: EdgeInsets.all(8),
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
                                        SizedBox(height: 5),
                                        TextFieldYa(),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 15),
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
                                        SizedBox(height: 5),
                                        TextFieldYa(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
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
                                        SizedBox(height: 5),
                                        TextFieldYa(),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 15),
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
                                        SizedBox(height: 5),
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
                      SizedBox(height: 5),
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
                  SizedBox(height: 10),
                  SizedBox(
                    width: deviceWidth / 2,
                    child: TextField(
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
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: buttonColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
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
                                        rows: List.generate(3, (index) {
                                          return DataRow(cells: [
                                            datRow1("fwfawgawgagaha"),
                                            datRow1("100"),
                                            datRow1("10000"),
                                            datRow1("kg"),
                                            datRow1("100000"),
                                          ]);
                                        })),
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
                                  3,
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
                                                        style:
                                                            BorderStyle.solid),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
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
                          SizedBox(height: 40),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.fromLTRB(30, 17, 30, 17),
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
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(30, 17, 30, 17),
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
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
