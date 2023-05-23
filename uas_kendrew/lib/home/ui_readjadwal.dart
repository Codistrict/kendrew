import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../themes/colors.dart';
import '../themes/floatingactionwidget.dart';

class ReadJadwalPage extends StatefulWidget {
  const ReadJadwalPage({super.key});

  @override
  State<ReadJadwalPage> createState() => _ReadJadwalPageState();
}

class _ReadJadwalPageState extends State<ReadJadwalPage> {
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
        floatingActionButton: CustomFAB(
          icon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
                child: const Icon(
                  Icons.arrow_forward,
                  color: lightText,
                ),
                backgroundColor: buttonColor,
                onTap: () {},
                label: 'Lihat Jadwal',
                labelStyle: GoogleFonts.inter(
                  fontSize: 16,
                  color: lightText,
                  fontWeight: FontWeight.w500,
                ),
                labelBackgroundColor: buttonColor),
            // FAB 2
            SpeedDialChild(
                child: const Icon(
                  Icons.edit,
                  color: lightText,
                ),
                backgroundColor: buttonColor,
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditDepenPage(),
                    ),
                  );
                },
                label: 'Edit Depedencies',
                labelStyle: GoogleFonts.inter(
                  fontSize: 16,
                  color: lightText,
                  fontWeight: FontWeight.w500,
                ),
                labelBackgroundColor: buttonColor),
          ],
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
              padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Dimulai Pekerjaan",
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
                            ": 06-06-2022",
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
                                      datCol("Id"),
                                      datCol("Nama Tugas"),
                                      datCol("Lama Pengerjaan"),
                                      datCol("Start"),
                                      datCol("End"),
                                    ],
                                    rows: List.generate(3, (index) {
                                      return DataRow(cells: [
                                        datRow1("P-1"),
                                        datRow1("fwfawgawgagaha"),
                                        datRow1(""),
                                        datRow1(""),
                                        datRow1(""),
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
                ],
              ),
            ),
          ),
        ));
  }
}

class EditDepenPage extends StatefulWidget {
  const EditDepenPage({super.key});

  @override
  State<EditDepenPage> createState() => _EditDepenPageState();
}

class _EditDepenPageState extends State<EditDepenPage> {
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
        floatingActionButton: CustomFAB(
          icon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
                child: const Icon(
                  Icons.arrow_forward,
                  color: lightText,
                ),
                backgroundColor: buttonColor,
                onTap: () {},
                label: 'Generate Jadwal Chart',
                labelStyle: GoogleFonts.inter(
                  fontSize: 16,
                  color: lightText,
                  fontWeight: FontWeight.w500,
                ),
                labelBackgroundColor: buttonColor),
          ],
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
              padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tnggal Dimulai Pekerjaan",
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
                            ": 06-06-2022",
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
                                      datCol("Id"),
                                      datCol("Nama Pekerjaan"),
                                      datCol("Lama Pengerjaan"),
                                      datCol("Depedencies"),
                                    ],
                                    rows: List.generate(3, (index) {
                                      return DataRow(cells: [
                                        datRow1("P-1"),
                                        datRow1("fwfawgawgagaha"),
                                        datRow1("100"),
                                        datRow1("10000"),
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 8, 0),
                                              //width: 40,
                                              decoration: BoxDecoration(
                                                color: buttonColor,
                                                border: Border.all(
                                                    color: buttonColor,
                                                    width: 0.4,
                                                    style: BorderStyle.solid),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              height: 40,
                                              child: Center(
                                                child: Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.add,
                                                      size: 20,
                                                      color: lightText,
                                                    ),
                                                    SizedBox(width: 6),
                                                    Text(
                                                      "Depedencies",
                                                      style: TextStyle(
                                                          color: lightText),
                                                    )
                                                  ],
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
                ],
              ),
            ),
          ),
        ));
  }
}
