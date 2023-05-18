import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uas_kendrew/themes/colors.dart';

import '../themes/floatingactionwidget.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  DateTime _selectedDateEditLaporan = DateTime.now();
  String _formattedDateEditLaporan = "";
  String _dateEditLaporan = "";

  Future<void> selectFilterDateEditLaporan(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateEditLaporan,
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
    if (picked != null && picked != _selectedDateEditLaporan) {
      if (mounted) {
        _selectedDateEditLaporan = picked;
        _formattedDateEditLaporan =
            DateFormat('dd-MM-yyyy').format(_selectedDateEditLaporan);
        _dateEditLaporan = _formattedDateEditLaporan;

        setState(() {});
      }
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

  _showEditLaporan(dw, dh) {
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
                              "Edit Laporan",
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
                                          "Laporan",
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
                                          "Tanggal Laporan",
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(9),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  _dateEditLaporan,
                                                  style: GoogleFonts.notoSans(
                                                    color: darkText,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      selectFilterDateEditLaporan(
                                                              context)
                                                          .whenComplete(() =>
                                                              setState(() {}));
                                                    },
                                                    child: const Icon(
                                                        Icons.calendar_month)),
                                              ],
                                            ),
                                          ),
                                        ),
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
                builder: (context) => const BuatLaporanPage(),
              ),
            );
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
                        constraints: BoxConstraints(minWidth: deviceWidth),
                        child: DataTable(
                            border: TableBorder.all(
                              color: Colors.black.withOpacity(0.5),
                              style: BorderStyle.solid,
                            ),
                            headingRowHeight: 50,
                            dataRowHeight: 50,
                            columns: [
                              datCol("Id"),
                              datCol("Laporan"),
                              datCol("Tanggal Pelaporan"),
                              datCol("Status Laporan"),
                            ],
                            rows: List.generate(5, (index) {
                              return DataRow(cells: [
                                datRow1("P001"),
                                datRow1("wfaggagawgawg"),
                                datRow1("18/04/23"),
                                datRow1("")
                              ]);
                            })),
                      ),
                    ),
                  ),
                  DataTable(
                    border: TableBorder(
                        top: BorderSide(color: Colors.black.withOpacity(0.5)),
                        bottom:
                            BorderSide(color: Colors.black.withOpacity(0.5)),
                        right: BorderSide(color: Colors.black.withOpacity(0.5)),
                        horizontalInside: BorderSide(
                            color: Colors.black.withOpacity(0.5),
                            style: BorderStyle.solid)),
                    headingRowHeight: 50,
                    dataRowHeight: 50,
                    columns: [
                      datCol(""),
                    ],
                    rows: List.generate(
                      5,
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
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      height: 40,
                                      child: const Center(
                                        child: Icon(
                                          Icons.check_box,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () {
                                      _showEditLaporan(
                                          deviceWidth, deviceHeight);
                                    },
                                    child: Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: darkText,
                                            width: 0.4,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(5),
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
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ImageLaporanPage(),
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
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      height: 40,
                                      child: const Center(
                                        child: Icon(
                                          Icons.arrow_forward,
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
        ));
  }
}

class BuatLaporanPage extends StatefulWidget {
  const BuatLaporanPage({super.key});

  @override
  State<BuatLaporanPage> createState() => _BuatLaporanPageState();
}

class _BuatLaporanPageState extends State<BuatLaporanPage> {
  DateTime _selectedDateLaporan = DateTime.now();
  String _formattedDateLaporan = "";
  String _dateLaporan = "";

  Future<void> selectFilterDateLaporan(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateLaporan,
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
    if (picked != null && picked != _selectedDateLaporan) {
      if (mounted) {
        _selectedDateLaporan = picked;
        _formattedDateLaporan =
            DateFormat('dd-MM-yyyy').format(_selectedDateLaporan);
        _dateLaporan = _formattedDateLaporan;

        setState(() {});
      }
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
                              "Laporan",
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
                              "Tanggal Laporan",
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
                                      _dateLaporan,
                                      style: GoogleFonts.notoSans(
                                        color: darkText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          selectFilterDateLaporan(context)
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
        ));
  }
}

class ImageLaporanPage extends StatefulWidget {
  const ImageLaporanPage({super.key});

  @override
  State<ImageLaporanPage> createState() => _ImageLaporanPageState();
}

class _ImageLaporanPageState extends State<ImageLaporanPage> {
  List<Asset> _selectedImages = [];

  Future<void> _pickImages() async {
    List<Asset> resultList = [];
    String error = '';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: _selectedImages,
      );
    } catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      _selectedImages = resultList;
      if (error.isNotEmpty) {
        // Handle error if necessary
      }
    });
  }

  void _deleteImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: List.generate(_selectedImages.length, (index) {
                    Asset asset = _selectedImages[index];
                    return Stack(
                      children: [
                        AssetThumb(
                        asset: asset,
                        width: 300,
                        height: 300,
                      ),
                      Positioned(
                        top: 1,
                        right: 1,
                        child: IconButton(
                          icon: Icon(Icons.delete, color: lightText,),
                          onPressed: () {
                            _deleteImage(index);
                          },
                        ),
                      ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _pickImages,
                    child: Text(
                      "Upload Gambar",
                      style: GoogleFonts.notoSans(
                        color: lightText,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(15),
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
            ],
          ),
        ),
      ),
    );
  }
}
