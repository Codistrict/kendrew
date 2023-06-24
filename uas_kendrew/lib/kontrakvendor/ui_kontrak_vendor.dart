import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_kendrew/home/service_home.dart';
import 'package:uas_kendrew/home/ui_detail_proyek.dart';
import 'package:uas_kendrew/login/ui_login.dart';
import 'package:uas_kendrew/themes/colors.dart';

import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:uas_kendrew/vendor/ui_vendor.dart';

import '../global_var.dart';
import '../themes/floatingactionwidget.dart';

class KontrakVendorPage extends StatefulWidget {
  const KontrakVendorPage({Key? key}) : super(key: key);

  @override
  State<KontrakVendorPage> createState() => _KontrakVendorPageState();
}

class _KontrakVendorPageState extends State<KontrakVendorPage> {
  HomeService homeService = HomeService();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BuatKontrakVendorPage()));
        },
        backgroundColor: buttonColor,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: lightText,
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
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Divider(
            thickness: 3,
            color: darkText,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 15,
                    shadowColor: Colors.black87,
                    color: buttonColor,
                    child: ExpansionTile(
                      maintainState: true,
                      initiallyExpanded: false,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      expandedAlignment: Alignment.centerLeft,
                      iconColor: buttonColor,
                      collapsedIconColor: buttonColor,
                      title: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    "ID Kontrak",
                                    style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      letterSpacing: 0.125,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    "Nama Vendor",
                                    style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      letterSpacing: 0.125,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    "Total Nilai Kontrak",
                                    style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      letterSpacing: 0.125,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    "Nominal Pembayaran",
                                    style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      letterSpacing: 0.125,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    "Sisa Pembayaran",
                                    style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      letterSpacing: 0.125,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    "Sisa Pembayaran",
                                    style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      letterSpacing: 0.125,
                                      fontWeight: FontWeight.w700,
                                      color: buttonColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      controller: ScrollController(),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                          },
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          controller: ScrollController(),
                          physics: const ClampingScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: scaffoldBackgroundColor,
                                    border: Border.all(
                                      color: darkText,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: ExpansionTile(
                                  maintainState: true,
                                  initiallyExpanded: true,
                                  expandedCrossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  expandedAlignment: Alignment.centerLeft,
                                  textColor: darkText,
                                  iconColor: darkText,
                                  collapsedTextColor: darkText,
                                  collapsedIconColor: darkText,
                                  title: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Center(
                                                    child: Text(
                                                      "001",
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 15,
                                                        letterSpacing: 0.125,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: darkText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                    child: Text(
                                                      "Saga",
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 15,
                                                        letterSpacing: 0.125,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: darkText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                    child: Text(
                                                      "755.905.000",
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 15,
                                                        letterSpacing: 0.125,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: darkText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                    child: Text(
                                                      "193.976.250",
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 15,
                                                        letterSpacing: 0.125,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: darkText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                    child: Text(
                                                      "581.928.750",
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 15,
                                                        letterSpacing: 0.125,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: darkText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {},
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
                                                              Icons.delete,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        BuatPembayaranPage(),
                                                              ));
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
                                                              Icons.wallet,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  children: [
                                    Column(
                                      children: [
                                        const Divider(
                                          thickness: 1,
                                          color: darkText,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 5, 15, 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Informasi Kontrak Vendor",
                                                style: GoogleFonts.nunito(
                                                  fontSize: 25,
                                                  letterSpacing: 0.125,
                                                  fontWeight: FontWeight.w400,
                                                  color: darkText,
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Tanggal Pengiriman",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      Text(
                                                        "Tanggal Pengerjaan Dimulai",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      Text(
                                                        "Tanggal Pengerjaan Berakhir",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      Text(
                                                        "Tanggal Mulai Kontrak",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      Text(
                                                        "Tanggal Berakhir Kontrak",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 15),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        ": 12-06-2023",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      Text(
                                                        ": 25-06-2023",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      Text(
                                                        ": 30-09-2023",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      Text(
                                                        ": 05-06-2023",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      Text(
                                                        ": 07-10-2023",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 15),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuatKontrakVendorPage extends StatefulWidget {
  const BuatKontrakVendorPage({Key? key}) : super(key: key);

  @override
  State<BuatKontrakVendorPage> createState() => _BuatKontrakVendorPageState();
}

class _BuatKontrakVendorPageState extends State<BuatKontrakVendorPage> {
  HomeService homeService = HomeService();

  List<String> listVendor = List.empty(growable: true);
  String selectedIdPenawaran = "";
  final controllerNamaVendor = TextEditingController();
  final controllerTotalNilaiKontrak = TextEditingController();

  DateTime _selectedDateTglMulaiKontrak = DateTime.now();
  String _formattedDateTglMulaiKontrak = "";
  String _dateEditTglMulaiKontrak = "";

  DateTime _selectedDateTglBerakhirKontrak = DateTime.now();
  String _formattedDateTglBerakhirKontrak = "";
  String _dateEditTglBerakhirKontrak = "";

  DateTime _selectedDateTglPengiriman = DateTime.now();
  String _formattedDateTglPengiriman = "";
  String _dateEditTglPengiriman = "";

  DateTime _selectedDateTglMulaiPekerjaan = DateTime.now();
  String _formattedDateTglMulaiPekerjaan = "";
  String _dateEditTglMulaiPekerjaan = "";

  DateTime _selectedDateTglAkhirPekerjaan = DateTime.now();
  String _formattedDateTglAkhirPekerjaan = "";
  String _dateEditTglAkhirPekerjaan = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controllerNamaVendor.dispose();
    controllerTotalNilaiKontrak.dispose();
    super.dispose();
  }

  Future<void> selectFilterDateTglMulaiKontrak(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTglMulaiKontrak,
      firstDate: DateTime.now(),
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
    if (picked != null && picked != _selectedDateTglMulaiKontrak) {
      if (mounted) {
        _selectedDateTglMulaiKontrak = picked;
        _formattedDateTglMulaiKontrak =
            DateFormat('dd-MM-yyyy').format(_selectedDateTglMulaiKontrak);
        _dateEditTglMulaiKontrak = _formattedDateTglMulaiKontrak;

        setState(() {});
      }
    }
  }

  Future<void> selectFilterDateTglBerakhirKontrak(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTglBerakhirKontrak,
      firstDate: DateTime.now(),
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
    if (picked != null && picked != _selectedDateTglBerakhirKontrak) {
      if (mounted) {
        _selectedDateTglBerakhirKontrak = picked;
        _formattedDateTglBerakhirKontrak =
            DateFormat('dd-MM-yyyy').format(_selectedDateTglBerakhirKontrak);
        _dateEditTglBerakhirKontrak = _formattedDateTglBerakhirKontrak;

        setState(() {});
      }
    }
  }

  Future<void> selectFilterDateTglPengiriman(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTglPengiriman,
      firstDate: DateTime.now(),
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
    if (picked != null && picked != _selectedDateTglPengiriman) {
      if (mounted) {
        _selectedDateTglPengiriman = picked;
        _formattedDateTglPengiriman =
            DateFormat('dd-MM-yyyy').format(_selectedDateTglPengiriman);
        _dateEditTglPengiriman = _formattedDateTglPengiriman;

        setState(() {});
      }
    }
  }

  Future<void> selectFilterDateTglMulaiPekerjaan(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTglMulaiPekerjaan,
      firstDate: DateTime.now(),
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
    if (picked != null && picked != _selectedDateTglMulaiPekerjaan) {
      if (mounted) {
        _selectedDateTglMulaiPekerjaan = picked;
        _formattedDateTglMulaiPekerjaan =
            DateFormat('dd-MM-yyyy').format(_selectedDateTglMulaiPekerjaan);
        _dateEditTglMulaiPekerjaan = _formattedDateTglMulaiPekerjaan;

        setState(() {});
      }
    }
  }

  Future<void> selectFilterDateTglAkhirPekerjaan(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTglAkhirPekerjaan,
      firstDate: DateTime.now(),
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
    if (picked != null && picked != _selectedDateTglAkhirPekerjaan) {
      if (mounted) {
        _selectedDateTglAkhirPekerjaan = picked;
        _formattedDateTglAkhirPekerjaan =
            DateFormat('dd-MM-yyyy').format(_selectedDateTglAkhirPekerjaan);
        _dateEditTglAkhirPekerjaan = _formattedDateTglAkhirPekerjaan;

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
                            "Id Penawaran",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          DropdownSearch<String>(
                            dropdownDecoratorProps: DropDownDecoratorProps(
                                textAlign: TextAlign.left,
                                dropdownSearchDecoration: InputDecoration(
                                  filled: true,
                                  fillColor: lightText,
                                  iconColor: darkText,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
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
                                )),
                            popupProps: const PopupProps.menu(
                              fit: FlexFit.loose,
                              showSelectedItems: false,
                              menuProps: MenuProps(
                                backgroundColor: Color(0xffE5E5E5),
                              ),
                            ),
                            items: ["Vendor a", "Vendor b", "Vendor c"],
                            onChanged: (val) {
                              selectedIdPenawaran = val!;
                              setState(() {});
                            },
                            selectedItem: selectedIdPenawaran,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama Vendor",
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
                          TextFieldYa(controllerTotalNilaiKontrak),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masukkan Tanggal Mulai Kontrak",
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
                                    _dateEditTglMulaiKontrak,
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        selectFilterDateTglMulaiKontrak(context)
                                            .whenComplete(
                                                () => setState(() {}));
                                      },
                                      child: const Icon(Icons.calendar_month)),
                                ],
                              ),
                            ),
                          ),
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
                            "Masukkan Tanggal Berakhir Kontrak",
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
                                    _dateEditTglBerakhirKontrak,
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        selectFilterDateTglBerakhirKontrak(
                                                context)
                                            .whenComplete(
                                                () => setState(() {}));
                                      },
                                      child: const Icon(Icons.calendar_month)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masukkan Tanggal Pengiriman",
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
                                    _dateEditTglPengiriman,
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        selectFilterDateTglPengiriman(context)
                                            .whenComplete(
                                                () => setState(() {}));
                                      },
                                      child: const Icon(Icons.calendar_month)),
                                ],
                              ),
                            ),
                          ),
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
                            "Masukkan Tanggal Pengerjaan Dimulai",
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
                                    _dateEditTglMulaiPekerjaan,
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        selectFilterDateTglMulaiPekerjaan(
                                                context)
                                            .whenComplete(
                                                () => setState(() {}));
                                      },
                                      child: const Icon(Icons.calendar_month)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masukkan Tanggal Pengerjaan Berakhir",
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
                                    _dateEditTglAkhirPekerjaan,
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        selectFilterDateTglAkhirPekerjaan(
                                                context)
                                            .whenComplete(
                                                () => setState(() {}));
                                      },
                                      child: const Icon(Icons.calendar_month)),
                                ],
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
                    onPressed: () {},
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

class BuatPembayaranPage extends StatefulWidget {
  const BuatPembayaranPage({Key? key}) : super(key: key);

  @override
  State<BuatPembayaranPage> createState() => _BuatPembayaranPageState();
}

class _BuatPembayaranPageState extends State<BuatPembayaranPage> {
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

  TextFieldYa(_controller) {
    return TextField(
      readOnly: false,
      controller: _controller,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BuatPembayaranVendorPage()));
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
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                    datCol("Id Kontrak"),
                                    datCol("Id Pembayaran Vendor"),
                                    datCol("Jumlah Pembayaran"),
                                    datCol("Tanggal Pembayaran"),
                                  ],
                                  rows: List.generate(
                                    1,
                                    (indexItem) {
                                      return DataRow(
                                        cells: [
                                          datRow1("001"),
                                          datRow1("sagawp"),
                                          datRow1("193.976.250"),
                                          datRow1("2023-06-25"),
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
                              1,
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
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ImagePembayaranPage(),
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
                                                  Icons.image,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
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
                                                  Icons.delete_forever,
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
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ));
  }
}

class BuatPembayaranVendorPage extends StatefulWidget {
  const BuatPembayaranVendorPage({Key? key}) : super(key: key);

  @override
  State<BuatPembayaranVendorPage> createState() =>
      _BuatPembayaranVendorPageState();
}

class _BuatPembayaranVendorPageState extends State<BuatPembayaranVendorPage> {
  HomeService homeService = HomeService();

  List<String> listIdKontrak = List.empty(growable: true);
  String selectedIdPenawaran = "";
  final controllerJumPem = TextEditingController();

  DateTime _selectedDateTglPem = DateTime.now();
  String _formattedDateTglPem = "";
  String _dateEditTglPem = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controllerJumPem.dispose();
    super.dispose();
  }

  Future<void> selectFilterDateTglPem(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTglPem,
      firstDate: DateTime.now(),
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
    if (picked != null && picked != _selectedDateTglPem) {
      if (mounted) {
        _selectedDateTglPem = picked;
        _formattedDateTglPem =
            DateFormat('dd-MM-yyyy').format(_selectedDateTglPem);
        _dateEditTglPem = _formattedDateTglPem;

        setState(() {});
      }
    }
  }

  TextFieldYa3() {
    return TextField(
      readOnly: true,
      showCursor: false,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: false,
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
                            "Masukkan Id Kontrak",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          DropdownSearch<String>(
                            dropdownDecoratorProps: DropDownDecoratorProps(
                                textAlign: TextAlign.left,
                                dropdownSearchDecoration: InputDecoration(
                                  filled: true,
                                  fillColor: lightText,
                                  iconColor: darkText,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
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
                                )),
                            popupProps: const PopupProps.menu(
                              fit: FlexFit.loose,
                              showSelectedItems: false,
                              menuProps: MenuProps(
                                backgroundColor: Color(0xffE5E5E5),
                              ),
                            ),
                            items: ["Id a", "Id b", "Id c"],
                            onChanged: (val) {
                              selectedIdPenawaran = val!;
                              setState(() {});
                            },
                            selectedItem: selectedIdPenawaran,
                          ),
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
                          TextFieldYa2(controllerJumPem),
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
                            "Masukkan Tanggal Mulai Kontrak",
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
                                    _dateEditTglPem,
                                    style: GoogleFonts.notoSans(
                                      color: darkText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        selectFilterDateTglPem(context)
                                            .whenComplete(
                                                () => setState(() {}));
                                      },
                                      child: const Icon(Icons.calendar_month)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masukkan Total Nilai Kontrak",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: lightText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFieldYa3(),
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
                    onPressed: () {},
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
